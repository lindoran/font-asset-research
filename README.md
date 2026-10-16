## a working mock up font for 6747 CG2 192x64 pixels mode)

## 3x5 font mockup

The supplied TTF is rasterized at its native 3x5 pixel size. The include file
contains the 64 printable glyphs from ASCII `0x20` through `0x5F` (uppercase,
digits, and punctuation; lowercase is omitted). A 4x6 cell pitch reserves one
blank pixel between glyphs horizontally and vertically, fitting 32 characters
per line and 10 lines in a 128x64 viewport.

- [Packed Z80 assembly include](./font_3x5.asm): 2 bytes per glyph, 128 bytes
  total. `FONT5X3_GET` takes an ASCII character in `A` and returns its glyph
  address in `HL`; characters outside the table use `?`.
- [Glyph sheet](./font_3x5_preview.png): enlarged pixel-grid view of every
  included character.
- [128x64 screen mockup](./font_3x5_screen_mockup.png): sample title and HUD
  text placed on the viewport grid. (this is not an example for any game
  just a mock up.  not to be used as a refrence for comparison to any screen
  in any game)

Each packed glyph stores its 15 pixels row-major: bit 14 is the top-left pixel,
the top row occupies bits 14-12, and the bottom row occupies bits 2-0. Within
each row the left pixel is the high bit. The included lookup routine does not
assume a particular CG2 framebuffer layout, so it can be used with the
project's existing pixel/blit routine.

SEE LICENCE FILE CC0 LICENCE 1.0
ORIGNAL FOUND:
https://alasseearfalas.itch.io/another-tiny-pixel-font-mono-3x5
by Alassë Eärfalas
