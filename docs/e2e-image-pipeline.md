# E2E Testing — Image-to-ASCII Pipeline

Binary: `figby-rs/target/debug/figby`  
Test image: `assets/img/figby.png`

---

## 1. Basic Image Conversion

### 1.1 Default ASCII conversion (`-i`)
```bash
./figby-rs/target/debug/figby -i assets/img/figby.png
```
- [ ] Output renders recognizable ASCII art
- [ ] Uses default character map (` .-:=+*#%@`)
- [ ] Output width = terminal width (or 80)
- [ ] Notes:

### 1.2 Specific width (`--width`)
```bash
./figby-rs/target/debug/figby -i assets/img/figby.png --width 40
./figby-rs/target/debug/figby -i assets/img/figby.png --width 80
```
- [ ] Width 40 output is narrower than width 80
- [ ] Aspect ratio preserved (height adjusts proportionally)
- [ ] Notes:

### 1.3 Specific height (`--height`)
```bash
./figby-rs/target/debug/figby -i assets/img/figby.png --height 20
```
- [ ] Output truncated/padded to 20 rows
- [ ] Notes:

### 1.4 Dimensions flag (`--dimensions WxH`)
```bash
./figby-rs/target/debug/figby -i assets/img/figby.png --dimensions 50x25
```
- [ ] Output is 50 columns × 25 rows
- [ ] Notes:

### 1.5 Custom char map (`--map`)
```bash
./figby-rs/target/debug/figby -i assets/img/figby.png --width 40 --map "@%#*+=-:. "
```
- [ ] Output uses the custom character set
- [ ] Darkest areas use `@`, brightest use ` ` (space)
- [ ] Notes:

### 1.6 Minimal 2-char map
```bash
./figby-rs/target/debug/figby -i assets/img/figby.png --width 40 --map "# "
```
- [ ] Binary-like output (# for dark, space for light)
- [ ] Notes:

---

## 2. Braille Art

### 2.1 Basic braille (`-b`)
```bash
./figby-rs/target/debug/figby -b -i assets/img/figby.png
```
- [ ] Output uses Unicode braille chars (U+2800–U+28FF)
- [ ] Finer resolution than ASCII mode
- [ ] Notes:

### 2.2 Braille with dither (`--dither`)
```bash
./figby-rs/target/debug/figby -b --dither -i assets/img/figby.png
```
- [ ] Floyd-Steinberg dithering applied
- [ ] Output differs from non-dithered braille
- [ ] Usually better detail preservation
- [ ] Notes:

### 2.3 Braille with width
```bash
./figby-rs/target/debug/figby -b -i assets/img/figby.png --width 30
```
- [ ] Braille output at specified width
- [ ] Notes:

---

## 3. Color & Grayscale Output

### 3.1 Colored ASCII (`--color`)
```bash
./figby-rs/target/debug/figby --color -i assets/img/figby.png --width 40
```
- [ ] Output contains 24-bit ANSI color codes (`\x1b[38;2;R;G;Bm`)
- [ ] Colors render in terminal (visible coloration)
- [ ] Notes:

### 3.2 Grayscale only (`--grayscale`)
```bash
./figby-rs/target/debug/figby --grayscale -i assets/img/figby.png --width 40
```
- [ ] Output uses only luminance chars
- [ ] No ANSI color codes (plain ASCII)
- [ ] Notes:

### 3.3 Negative / invert (`--negative`)
```bash
./figby-rs/target/debug/figby --negative -i assets/img/figby.png --width 40
./figby-rs/target/debug/figby --negative --color -i assets/img/figby.png --width 40
```
- [ ] Plain negative: light/dark inverted
- [ ] Color negative: colors inverted (R→255-R, etc.)
- [ ] Notes:

### 3.4 Color + Grayscale combined
```bash
./figby-rs/target/debug/figby --color --grayscale -i assets/img/figby.png --width 40
```
- [ ] Colors preserved in output
- [ ] Luminance used for char selection
- [ ] Notes:

---

## 4. Flip & Transform

### 4.1 Horizontal flip (`--flipX`)
```bash
./figby-rs/target/debug/figby -i assets/img/figby.png --width 40 --flipX
```
- [ ] Image is mirrored horizontally
- [ ] Compare with non-flipped output
- [ ] Notes:

### 4.2 Vertical flip (`--flipY`)
```bash
./figby-rs/target/debug/figby -i assets/img/figby.png --width 40 --flipY
```
- [ ] Image is flipped vertically (upside-down)
- [ ] Notes:

### 4.3 Both flips
```bash
./figby-rs/target/debug/figby -i assets/img/figby.png --width 40 --flipX --flipY
```
- [ ] Both axes flipped (180° rotation)
- [ ] Notes:

---

## 5. Multiple Images

### 5.1 Two images at once
```bash
./figby-rs/target/debug/figby -i assets/img/figby.png assets/img/figby.png --width 30
```
- [ ] Both images render (one after another)
- [ ] Notes:

---

## 6. Combinations

### 6.1 Braille + Dither + Width + Flip
```bash
./figby-rs/target/debug/figby -b --dither -i assets/img/figby.png --width 50 --flipX
```
- [ ] All flags compose correctly
- [ ] Dithered braille at 50w, flipped
- [ ] Notes:

### 6.2 Color + Negative + Custom Map
```bash
./figby-rs/target/debug/figby --color --negative -i assets/img/figby.png --width 40 --map " .-:=+*#%@"
```
- [ ] Colored output with inverted colors
- [ ] Custom char map applied
- [ ] Notes:

---

## 7. Error Handling

### 7.1 Nonexistent image file
```bash
./figby-rs/target/debug/figby -i /nonexistent/image.png
```
- [ ] Error message printed
- [ ] Exits non-zero (or continues if multiple images?)
- [ ] Notes:

### 7.2 Not an image file
```bash
./figby-rs/target/debug/figby -i fonts/standard.flf
```
- [ ] Error message about invalid image
- [ ] Notes:

---

## 8. Image + FIGlet Combined

### 8.1 Image flag takes precedence
```bash
./figby-rs/target/debug/figby -i assets/img/figby.png -f big "Hello"
```
- [ ] Image mode overrides FIGlet text input
- [ ] Image renders, text ignored
- [ ] Notes:

---

## Notes / Bugs

| # | Section | Issue | Severity |
|---|---------|-------|----------|
|   |         |       |          |
