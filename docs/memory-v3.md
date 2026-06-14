# Figby v3 — Memory

Phase-by-phase implementation log for the v3 release.

## Phase 3.0 — Manual Testing & Audit

### Bugfix: `--create-font` produces invisible output

Three bugs fixed in `figby-rs/src/font_gen.rs` and `figby-rs/src/font.rs`:

1. **font_candidates path extension doubling** (`font.rs:font_candidates`): When `-f` receives a full path with `.flf` extension, the function appended another `.flf` → looked for `foo.flf.flf`. Fix: try bare path first when name contains a separator.

2. **Canvas too short for FreeType bitmap** (`font_gen.rs:system_font_to_figfont`): `raster_bounds` computes outline bounds (e.g., 9px for 'A' at 12pt), but font-kit's FreeType `rasterize_glyph` places the bitmap at `-bitmap_top` which can be 1px higher than `raster_bounds.origin_y`. Canvas allocated at bounds height → bitmap outside canvas → all-zero pixels. Fix: allocate canvas at full `charheight` and shift baseline via `transform.vector.y` so the FreeType origin aligns with the FIGfont baseline row. Added `canvas_to_figcharacter_cell` helper.

3. **Hardblank used for glyph fill** (`font_gen.rs:canvas_to_figcharacter`): Mapped all rendered pixels to `hardblank` (`$`), which by FIGfont spec displays as space → invisible output. Changed to use `'@'` for glyph fill, reserving `$` for hardblank (used only in font header).

### Learnings
- font-kit 0.14 FreeType backend's `raster_bounds` and `rasterize_glyph` can disagree on vertical positioning by ~1px. Always allocate cell-sized canvases.
- FIGfont hardblanks display as space in output — never use `$` for visible glyph content in generated fonts.
- `has_path_separator` check in `font_candidates` must account for bare paths with existing extensions.

### E2E test checklists created
- 9 checklist files in `docs/e2e-*.md` covering `--create-font`, CLI info codes, template system, image pipeline, and all TUI editor features (~275 test cases).

---

## Phase 3.1 — Layers, Blending & Compositing

(To be filled during implementation.)

---

## Phase 3.2 — Animation Timeline & Playback

(To be filled during implementation.)

---

## Phase 3.3 — Particle Effect Creator

(To be filled during implementation.)

---

## Phase 3.4 — Animation Exporter

(To be filled during implementation.)

---

## Phase 3.5 — Animation Player (Standalone Widget)

(To be filled during implementation.)

---

## Phase 3.6 — Major Release

(To be filled during release.)
