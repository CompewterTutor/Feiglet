# E2E Testing — TUI Font Editor Mode

Binary: `figby-rs/target/debug/figby --tui`

Default mode is Font Editor. Tests start from there.

---

## 1. Glyph Grid Overview

### 1.1 Grid display
- [ ] Grid of all 102 required FIGcharacters visible
- [ ] Each cell shows code number + mini glyph preview
- [ ] Navigation with arrow keys
- [ ] Grid wraps by column count
- [ ] Notes:

### 1.2 Search/filter
- [ ] `/` activates search
- [ ] Type code number (e.g. `65`) — filters to matching chars
- [ ] Type character (e.g. `A`) — filters to matching chars
- [ ] `Esc` clears search and restores full grid
- [ ] Notes:

### 1.3 Open glyph in CharEditor
- [ ] Navigate to a glyph, press `Enter`
- [ ] CharEditor opens with glyph displayed on canvas
- [ ] Canvas sized to glyph dimensions
- [ ] Notes:

### 1.4 Return to overview
- [ ] In CharEditor, press `Esc` — returns to glyph grid overview
- [ ] Notes:

---

## 2. Per-Character Canvas Editing

### 2.1 Draw on glyph
- [ ] Open a glyph in CharEditor
- [ ] Select Brush tool (`b`)
- [ ] Paint on canvas — glyph updates in real time
- [ ] Notes:

### 2.2 Erase glyph cells
- [ ] Select Eraser (`e`)
- [ ] Erase cells — glyph clears
- [ ] Notes:

### 2.3 All drawing tools work in CharEditor
- [ ] Brush, Eraser, Line, Fill, Eyedropper, Spray all work
- [ ] Selection tools also work
- [ ] Notes:

### 2.4 Changes persist after returning to overview
- [ ] Edit glyph in CharEditor
- [ ] Return to overview (`Esc`)
- [ ] Re-open same glyph — changes still there
- [ ] Notes:

---

## 3. Header Editor

### 3.1 Open Header Editor
- [ ] In glyph grid overview, press `H`
- [ ] HeaderEditor opens showing 7 fields
- [ ] Notes:

### 3.2 Edit header fields
- [ ] `Up`/`Down` navigate fields:
  - Hardblank (1 char)
  - Char Height (≥1)
  - Baseline (≤ height)
  - Max Length
  - Full Layout
  - Print Direction (-1, 0, or 1)
  - Comment Lines
- [ ] `Enter` starts editing field
- [ ] Type new value, `Enter` confirms
- [ ] `Esc` cancels edit
- [ ] Notes:

### 3.3 Validation
- [ ] Hardblank must be 1 char — error if invalid
- [ ] Height must be ≥ 1 — non-numbers rejected
- [ ] Baseline must be ≤ Height — error if > Height
- [ ] Print Direction must be -1, 0, or 1
- [ ] Notes:

### 3.4 Header changes affect rendering
- [ ] Change height — glyph grid updates
- [ ] Change hardblank — glyphs now use new hardblank char
- [ ] Notes:

---

## 4. Smushing Rule Editor

### 4.1 Open SmushRuleEditor
- [ ] In glyph grid overview, press `S`
- [ ] SmushRuleEditor opens with 6 toggleable rules
- [ ] Notes:

### 4.2 Toggle rules
- [ ] `Up`/`Down` navigate rules
- [ ] `Enter` or `Space` toggles rule bit on/off
- [ ] Rules: Equal Char, Underscore, Hierarchy, Pair, Big X, Hardblank
- [ ] Notes:

### 4.3 Preview updates
- [ ] Preview pane shows `/ + \ = result` using selected rules
- [ ] Toggling rules changes preview instantly
- [ ] Notes:

### 4.4 `Esc` returns to overview
- [ ] Notes:

---

## 5. Codetagged Characters

### 5.1 Add codetagged char
- [ ] In glyph grid overview, press `A`
- [ ] Enter codepoint number (e.g. `169` for ©)
- [ ] New empty glyph created at that code
- [ ] Now editable in CharEditor
- [ ] Notes:

### 5.2 Delete codetagged char
- [ ] Navigate to a codetagged char
- [ ] Press `D`
- [ ] Confirm with `Y` — glyph removed
- [ ] Cannot delete required ASCII/Deutsch chars?
- [ ] Char code 0 always exists (missing char fallback)
- [ ] Notes:

### 5.3 Copy glyph
- [ ] Press `C`
- [ ] Enter source code — glyph rows captured
- [ ] Enter destination code — glyph rows copied
- [ ] Notes:

### 5.4 Validation on add
- [ ] Code > 0x10FFFF rejected
- [ ] Code in surrogate range (0xD800–0xDFFF) rejected
- [ ] Duplicate codes handled appropriately
- [ ] Notes:

---

## 6. Font Transforms

### 6.1 Open Transform Editor
- [ ] In glyph grid overview, press `T`
- [ ] TransformEditor lists 8 transforms
- [ ] `Up`/`Down` navigate list
- [ ] `Enter` executes selected transform
- [ ] Notes:

### 6.2 Resize Font
- [ ] Select Resize Font
- [ ] Enter new height
- [ ] All glyphs padded or truncated to new height
- [ ] Maxlength updated
- [ ] Notes:

### 6.3 Italicize
- [ ] Select Italicize
- [ ] Each glyph row gets increasing left spaces (by row index)
- [ ] Notes:

### 6.4 Bold
- [ ] Select Bold
- [ ] Each character doubled horizontally (`c` → `cc`)
- [ ] Notes:

### 6.5 Mirror
- [ ] Select Mirror
- [ ] Sub-menu: Horizontal, Vertical, Both
- [ ] Horizontal: each row reversed
- [ ] Vertical: row order reversed
- [ ] Both: both axes flipped
- [ ] Notes:

### 6.6 Copy Glyph from another font
- [ ] Select Copy Glyph
- [ ] Enter source font name
- [ ] Enter code point to copy
- [ ] Glyph loaded and inserted
- [ ] Notes:

### 6.7 Rename font
- [ ] Select Rename
- [ ] Enter new name
- [ ] Font name updated
- [ ] Notes:

### 6.8 Duplicate Font
- [ ] Select Duplicate Font
- [ ] New copy created named "Untitled Copy"
- [ ] Current path cleared (forces Save As)
- [ ] Notes:

### 6.9 Import Font
- [ ] Select Import Font
- [ ] Enter path to external .flf file
- [ ] All glyphs merged into current font (overwrites duplicates)
- [ ] Notes:

---

## 7. Text Tool in Font Editor

### 7.1 Place FIGlet text
- [ ] Select Text tool (`t`)
- [ ] Click on canvas
- [ ] Type text — appears as typed
- [ ] `Enter` commits — renders as FIGlet text using current font
- [ ] Notes:

### 7.2 Select and move text block
- [ ] After committing text, block is selected (yellow dashed border)
- [ ] Arrow keys move block
- [ ] Notes:

### 7.3 Scale text block
- [ ] `+` scales up (1→2→3→4)
- [ ] `-` scales down (4→3→2→1)
- [ ] Notes:

### 7.4 Rotate text block
- [ ] `r` rotates 90° (cycles: 0→90→180→270→0)
- [ ] Notes:

### 7.5 Change justifications
- [ ] `j` cycles Left → Center → Right → Left
- [ ] Text re-renders with new justification
- [ ] Notes:

### 7.6 Re-edit text
- [ ] `Space` or `Enter` on selected block
- [ ] Type new text, `Enter` commits
- [ ] Notes:

### 7.7 Delete text block
- [ ] `Delete` or `Backspace` — removes selected block
- [ ] Notes:

### 7.8 Font selection
- [ ] Arrow Up/Down (when no block selected, not entering text)
- [ ] Cycles through available fonts
- [ ] Notes:

---

## 8. Undo/Redo in Font Editor

### 8.1 Undo paint operation
- [ ] Paint some cells on a glyph
- [ ] `Ctrl+Z` — undoes the paint
- [ ] Notes:

### 8.2 Redo
- [ ] `Ctrl+Y` or `Ctrl+Shift+Z` — redoes
- [ ] Notes:

### 8.3 Undo panel
- [ ] `Ctrl+Shift+H` — toggles undo history panel
- [ ] Shows list of actions (newest first)
- [ ] `Up`/`Down` scroll
- [ ] `Esc` closes
- [ ] Current entry highlighted
- [ ] Notes:

### 8.4 Mode switch clears undo
- [ ] Make edits, switch to Image Editor via Ctrl+Tab
- [ ] Switch back — undo history is empty
- [ ] Notes:

---

## Notes / Bugs

| # | Section | Issue | Severity |
|---|---------|-------|----------|
|   |         |       |          |
