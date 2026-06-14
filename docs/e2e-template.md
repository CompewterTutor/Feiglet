# E2E Testing — Template System (.ftmp)

Binary: `figby-rs/target/debug/figby`  
Run from repo root for font paths.

---

## 1. Basic Template Parsing

### 1.1 Minimal template with one variable
```bash
cat > /tmp/test_minimal.ftmp << 'EOF'
---
[canvas]
width = 60
height = 10

[variables.greeting]
text = "Hello"
font = "standard"
---
{{greeting}}
EOF
./figby-rs/target/debug/figby -T /tmp/test_minimal.ftmp
```
- [ ] Exits 0
- [ ] Output renders "Hello" in standard font
- [ ] Output is within 60 columns wide
- [ ] Notes:

### 1.2 Template without frontmatter (empty body)
```bash
cat > /tmp/test_empty.ftmp << 'EOF'
---
---
EOF
./figby-rs/target/debug/figby -T /tmp/test_empty.ftmp
```
- [ ] Exits 0
- [ ] No output or blank output
- [ ] Notes:

### 1.3 Missing opening `---`
```bash
echo "no delimiter" > /tmp/test_bad.ftmp
./figby-rs/target/debug/figby -T /tmp/test_bad.ftmp
```
- [ ] Error: "must start with '---'"
- [ ] Exits non-zero
- [ ] Notes:

### 1.4 Missing closing `---`
```bash
printf "---\nkey = 1\n" > /tmp/test_noclose.ftmp
./figby-rs/target/debug/figby -T /tmp/test_noclose.ftmp
```
- [ ] Error: "missing closing '---'"
- [ ] Exits non-zero
- [ ] Notes:

---

## 2. Multiple Variables & Z-Ordering

### 2.1 Two variables, overwrite mode (default)
```bash
cat > /tmp/test_overwrite.ftmp << 'EOF'
---
[canvas]
width = 50
height = 10

[variables.a]
text = "AAAA"
font = "standard"
x = 0
y = 0
z = 0

[variables.b]
text = "BB"
font = "standard"
x = 0
y = 0
z = 1
---
{{a}}
{{b}}
EOF
./figby-rs/target/debug/figby -T /tmp/test_overwrite.ftmp
```
- [ ] Both layers render
- [ ] Layer B (z=1) renders on top of Layer A (z=0)
- [ ] B overlaps/obscures A at same position
- [ ] Notes:

### 2.2 Flow mode (sequential stacking)
```bash
cat > /tmp/test_flow.ftmp << 'EOF'
---
[canvas]
width = 50
height = 20

[variables.a]
text = "Hello"
font = "standard"
x = 0
overlap = "flow"

[variables.b]
text = "World"
font = "standard"
x = 0
overlap = "flow"
---
{{a}}
{{b}}
EOF
./figby-rs/target/debug/figby -T /tmp/test_flow.ftmp
```
- [ ] "Hello" renders on top
- [ ] "World" renders below "Hello"
- [ ] No overlap between layers
- [ ] Notes:

### 2.3 Variables at different positions
```bash
cat > /tmp/test_positions.ftmp << 'EOF'
---
[canvas]
width = 60
height = 15

[variables.top]
text = "Top"
font = "standard"
x = 5
y = 0

[variables.bottom]
text = "Bottom"
font = "standard"
x = 5
y = 8
---
{{top}}
{{bottom}}
EOF
./figby-rs/target/debug/figby -T /tmp/test_positions.ftmp
```
- [ ] "Top" renders near top of canvas
- [ ] "Bottom" renders lower on canvas
- [ ] Notes:

---

## 3. Canvas Settings

### 3.1 Width override via `-w`
```bash
./figby-rs/target/debug/figby -T /tmp/test_minimal.ftmp -w 100
```
- [ ] `-w` overrides template canvas width
- [ ] Output is 100 columns wide
- [ ] Notes:

### 3.2 Padding
```bash
cat > /tmp/test_padding.ftmp << 'EOF'
---
[canvas]
width = 40
height = 10
padding = 3

[variables.msg]
text = "Hi"
font = "standard"
---
{{msg}}
EOF
./figby-rs/target/debug/figby -T /tmp/test_padding.ftmp
```
- [ ] Content has 3 spaces of left padding
- [ ] Content has 3 spaces of right padding
- [ ] Notes:

