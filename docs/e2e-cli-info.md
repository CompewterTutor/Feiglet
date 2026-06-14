# E2E Testing — CLI Info Codes, Help, Control Files, Multibyte

Binary: `figby-rs/target/debug/figby`

---

## 1. Help & Version

### 1.1 `--help` / `-h`
```bash
./figby-rs/target/debug/figby --help
```
- [ ] Shows all flags with descriptions
- [ ] Shows usage line
- [ ] Exits 0
- [ ] Notes:

### 1.2 `--long-help`
```bash
./figby-rs/target/debug/figby --long-help
```
- [ ] Shows extended descriptions
- [ ] Notes:

### 1.3 `-v` (version)
```bash
./figby-rs/target/debug/figby -v
```
- [ ] Exits 0
- [ ] Prints version string
- [ ] Notes:

---

## 2. Info Codes (`-I`)

### 2.1 `-I 0` — copyright/license
```bash
./figby-rs/target/debug/figby -I 0
```
- [ ] Output contains "FIGlet Copyright"
- [ ] Output contains "figby"
- [ ] Notes:

### 2.2 `-I 1` — version integer
```bash
./figby-rs/target/debug/figby -I 1
```
- [ ] Output is a number (20205 for FIGlet 2.2.5 compat)
- [ ] Notes:

### 2.3 `-I 2` — font directory
```bash
./figby-rs/target/debug/figby -I 2
```
- [ ] Output is the default font directory path
- [ ] `-d /my/fonts -I 2` reflects the override
- [ ] Notes:

### 2.4 `-I 3` — font name
```bash
./figby-rs/target/debug/figby -I 3
./figby-rs/target/debug/figby -f big -I 3
```
- [ ] Default shows "standard"
- [ ] `-f big` shows "big"
- [ ] Notes:

### 2.5 `-I 4` — output width
```bash
./figby-rs/target/debug/figby -I 4
./figby-rs/target/debug/figby -w 120 -I 4
```
- [ ] Default is 80
- [ ] `-w 120` shows 120
- [ ] Notes:

### 2.6 `-I 5` — supported formats
```bash
./figby-rs/target/debug/figby -I 5
```
- [ ] Output contains `flf2 tlf2`
- [ ] Notes:

### 2.7 `-I` with `-t` (terminal width)
```bash
./figby-rs/target/debug/figby -t -I 4
```
- [ ] Width matches terminal columns
- [ ] Notes:

---

## 3. Control Files (`-C`)

### 3.1 Basic control file
```bash
printf "Hello\nWorld\n" | ./figby-rs/target/debug/figby -C fonts/standard.flc
```
- [ ] Control file loads without error
- [ ] Output reflects control file settings (font, layout, etc.)
- [ ] Notes:

### 3.2 Control file error handling
```bash
./figby-rs/target/debug/figby -C /nonexistent.flc "hello"
```
- [ ] Error message printed
- [ ] Exits non-zero
- [ ] Notes:

---

## 4. Multibyte & Input Modes

### 4.1 Disable multibyte (`-N`)
```bash
printf "Hello" | ./figby-rs/target/debug/figby -N
```
- [ ] Basic ASCII still renders
- [ ] Notes:

### 4.2 Command-line input (`-A`)
```bash
./figby-rs/target/debug/figby -A Hello World
```
- [ ] Renders "Hello World"
- [ ] Arguments treated as input (not filenames)
- [ ] Notes:

### 4.3 Positional args as input
```bash
./figby-rs/target/debug/figby "Hello from args"
```
- [ ] Renders the text
- [ ] Notes:

### 4.4 Stdin input (no args)
```bash
echo "Hello from stdin" | ./figby-rs/target/debug/figby
```
- [ ] Renders piped text
- [ ] Notes:

---

## 5. Other Flags

### 5.1 `-F` (not implemented)
```bash
./figby-rs/target/debug/figby -F
```
- [ ] Prints error: "-F option is not implemented"
- [ ] Exits non-zero
- [ ] Notes:

### 5.2 `--to-file`
```bash
echo "Hello" | ./figby-rs/target/debug/figby --to-file /tmp/figby_output.txt
cat /tmp/figby_output.txt
```
- [ ] Output written to file (may be no-op — check behavior)
- [ ] Notes:

---

## 6. Edge Cases

### 6.1 Empty input
```bash
echo "" | ./figby-rs/target/debug/figby
```
- [ ] Exits cleanly
- [ ] No output (or blank line)
- [ ] Notes:

### 6.2 Multiple `-I` not chained (last wins)
```bash
./figby-rs/target/debug/figby -I 1 -I 3
```
- [ ] Only info code 3 prints
- [ ] Notes:

### 6.3 Flag last-wins semantics
```bash
./figby-rs/target/debug/figby -k -s -I 1
./figby-rs/target/debug/figby -s -k -I 1
```
- [ ] Last layout flag takes effect
- [ ] Notes:

### 6.4 `-t` with unavailable terminal
- [ ] Falls back gracefully without panic
- [ ] Notes:

---

## Notes / Bugs

| # | Section | Issue | Severity |
|---|---------|-------|----------|
|   |         |       |          |
