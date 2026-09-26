# Dial Image Guidelines

Practical spec for any dial/main-face image handed off for a watch face in
this repo (Chanel J12 and future faces). Following this means the image can
be dropped straight into `res/drawable/` and referenced from
`watchface.xml` with no chroma-key extraction, rescaling, or recentering
step first.

## Priority 1 — Deliver with a real transparent background

The single biggest time-saver: export as **PNG with an actual alpha
channel**, not a flat color background.

- Turn on "Transparent Background" / "Alpha Channel" in whatever renders the
  image (3D tool, Figma, Photoshop, etc.) and export PNG-32.
- Everything outside the round case/bezel should have alpha = 0. No white,
  no green, no checkerboard.
- If this is possible, skip everything under Priority 2 — the image is
  already ready to scale-and-place as-is.

## Priority 2 — If transparency isn't possible

A flat single-color background (e.g. solid green) still works, but only if
these three things are fixed and consistent across every image:

1. **Canvas size = final size, 450×450px.** Deliver at the size the
   watch face actually uses, not an oversized render that needs
   downscaling later.
2. **Fixed circle registration.** The outer case/bezel circle should be
   centered at the same point and the same size in every image:
   - Center: **(225, 225)**
   - Radius: **~217px** (diameter ~434px, leaving ~8px margin to the
     canvas edge on every side)

   If this varies image to image, each one has to be measured and
   re-centered individually, and small errors here are what caused the
   "circle looks clipped" and "off-center" defects worked through earlier.
3. **A background color that never appears in the design itself.** Solid
   green works well for both black and white dials for this reason. Don't
   use white as the background for a white-dial design (or black for a
   black dial) — foreground and background become indistinguishable at the
   edges.

## Priority 3 — Flag ambiguous elements up front

A few things are easy to get wrong on the receiving end without being told
explicitly:

- **Date window (the box between 4 and 5 o'clock):** state whether it
  should render as an empty box (live date drawn on top later) or as
  filled-in reference art, and if empty, what its background color is
  meant to be (black box vs. pale/white box) — this decides what color the
  date digits need to be to stay legible.
- **File naming / order:** when sending multiple dial images together,
  name or number them clearly (e.g. `dial1_black_diamond.png`,
  `dial2_black_plain_diamond.png`) rather than relying on attachment order,
  to avoid mismatched numbering.

## Quick checklist before sending

- [ ] PNG, real alpha transparency outside the case (preferred) — or flat
      green background if not possible
- [ ] Canvas exactly 450×450px
- [ ] Case circle centered at (225, 225), radius ~217px
- [ ] Background color doesn't appear anywhere in the dial art itself
- [ ] Date window intent (empty vs. filled, box color) stated
- [ ] Files named/ordered clearly if sending more than one