### 3.3 Margin
```bash
cat > /tmp/test_margin.ftmp << 'EOF'
---
[canvas]
width = 40
height = 10
margin = 2

[variables.msg]
text = "Hi"
font = "standard"
---
{{msg}}
EOF
./figby-rs/target/debug/figby -T /tmp/test_margin.ftmp
```
- [ ] 2 blank rows above content
- [ ] 2 blank rows below content
- [ ] Notes:

### 3.4 Padding + Margin together
```bash
cat > /tmp/test_both.ftmp << 'EOF'
---
[canvas]
width = 40
height = 10
padding = 1
margin = 2

[variables.msg]
text = "Hi"
font = "standard"
---
{{msg}}
EOF
./figby-rs/target/debug/figby -T /tmp/test_both.ftmp
```
- [ ] Both padding and margin applied
- [ ] Padding is inside margin
- [ ] Notes:

---

## 4. Variable Text Sources

### 4.1 Env var substitution (`${VAR}`)
```bash
cat > /tmp/test_env.ftmp << 'EOF'
---
[canvas]
width = 60
height = 10

[variables.msg]
text = "Hello ${USER}"
font = "standard"
---
{{msg}}
EOF
./figby-rs/target/debug/figby -T /tmp/test_env.ftmp
```
- [ ] `${USER}` resolves to actual username
- [ ] Output shows "Hello <username>"
- [ ] Notes:

### 4.2 Command substitution (`$(cmd)`)
```bash
cat > /tmp/test_cmd.ftmp << 'EOF'
---
[canvas]
width = 80
height = 10

[variables.msg]
text = "Date: $(date +%Y-%m-%d)"
font = "standard"
---
{{msg}}
EOF
./figby-rs/target/debug/figby -T /tmp/test_cmd.ftmp
```
- [ ] `$(date +%Y-%m-%d)` resolves to current date
- [ ] Output shows "Date: 2026-06-14" (or whatever)
- [ ] Notes:

### 4.3 Command failure
```bash
cat > /tmp/test_cmdfail.ftmp << 'EOF'
---
[canvas]
width = 60
height = 10

[variables.msg]
text = "$(false)"
font = "standard"
---
{{msg}}
EOF
./figby-rs/target/debug/figby -T /tmp/test_cmdfail.ftmp
```
- [ ] Error message about command failure
- [ ] Exits non-zero
- [ ] Notes:

### 4.4 Missing env var
```bash
cat > /tmp/test_missenv.ftmp << 'EOF'
---
[canvas]
width = 60
height = 10

[variables.msg]
text = "${DOES_NOT_EXIST_XYZZY}"
font = "standard"
---
{{msg}}
EOF
./figby-rs/target/debug/figby -T /tmp/test_missenv.ftmp
```
- [ ] Error: "not set"
- [ ] Exits non-zero
- [ ] Notes:

---

## 5. Borders & Shadows

### 5.1 Border only
```bash
cat > /tmp/test_border.ftmp << 'EOF'
---
[canvas]
width = 40
height = 10

[variables.msg]
text = "Hello"
font = "standard"
x = 5
y = 2
border_width = 1
---
{{msg}}
EOF
./figby-rs/target/debug/figby -T /tmp/test_border.ftmp
```
- [ ] Text rendered at x=5, y=2
- [ ] Border of `.` chars around the content
- [ ] Border only fills spaces, doesn't overwrite text
- [ ] Notes:

### 5.2 Shadow only
```bash
cat > /tmp/test_shadow.ftmp << 'EOF'
---
[canvas]
width = 40
height = 12

[variables.msg]
text = "Hi"
font = "standard"
x = 5
y = 2
shadow_size = 2
---
{{msg}}
EOF
./figby-rs/target/debug/figby -T /tmp/test_shadow.ftmp
```
- [ ] Text rendered at x=5, y=2
- [ ] Shadow of `.` offset 2 down-right
- [ ] Shadow only fills spaces
- [ ] Notes:

