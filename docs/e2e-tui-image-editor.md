# E2E Testing — TUI Image Editor Mode

Binary: `figby-rs/target/debug/figby --tui`  
Test image: `assets/img/figby.png`  
Switch to Image Editor mode with `Ctrl+Tab`.

---

## 1. Image Import

### 1.1 Load image from path
- [ ] Press `o` or `O`
- [ ] Path entry mode activates: `[Path: ...]` in title
- [ ] Type path: `assets/img/figby.png`
- [ ] Press `Enter`
- [ ] Image renders on canvas as ASCII art
- [ ] Notes:

### 1.2 Image appears correctly
- [ ] Image fills canvas at appropriate resolution
- [ ] Characters map to luminance values
- [ ] Notes:

### 1.3 Error on nonexistent path
- [ ] Press `o`, type `/nonexistent/image.png`, `Enter`
- [ ] Error message displayed
- [ ] Exits path entry mode gracefully
- [ ] Notes:

---

## 2. Color Mode Toggle

### 2.1 Default mode (grayscale)
- [ ] After loading, image rendered as luminance-based ASCII
- [ ] No ANSI color codes
- [ ] Notes:

### 2.2 Color mode
- [ ] Press `c` or `C`
- [ ] Toggles to color mode
- [ ] Original pixel colors preserved (FG ANSI codes)
- [ ] Notes:

### 2.3 Toggle back to grayscale
- [ ] Press `c` again — back to grayscale
- [ ] Notes:

---

## 3. Image Adjustments

### 3.1 Brightness
- [ ] Press `b` — enters brightness adjustment mode
- [ ] `+`/`=` increases brightness by 5
- [ ] `-`/`_` decreases brightness by 5
- [ ] Range -255 to 255
- [ ] Image gets visibly brighter/darker
- [ ] `Esc` exits adjustment mode
- [ ] Notes:

### 3.2 Contrast
- [ ] Press `k` — enters contrast adjustment mode
- [ ] `+`/`=` increases contrast (max 5.0)
- [ ] `-`/`_` decreases contrast (min 0.0)
- [ ] Default 1.0
- [ ] Image contrast changes visibly
- [ ] Notes:

### 3.3 Threshold (for braille mode)
- [ ] Press `t` — enters threshold adjustment mode
- [ ] `+`/`=` increases threshold by 8
- [ ] `-`/`_` decreases threshold by 8
- [ ] Range 0-255, default 128
- [ ] Notes:

### 3.4 Target Width
- [ ] Press `w` — enters width adjustment mode
- [ ] `+`/`=` increases width by 4
- [ ] `-`/`_` decreases width by 4
- [ ] Range 1-1000
- [ ] Image re-renders at new width
- [ ] Notes:

### 3.5 Adjustment status shown
- [ ] Mode title bar shows current adjustments, e.g. `[B:+50 Inv Gray]`
- [ ] Notes:

---

## 4. Image Toggles

### 4.1 Invert
- [ ] Press `i` or `I` — toggles invert (negative)
- [ ] Colors/luminance inverted
- [ ] Press again to revert
- [ ] Notes:

### 4.2 Dither
- [ ] Press `d` or `D` — toggles Floyd-Steinberg dithering
- [ ] Only affects braille mode output
- [ ] Notes:

### 4.3 Braille mode
- [ ] Press `y` or `Y` — toggles braille rendering
- [ ] Image converts to Unicode braille (U+2800–U+28FF)
- [ ] Finer detail than char mode
- [ ] Press again for normal chars
- [ ] Notes:

### 4.4 Reset all adjustments
- [ ] Press `r` or `R` — resets brightness, contrast, threshold, invert, dither, braille, width to defaults
- [ ] Notes:

---

## 5. Text Overlay in Image Editor

### 5.1 Place FIGlet text on image
- [ ] Select Text tool (`t`)
- [ ] Click on image canvas
- [ ] Type text, `Enter` commits
- [ ] FIGlet text renders over the ASCII image
- [ ] Notes:

### 5.2 Move text block
- [ ] Arrow keys move the text block
- [ ] Text stays on top of image
- [ ] Notes:

### 5.3 Scale text
- [ ] `+` scales up, `-` scales down
- [ ] Notes:

### 5.4 Rotate text
- [ ] `r` rotates 90°
- [ ] Notes:

### 5.5 Multiple text blocks
- [ ] Place multiple text blocks on same image
- [ ] Each independently selectable and movable
- [ ] Notes:

### 5.6 Delete text block
- [ ] `Delete` removes selected block
- [ ] Notes:

---

## 6. Drawing on Image

### 6.1 Paint over image
- [ ] Select Brush tool (`b`)
- [ ] Paint on image canvas — overwrites ASCII chars
- [ ] Notes:

### 6.2 All tools work in Image Editor
- [ ] Eraser, Line, Fill, Eyedropper, Spray — all functional
- [ ] Notes:

### 6.3 Selection on image
- [ ] Marquee/Circle/Lasso/Polygon select area
- [ ] Move/delete/copy/paste within image
- [ ] Notes:

---

## 7. Combination Tests

### 7.1 Braille + Dither + Brightness
- [ ] Load image
- [ ] Toggle braille (`y`)
- [ ] Toggle dither (`d`)
- [ ] Adjust brightness (`b`, +/`)
- [ ] All effects compose correctly
- [ ] Notes:

### 7.2 Color + Invert + Text
- [ ] Load image
- [ ] Toggle color (`c`)
- [ ] Toggle invert (`i`)
- [ ] Place text overlay
- [ ] All effects visible simultaneously
- [ ] Notes:

### 7.3 Reset after adjustments
- [ ] Make several adjustments
- [ ] Press `r`
- [ ] Image returns to original state
- [ ] Notes:

---

## Notes / Bugs

| # | Section | Issue | Severity |
|---|---------|-------|----------|
|   |         |       |          |
