#!/bin/sh
# make-examples - Generate example FIGlet output for every font.
#
# Usage:
#   ./scripts/make-examples.sh
#   ./scripts/make-examples.sh --sample-text="FIGBY!"
#   ./scripts/make-examples.sh --fonts=standard,big
#   ./scripts/make-examples.sh --exclude=banner,block
#   ./scripts/make-examples.sh --categories=normal
#
# Options:
#   --sample-text <text>   Text to render (default: "hello figby")
#   --fonts <list>         Comma-separated font whitelist
#   --exclude <list>       Comma-separated font blacklist
#   --categories <list>    Category filter (parsed but not yet implemented)
#
# Output: Writes one .txt file per font to examples/

set -e

REPO_ROOT="$(git -C "$(dirname "$0")" rev-parse --show-toplevel 2>/dev/null)"

if [ -z "$REPO_ROOT" ]; then
  echo "Error: must be run from within the Figby repository." >&2
  exit 1
fi

cd "$REPO_ROOT"

# --- Defaults ---
SAMPLE_TEXT="hello figby"
FONTS_WHITELIST=""
FONTS_BLACKLIST=""
CATEGORIES=""

# --- Arg parsing ---
while [ $# -gt 0 ]; do
  case "$1" in
    --sample-text=*)
      SAMPLE_TEXT="${1#*=}"
      ;;
    --fonts=*)
      FONTS_WHITELIST="${1#*=}"
      ;;
    --exclude=*)
      FONTS_BLACKLIST="${1#*=}"
      ;;
    --categories=*)
      CATEGORIES="${1#*=}"
      # Categories filter is not yet implemented.
      ;;
    *)
      echo "Error: unknown option: $1" >&2
      echo "Usage: $0 [--sample-text=<text>] [--fonts=<list>] [--exclude=<list>] [--categories=<list>]" >&2
      exit 1
      ;;
  esac
  shift
done

# --- Resolve figby binary ---
FIGBY=""
if command -v figby >/dev/null 2>&1; then
  FIGBY="figby"
elif [ -x "figby-rs/target/debug/figby" ]; then
  FIGBY="figby-rs/target/debug/figby"
elif [ -x "target/debug/figby" ]; then
  FIGBY="target/debug/figby"
else
  echo "Figby binary not found. Building..." >&2
  cargo build --manifest-path figby-rs/Cargo.toml -p figby 2>&1
  if [ -x "figby-rs/target/debug/figby" ]; then
    FIGBY="figby-rs/target/debug/figby"
  else
    echo "Error: failed to build figby binary." >&2
    exit 1
  fi
fi

# --- Output directory ---
OUTDIR="examples"
mkdir -p "$OUTDIR"

# Write .gitkeep so the directory is tracked even when empty.
: > "$OUTDIR/.gitkeep"

# --- Font discovery ---
find fonts/ -maxdepth 1 -type f \( -name '*.flf' -o -name '*.tlf' \) | sort > /tmp/figby-fonts-$$.txt
trap 'rm -f /tmp/figby-fonts-$$.txt' EXIT

# --- Generate examples ---
count=0
failed=0

while IFS= read -r font_path; do
  font_name="$(basename "$font_path")"
  font_stem="${font_name%.*}"

  # Whitelist filter: skip if font_stem not in comma-separated list
  if [ -n "$FONTS_WHITELIST" ]; then
    case ",$FONTS_WHITELIST," in
      *,"$font_stem",*) ;;
      *) continue ;;
    esac
  fi

  # Blacklist filter: skip if font_stem in comma-separated list
  if [ -n "$FONTS_BLACKLIST" ]; then
    case ",$FONTS_BLACKLIST," in
      *,"$font_stem",*) continue ;;
    esac
  fi

  output_file="$OUTDIR/${font_stem}.txt"

  if ! "$FIGBY" -d fonts/ -f "$font_stem" "$SAMPLE_TEXT" > "$output_file" 2>/dev/null; then
    echo "Warning: figby failed for font '$font_name'" >&2
    rm -f "$output_file"
    failed=$((failed + 1))
    continue
  fi

  count=$((count + 1))
done < /tmp/figby-fonts-$$.txt

echo "Generated $count example files in '$OUTDIR/'."
if [ "$failed" -gt 0 ]; then
  echo "$failed font(s) produced errors." >&2
fi