### 5.3 Border + Shadow
```bash
cat > /tmp/test_both_decor.ftmp << 'EOF'
---
[canvas]
width = 50
height = 14

[variables.msg]
text = "FIGby"
font = "standard"
x = 5
y = 2
border_width = 1
shadow_size = 2
---
{{msg}}
EOF
./figby-rs/target/debug/figby -T /tmp/test_both_decor.ftmp
```
- [ ] Text with border ring and drop shadow
- [ ] Both effects visible and non-overlapping
- [ ] Notes:

---

## 6. Image Tags in Templates

### 6.1 Image tag in body
```bash
cat > /tmp/test_imgtag.ftmp << 'EOF'
---
[canvas]
width = 60
height = 20
---
{{img:assets/img/figby.png:30:::0,0:}}
EOF
./figby-rs/target/debug/figby -T /tmp/test_imgtag.ftmp
```
- [ ] Image renders as ASCII art on canvas
- [ ] Output is 60 columns wide
- [ ] Notes:

### 6.2 Image tag with text alongside
```bash
cat > /tmp/test_imgtext.ftmp << 'EOF'
---
[canvas]
width = 60
height = 20

[variables.label]
text = "figby"
font = "standard"
x = 0
y = 0
---
{{img:assets/img/figby.png:30:::0,2:}}
{{label}}
EOF
./figby-rs/target/debug/figby -T /tmp/test_imgtext.ftmp
```
- [ ] Image renders
- [ ] Text renders separately
- [ ] Notes:

---

## 7. Different Fonts in Variables

### 7.1 Variable with specific font
```bash
cat > /tmp/test_fontvar.ftmp << 'EOF'
---
[canvas]
width = 80
height = 12

[variables.msg]
text = "Big Text"
font = "big"
x = 0
y = 0
---
{{msg}}
EOF
./figby-rs/target/debug/figby -d fonts -T /tmp/test_fontvar.ftmp
```
- [ ] Renders using "big" font (taller, wider)
- [ ] Notes:

### 7.2 Multiple fonts in same template
```bash
cat > /tmp/test_multi_font.ftmp << 'EOF'
---
[canvas]
width = 80
height = 24

[variables.small]
text = "Small"
font = "standard"

[variables.large]
text = "BIG"
font = "big"
overlap = "flow"
---
{{small}}
{{large}}
EOF
./figby-rs/target/debug/figby -d fonts -T /tmp/test_multi_font.ftmp
```
- [ ] "Small" renders in standard font
- [ ] "BIG" renders below in "big" font
- [ ] Both fonts loaded and used correctly
- [ ] Notes:

---

## 8. Edge Cases

### 8.1 Variable defined but not used in body
```bash
cat > /tmp/test_unused.ftmp << 'EOF'
---
[canvas]
width = 40
height = 10

[variables.unused]
text = "This should not appear"
font = "standard"
---
Just plain text here.
EOF
./figby-rs/target/debug/figby -T /tmp/test_unused.ftmp
```
- [ ] Unused variable doesn't render
- [ ] Only body text content matters for rendering
- [ ] Notes:

### 8.2 Very long text in template
```bash
cat > /tmp/test_long.ftmp << 'EOF'
---
[canvas]
width = 80
height = 30

[variables.msg]
text = "The quick brown fox jumps over the lazy dog repeatedly"
font = "standard"
---
{{msg}}
EOF
./figby-rs/target/debug/figby -T /tmp/test_long.ftmp
```
- [ ] Long text renders (may wrap or truncate per FIGlet behavior)
- [ ] No crash
- [ ] Notes:

### 8.3 Height constraint clipping
```bash
cat > /tmp/test_clip.ftmp << 'EOF'
---
[canvas]
width = 40
height = 3

[variables.msg]
text = "Tall Font"
font = "big"
---
{{msg}}
EOF
./figby-rs/target/debug/figby -d fonts -T /tmp/test_clip.ftmp
```
- [ ] Output clipped to 3 rows (visible truncation)
- [ ] No crash
- [ ] Notes:

### 8.4 Template from stdin via pipe
```bash
cat /tmp/test_minimal.ftmp | ./figby-rs/target/debug/figby -T /dev/stdin
```
- [ ] Reads template from stdin
- [ ] Renders correctly
- [ ] Notes:

---

## Notes / Bugs

| # | Section | Issue | Severity |
|---|---------|-------|----------|
|   |         |       |          |
