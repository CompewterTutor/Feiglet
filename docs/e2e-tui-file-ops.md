# E2E Testing — TUI File Operations, Undo/Redo, Export

Binary: `figby-rs/target/debug/figby --tui`

---

## 1. Save Font

### 1.1 Save As (`Ctrl+Shift+S`)
- [ ] Open font editor, make edits to a glyph
- [ ] Press `Ctrl+Shift+S`
- [ ] File dialog opens (path entry + directory browser)
- [ ] Type a path like `/tmp/myfont.flf`
- [ ] `Enter` confirms
- [ ] Throbber spins ("Saving...")
- [ ] File written to disk
- [ ] `ls -la /tmp/myfont.flf` — file exists, non-empty
- [ ] Notes:

### 1.2 `.flf` extension auto-added
- [ ] Save As with path `/tmp/testfont` (no extension)
- [ ] File saved as `/tmp/testfont.flf`
- [ ] Notes:

### 1.3 Save (`Ctrl+S`)
- [ ] First save: same as Save As (dialog)
- [ ] After Save As: `Ctrl+S` saves to same path without dialog
- [ ] Throbber shows "Saving..."
- [ ] Notes:

### 1.4 Unsaved indicator
- [ ] Make edits — status bar shows unsaved indicator (`!` or `*`)
- [ ] Save — indicator disappears
- [ ] Notes:

### 1.5 File dialog Tab to select
- [ ] In save dialog, `Tab` selects directory entry
- [ ] Arrow keys navigate
- [ ] Notes:

---

## 2. Open Font

### 2.1 Open via `Ctrl+O`
- [ ] Press `Ctrl+O`
- [ ] File dialog opens with directory browser
- [ ] Filtered to `.flf`/`.tlf` files
- [ ] Navigate to `/tmp/myfont.flf`
- [ ] `Enter` opens it
- [ ] Throbber shows "Loading..."
- [ ] Font loaded into editor
- [ ] Notes:

### 2.2 Open recent file
- [ ] After opening a font, press `Ctrl+O`
- [ ] Digits 1-9 select recent files
- [ ] Press `1` — loads most recent
- [ ] Notes:

### 2.3 Recent files persisted
- [ ] Quit TUI (`q`)
- [ ] Re-launch TUI
- [ ] Press `Ctrl+O`
- [ ] Previously opened fonts still in recent list
- [ ] Notes:

### 2.4 Open standard font
```bash
# Copy a known font
cp fonts/standard.flf /tmp/
```
- [ ] Open in TUI via `Ctrl+O` → `/tmp/standard.flf`
- [ ] All 102 glyphs present
- [ ] Renders correctly
- [ ] Notes:

---

## 3. Export

### 3.1 Open Export dialog (`Ctrl+E`)
- [ ] Press `Ctrl+E`
- [ ] Export dialog opens (overlay)
- [ ] Shows format, path entry, directory browser
- [ ] Notes:

### 3.2 Cycle export formats
- [ ] Press `T` in export dialog
- [ ] Cycles: PNG → GIF → TXT → PNG
- [ ] Format label updates
- [ ] Notes:

### 3.3 Export as TXT
- [ ] Open export dialog
- [ ] Cycle to TXT format
- [ ] Enter path: `/tmp/export.txt`
- [ ] `Enter` confirms
- [ ] Throbber spins ("Exporting...")
- [ ] File written
- [ ] `cat /tmp/export.txt` — contains ASCII art
- [ ] Notes:

### 3.4 Export as PNG
- [ ] Cycle to PNG format
- [ ] Enter path: `/tmp/export.png`
- [ ] `Enter` confirms
- [ ] File written
- [ ] View `/tmp/export.png` — rendered ASCII art as image
- [ ] Notes:

### 3.5 Export as GIF
- [ ] Cycle to GIF format
- [ ] Enter path: `/tmp/export.gif`
- [ ] File written
- [ ] Notes:

### 3.6 Export from Image Editor
- [ ] Switch to Image Editor (`Ctrl+Tab`)
- [ ] Load an image
- [ ] `Ctrl+E` exports current image view
- [ ] Notes:

---

## 4. Undo/Redo System

### 4.1 Basic undo
- [ ] Paint some cells
- [ ] `Ctrl+Z` — reverts the paint
- [ ] Notes:

### 4.2 Redo after undo
- [ ] After undo, `Ctrl+Y` or `Ctrl+Shift+Z` — redoes
- [ ] Notes:

### 4.3 Multiple undo
- [ ] Paint, line, fill in sequence
- [ ] `Ctrl+Z` × multiple — undoes each in reverse order
- [ ] Notes:

### 4.4 Batching (drag operations)
- [ ] Click+drag brush stroke (continuous)
- [ ] Single undo reverts entire drag (not each cell)
- [ ] Notes:

### 4.5 Undo panel toggle
- [ ] `Ctrl+Shift+H` — opens undo history panel
- [ ] Shows action list (newest first)
- [ ] Current entry highlighted
- [ ] `Up`/`Down` scroll
- [ ] `Esc` closes
- [ ] Notes:

### 4.6 Mode switch clears undo
- [ ] Switch to Image Editor, back to Font Editor
- [ ] Undo history is empty
- [ ] Notes:

### 4.7 Settings change clears undo
- [ ] Make edits, open settings (`S`), change width
- [ ] Undo history cleared
- [ ] Notes:

---

## 5. Copy / Duplicate Font

### 5.1 Duplicate font via Transform menu
- [ ] Open Transform Editor (`T`)
- [ ] Select "Duplicate Font"
- [ ] New copy named "Untitled Copy" created
- [ ] Current path cleared
- [ ] Notes:

### 5.2 Verify independent copy
- [ ] Make edit in copy
- [ ] Switch back to original — unchanged
- [ ] Notes:

---

## 6. Auto-Save (if configured)

### 6.1 Auto-save trigger
- [ ] Configure `auto_save_interval` in config if supported
- [ ] Make edits, wait for interval
- [ ] Throbber shows "Auto-saving..."
- [ ] Notes:

---

## Notes / Bugs

| # | Section | Issue | Severity |
|---|---------|-------|----------|
|   |         |       |          |
