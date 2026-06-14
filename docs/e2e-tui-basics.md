# E2E Testing — TUI Editor: Launch, Canvas, Tools, Palette, Brush

Binary: `figby-rs/target/debug/figby --tui`

All tests are manual interactive checks. Launch TUI with:
```bash
./figby-rs/target/debug/figby --tui
```

---

## 1. Launch & Quit

### 1.1 Launch TUI
- [ ] TUI opens without crash
- [ ] Shows three mode tabs: Font Editor, Image Editor, ASCII Preview
- [ ] Toolbox visible on left
- [ ] Canvas visible in center
- [ ] Status bar visible at bottom
- [ ] Palette visible on right
- [ ] Notes:

### 1.2 Quit via `q`
- [ ] Press `q` — exits TUI
- [ ] Terminal restored cleanly (no artifacts)
- [ ] Notes:

### 1.3 Quit via `Esc`
- [ ] Press `Esc` — exits TUI
- [ ] Terminal restored cleanly
- [ ] Notes:

---

## 2. Mode Switching (Ctrl+Tab / Ctrl+Shift+Tab)

### 2.1 Cycle modes forward
- [ ] Press `Ctrl+Tab` — switches to Image Editor
- [ ] Press `Ctrl+Tab` again — switches to ASCII Preview
- [ ] Press `Ctrl+Tab` again — wraps to Font Editor
- [ ] Notes:

### 2.2 Cycle modes backward
- [ ] Press `Ctrl+Shift+Tab` — cycles in reverse order
- [ ] Notes:

### 2.3 Tab icons
- [ ] Tabs show Nerd Font icons (from icons.yaml)
- [ ] Active tab highlighted with accent color
- [ ] Notes:

---

## 3. Canvas Operations

### 3.1 Cursor movement
- [ ] Arrow keys move cursor up/down/left/right
- [ ] Cursor stays within canvas bounds
- [ ] Cursor shown as inverted cell
- [ ] Notes:

### 3.2 Zoom in/out
- [ ] `+`/`=` zooms in (1→2→4→8)
- [ ] `-`/`_` zooms out (8→4→2→1)
- [ ] Zoom level shows in status bar (`Z: Nx`)
- [ ] Notes:

### 3.3 Grid toggle
- [ ] `G` toggles grid overlay on/off
- [ ] Grid visible when zoom > 1 (draws `─` `│` `┼` at cell boundaries)
- [ ] Grid uses DIM modifier
- [ ] Notes:

### 3.4 Scroll follows cursor
- [ ] Cursor near edge auto-scrolls canvas
- [ ] Notes:

---

## 4. Tool Selection

### 4.1 Keyboard shortcuts
- [ ] `b` — selects Brush tool
- [ ] `v` — selects Marquee/Select tool
- [ ] `l` — selects Lasso tool
- [ ] `c` — selects Circle selection tool
- [ ] `p` — selects Polygon selection tool
- [ ] `g` — selects Fill tool
- [ ] `i` — selects Line tool
- [ ] `e` — selects Eraser tool
- [ ] `d` — selects Eyedropper tool
- [ ] `a` — selects Spray tool
- [ ] `t` — selects Text tool
- [ ] Active tool highlighted in toolbox panel
- [ ] Notes:

### 4.2 Mouse tool selection
- [ ] Click tool icon in toolbox — selects tool
- [ ] Notes:

### 4.3 Menu tool selection
- [ ] Alt+T opens Tools menu — click or arrow to select tool
- [ ] Notes:

---

## 5. Drawing Tools — Brush

### 5.1 Basic brush stroke
- [ ] Select Brush tool (`b`)
- [ ] Click on canvas — paints one cell
- [ ] Click+drag — paints continuous stroke
- [ ] Brush char (`█` default) appears on canvas
- [ ] Notes:

### 5.2 Keyboard paint
- [ ] Move cursor to empty cell
- [ ] Press `Space` or `Enter` — paints at cursor position
- [ ] Notes:

### 5.3 Brush size
- [ ] `[` decreases brush size (down to 1)
- [ ] `]` increases brush size (up to 20)
- [ ] Size reflected in brush preview (5×5 mini-grid in toolbox)
- [ ] Larger brush paints wider stroke
- [ ] Notes:

### 5.4 Brush shape cycling
- [ ] `\` (backslash) cycles shapes: Square → Circle → SprayPaint → Custom → Square
- [ ] Brush preview updates to show shape
- [ ] Square: fills `size × size` block
- [ ] Circle: fills circular area
- [ ] SprayPaint: scattered pattern
- [ ] Custom: single cell at center
- [ ] Notes:

---

## 6. Drawing Tools — Eraser

### 6.1 Eraser basic
- [ ] Select Eraser (`e`)
- [ ] Click painted cell — erases it (becomes space)
- [ ] Click+drag — erases continuous stroke
- [ ] Notes:

### 6.2 Eraser respects brush size/shape
- [ ] Change brush size, eraser erases at that size
- [ ] Circle shape erases circular area
- [ ] Notes:

---

## 7. Drawing Tools — Line

### 7.1 Draw straight line
- [ ] Select Line tool (`i`)
- [ ] Click start position on canvas
- [ ] Drag to end position — preview line visible
- [ ] Release — straight line drawn using Bresenham
- [ ] Notes:

### 7.2 Line with different brush sizes
- [ ] Set brush size larger, draw line — thicker line
- [ ] Notes:

---

## 8. Drawing Tools — Fill

### 8.1 Flood fill bounded region
- [ ] Draw a closed shape with brush
- [ ] Select Fill tool (`g`)
- [ ] Click inside shape — fills contiguous region of same char
- [ ] Notes:

### 8.2 Fill boundary-aware
- [ ] Fill stops at different characters (doesn't leak out)
- [ ] Notes:

### 8.3 Fill whole canvas
- [ ] Click on empty space with nothing blocking — fills entire canvas
- [ ] Notes:

---

## 9. Drawing Tools — Eyedropper

### 9.1 Sample character
- [ ] Paint some cells with brush
- [ ] Select Eyedropper (`d`)
- [ ] Click painted cell — brush char set to that cell's char
- [ ] Notes:

### 9.2 Sample color
- [ ] If cell has FG color, palette FG updates to match
- [ ] Notes:

---

## 10. Drawing Tools — Spray

### 10.1 Spray paint
- [ ] Select Spray (`a`)
- [ ] Click canvas — random scatter of chars within brush radius
- [ ] Notes:

### 10.2 Spray density
- [ ] `;` decreases density (down to 1)
- [ ] `'` increases density (up to 100)
- [ ] Low density = fewer particles
- [ ] High density = more particles
- [ ] Notes:

### 10.3 Spray with different sizes
- [ ] Larger brush size = wider spray radius
- [ ] Notes:

---

## 11. Color Palette

### 11.1 Select color
- [ ] Arrow keys navigate palette grid (2 rows × 8 cols of ANSI colors)
- [ ] `Enter` selects highlighted color
- [ ] Selected color shows as active in palette
- [ ] Notes:

### 11.2 Toggle FG/BG target
- [ ] `x` toggles between foreground (char color) and background (cell bg)
- [ ] `[FG]` / `[BG]` label highlights in yellow
- [ ] `f` sets FG target directly
- [ ] Paint after toggling — respects FG vs BG target
- [ ] Notes:

### 11.3 Extended colors
- [ ] `z` toggles extended palette view
- [ ] Shows 16 colors from 240-color cube
- [ ] Notes:

### 11.4 Custom hex color
- [ ] `h` enters custom hex color mode
- [ ] Type hex digits (0-9 a-f), optional `#` prefix
- [ ] `Enter` confirms, `Esc` cancels, `Backspace` deletes
- [ ] Custom color applied
- [ ] Notes:

### 11.5 Recent colors
- [ ] Selected colors appear in recent colors strip
- [ ] Eyedropper picks also add to recent
- [ ] Notes:

---

## 12. Selection Tools

### 12.1 Marquee selection
- [ ] Select Marquee (`v`)
- [ ] Click+drag on canvas — rectangular selection drawn
- [ ] Dashed perimeter visible (`▒`/` ` alternating)
- [ ] Notes:

### 12.2 Circle selection
- [ ] Select Circle (`c`)
- [ ] Click+drag — circular selection from center
- [ ] Notes:

### 12.3 Lasso selection
- [ ] Select Lasso (`l`)
- [ ] Click+drag freehand path — closed when released
- [ ] Notes:

### 12.4 Polygon selection
- [ ] Select Polygon (`p`)
- [ ] Click points to define vertices
- [ ] `Enter` to close polygon
- [ ] `Esc` to cancel
- [ ] Auto-closes when clicking near first vertex (<3px)
- [ ] Notes:

### 12.5 Selection move
- [ ] Selection active, arrow keys — moves content
- [ ] Notes:

### 12.6 Selection delete
- [ ] Selection active, `Delete`/`Backspace` — clears contents
- [ ] Notes:

### 12.7 Selection copy/paste
- [ ] `Ctrl+C` — copies selection
- [ ] `Ctrl+V` — pastes at cursor position
- [ ] `Ctrl+X` — cuts selection
- [ ] Notes:

### 12.8 Deselect
- [ ] `Esc` — deselects
- [ ] Notes:

---

## 13. Settings Panel

### 13.1 Open/close settings
- [ ] `S` opens settings panel (in palette area)
- [ ] `S` again closes it
- [ ] `Esc` closes it
- [ ] Notes:

### 13.2 Canvas width/height
- [ ] Arrow keys navigate fields
- [ ] Left/Right adjust canvas width (1-200)
- [ ] Left/Right adjust canvas height (1-200)
- [ ] Changes applied on close
- [ ] Notes:

### 13.3 Font size
- [ ] Adjust font size (6-72)
- [ ] Notes:

### 13.4 Grid toggle
- [ ] Grid On/Off toggle in settings
- [ ] Notes:

### 13.5 Snap-to-grid toggle
- [ ] Snap-to-grid On/Off
- [ ] Notes:

---

## 14. Toolbox Display

### 14.1 All tools visible
- [ ] Brush, Marquee, Lasso, Circle, Polygon, Fill, Line, Eraser, Eyedropper, Spray, Text — all shown
- [ ] Each has icon from icons.yaml
- [ ] Notes:

### 14.2 Active tool highlighted
- [ ] Selected tool has different background color
- [ ] Notes:

### 14.3 Brush preview
- [ ] 5×5 mini grid shows current brush shape
- [ ] Updates when shape/size changes
- [ ] Brush char and size label shown
- [ ] Notes:

---

## Notes / Bugs

| # | Section | Issue | Severity |
|---|---------|-------|----------|
|   |         |       |          |
