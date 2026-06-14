# E2E Testing — TUI UI Polish (Menu, Status Bar, Theme, Throbber, Tabs)

Binary: `figby-rs/target/debug/figby --tui`

---

## 1. Menu Bar

### 1.1 Menu opens on Alt+key
- [ ] `Alt+F` — opens File menu
- [ ] `Alt+E` — opens Edit menu
- [ ] `Alt+V` — opens View menu
- [ ] `Alt+T` — opens Tools menu
- [ ] `Alt+H` — opens Help menu
- [ ] Menu dropdown renders correctly
- [ ] Notes:

### 1.2 Menu navigation
- [ ] Arrow keys navigate menu items
- [ ] `Enter` activates selected item
- [ ] `Esc` closes menu
- [ ] Notes:

### 1.3 File menu items
- [ ] File → Open — triggers open dialog (`Ctrl+O`)
- [ ] File → Save — triggers save (`Ctrl+S`)
- [ ] File → Save As — triggers save as dialog (`Ctrl+Shift+S`)
- [ ] File → Export — triggers export dialog (`Ctrl+E`)
- [ ] File → Quit — quits TUI
- [ ] Notes:

### 1.4 Edit menu items
- [ ] Edit → Undo — undoes (`Ctrl+Z`)
- [ ] Edit → Redo — redoes (`Ctrl+Y`)
- [ ] Edit → Cut — cuts selection (`Ctrl+X`)
- [ ] Edit → Copy — copies selection (`Ctrl+C`)
- [ ] Edit → Paste — pastes (`Ctrl+V`)
- [ ] Notes:

### 1.5 View menu items
- [ ] View → Zoom In — zooms in (`+`)
- [ ] View → Zoom Out — zooms out (`-`)
- [ ] View → Toggle Grid — toggles grid (`G`)
- [ ] View → Toggle Undo Panel — toggles undo history (`Ctrl+Shift+H`)
- [ ] Notes:

### 1.6 Tools menu items
- [ ] Tools → Brush — selects Brush
- [ ] Tools → Eraser — selects Eraser
- [ ] Tools → Line — selects Line
- [ ] Tools → Fill — selects Fill
- [ ] Tools → Marquee — selects Marquee
- [ ] Tools → Lasso — selects Lasso
- [ ] Tools → Circle Select — selects Circle
- [ ] Tools → Polygon Select — selects Polygon
- [ ] Tools → Eyedropper — selects Eyedropper
- [ ] Tools → Spray — selects Spray
- [ ] Tools → Text — selects Text
- [ ] Notes:

### 1.7 Help menu items
- [ ] Help → About — shows version info
- [ ] Help → Keybindings — shows keyboard shortcuts reference
- [ ] Notes:

### 1.8 Click to open menu
- [ ] Click menu bar label with mouse — menu opens
- [ ] Notes:

---

## 2. Status Bar

### 2.1 Status bar visible
- [ ] Status bar always visible at bottom (3 lines)
- [ ] Notes:

### 2.2 Mode indicator (colored)
- [ ] Font Editor mode: blue label
- [ ] Image Editor mode: green label
- [ ] ASCII Preview mode: yellow label
- [ ] Notes:

### 2.3 Tool name
- [ ] Current tool name displayed
- [ ] Updates when tool changes
- [ ] Notes:

### 2.4 Cursor position
- [ ] Shows `X: N Y: N`
- [ ] Updates on cursor movement
- [ ] Notes:

### 2.5 Zoom level
- [ ] Shows `Z: Nx`
- [ ] Updates on zoom in/out
- [ ] Notes:

### 2.6 Unsaved indicator
- [ ] Shows `!` or `*` when unsaved changes
- [ ] Disappears after save
- [ ] Notes:

### 2.7 Filename
- [ ] Shows current file path or "Untitled"
- [ ] Prefix `*` if unsaved
- [ ] Notes:

### 2.8 Undo count
- [ ] Shows number of undoable actions (if > 0)
- [ ] Notes:

### 2.9 FPS counter
- [ ] Shows approximate frames per second
- [ ] Notes:

### 2.10 Clock
- [ ] Shows current time (HH:MM:SS)
- [ ] Updates every second
- [ ] Notes:

### 2.11 Throbber text
- [ ] Shows spinning animation during async ops
- [ ] `⠋ Saving...`, `⠙ Loading...`, etc.
- [ ] Notes:

### 2.12 Git branch
- [ ] Shows current git branch name (if in a repo)
- [ ] Notes:

### 2.13 Separators
- [ ] Sections separated by styled dividers (`│` or `▎`)
- [ ] Notes:

---

## 3. Throbber

### 3.1 Spinner animation
- [ ] Trigger save or open
- [ ] Throbber animates through frames: `⠋ ⠙ ⠹ ⠸ ⠼ ⠴ ⠦ ⠧ ⠇ ⠏`
- [ ] Notes:

### 3.2 Throbber stops on completion
- [ ] After async op finishes, throbber stops
- [ ] Status bar returns to normal
- [ ] Notes:

### 3.3 Throbber in status bar
- [ ] Throbber renders in status bar right section
- [ ] Shows descriptive text alongside animation
- [ ] Notes:

---

## 4. Theme

### 4.1 Default theme loads
- [ ] TUI launches with Tokyo Night dark theme
- [ ] Colors applied to all panels
- [ ] Notes:

### 4.2 Theme tokens visible
- [ ] Toolbox bg/fg/selected colors distinct
- [ ] Canvas grid/cursor/selection colors visible
- [ ] Palette border and active target styled
- [ ] Status bar mode colors (blue/green/yellow)
- [ ] Menu bg/fg/highlight styled
- [ ] Dialog border colors (success/path)
- [ ] Notes:

### 4.3 Custom theme (if configured)
```bash
# Create custom theme file
mkdir -p ~/.config/figby
cat > ~/.config/figby/my_theme.yaml << 'EOF'
toolbox:
  bg: "#1a1a2e"
  fg: "#e0e0e0"
  selected: "#16213e"
canvas:
  grid: "#2a2a4a"
  cursor: "#e94560"
  selection: "#0f3460"
palette:
  border: "#533483"
  active_target: "#e94560"
statusbar:
  mode_font: "#3498db"
  mode_image: "#2ecc71"
  mode_ascii: "#f1c40f"
menu:
  bg: "#1a1a2e"
  fg: "#e0e0e0"
  highlight: "#e94560"
EOF
# Set in config: theme = "~/.config/figby/my_theme.yaml"
```
- [ ] Custom theme loads
- [ ] Colors override defaults
- [ ] Notes:

### 4.4 Invalid theme falls back to default
- [ ] Set theme to nonexistent path
- [ ] TUI loads with default theme
- [ ] No crash
- [ ] Notes:

---

## 5. ASCII Preview Mode

### 5.1 Switch to ASCII Preview
- [ ] `Ctrl+Tab` until ASCII Preview mode active
- [ ] Canvas shows rendered ASCII art preview
- [ ] Notes:

### 5.2 Tools still work
- [ ] Drawing tools functional in preview mode
- [ ] Notes:

---

## 6. Component Architecture (Architectural Check)

### 6.1 Modal dialogs render correctly
- [ ] File dialog renders as overlay (~2/3 width × 2/3 height)
- [ ] Export dialog renders as overlay
- [ ] Backdrop dimmed/covered
- [ ] Notes:

### 6.2 Event dispatch priority
- [ ] Dialog open → keyboard goes to dialog
- [ ] Menu open → keyboard goes to menu
- [ ] Otherwise normal key handling
- [ ] Notes:

### 6.3 No deadlocks
- [ ] Rapid key presses don't cause freeze
- [ ] Mode switching is instant
- [ ] Notes:

### 6.4 No panic on resize
- [ ] Resize terminal while TUI running
- [ ] Layout adjusts gracefully
- [ ] No crash or artifact
- [ ] Notes:

---

## Notes / Bugs

| # | Section | Issue | Severity |
|---|---------|-------|----------|
|   |         |       |          |
