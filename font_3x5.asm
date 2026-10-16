; 3x5 uppercase ASCII font for the VZ200 CG2 viewport.
; Rasterized from the supplied "my 3x5 tiny mono pixel font.ttf".
; Each glyph is 15 row-major pixels packed into two bytes:
;   bit 14 = top-left, bits 14..12 = row 0, bits 2..0 = row 4.
;   In each row, bit 2 is the left pixel and bit 0 is the right pixel.
; The unused high bit is zero. Glyphs are ASCII 0x20 through 0x5F
; in order (space, punctuation, digits, uppercase, punctuation).
; Glyph cell pitch is 4x6 pixels: 3x5 ink plus one blank column and row.
; Total font data: 64 glyphs * 2 bytes = 128 bytes.

FONT5X3_COUNT EQU 0x40
FONT5X3_DATA:
              DEFB  0x00,0x00 ; ASCII 0x20 SPACE
              DEFB  0x24,0x82 ; ASCII 0x21 !
              DEFB  0x5A,0x00 ; ASCII 0x22 "
              DEFB  0x5F,0x7D ; ASCII 0x23 #
              DEFB  0x3C,0xFA ; ASCII 0x24 $
              DEFB  0x52,0xA5 ; ASCII 0x25 %
              DEFB  0x3C,0xEB ; ASCII 0x26 &
              DEFB  0x24,0x00 ; ASCII 0x27 '
              DEFB  0x29,0x22 ; ASCII 0x28 (
              DEFB  0x22,0x4A ; ASCII 0x29 )
              DEFB  0x55,0x40 ; ASCII 0x2A *
              DEFB  0x05,0xD0 ; ASCII 0x2B +
              DEFB  0x00,0x14 ; ASCII 0x2C ,
              DEFB  0x00,0xC0 ; ASCII 0x2D -
              DEFB  0x00,0x02 ; ASCII 0x2E .
              DEFB  0x12,0xA4 ; ASCII 0x2F /
              DEFB  0x7B,0x6F ; ASCII 0x30 0
              DEFB  0x64,0x97 ; ASCII 0x31 1
              DEFB  0x73,0xE7 ; ASCII 0x32 2
              DEFB  0x72,0xCF ; ASCII 0x33 3
              DEFB  0x5B,0xC9 ; ASCII 0x34 4
              DEFB  0x79,0xCF ; ASCII 0x35 5
              DEFB  0x79,0xEF ; ASCII 0x36 6
              DEFB  0x72,0x49 ; ASCII 0x37 7
              DEFB  0x7B,0xEF ; ASCII 0x38 8
              DEFB  0x7B,0xCF ; ASCII 0x39 9
              DEFB  0x04,0x10 ; ASCII 0x3A :
              DEFB  0x04,0x14 ; ASCII 0x3B ;
              DEFB  0x15,0x11 ; ASCII 0x3C <
              DEFB  0x0E,0x38 ; ASCII 0x3D =
              DEFB  0x44,0x54 ; ASCII 0x3E >
              DEFB  0x72,0xC2 ; ASCII 0x3F ?
              DEFB  0x2B,0x63 ; ASCII 0x40 @
              DEFB  0x2B,0xED ; ASCII 0x41 A
              DEFB  0x6B,0xAE ; ASCII 0x42 B
              DEFB  0x39,0x23 ; ASCII 0x43 C
              DEFB  0x6B,0x6E ; ASCII 0x44 D
              DEFB  0x79,0xA7 ; ASCII 0x45 E
              DEFB  0x79,0xA4 ; ASCII 0x46 F
              DEFB  0x39,0x6B ; ASCII 0x47 G
              DEFB  0x5B,0xED ; ASCII 0x48 H
              DEFB  0x74,0x97 ; ASCII 0x49 I
              DEFB  0x12,0x6A ; ASCII 0x4A J
              DEFB  0x5B,0xAD ; ASCII 0x4B K
              DEFB  0x49,0x27 ; ASCII 0x4C L
              DEFB  0x5F,0xED ; ASCII 0x4D M
              DEFB  0x7B,0x6D ; ASCII 0x4E N
              DEFB  0x2B,0x6A ; ASCII 0x4F O
              DEFB  0x7B,0xE4 ; ASCII 0x50 P
              DEFB  0x3B,0x73 ; ASCII 0x51 Q
              DEFB  0x7B,0xAD ; ASCII 0x52 R
              DEFB  0x39,0xCE ; ASCII 0x53 S
              DEFB  0x74,0x92 ; ASCII 0x54 T
              DEFB  0x5B,0x6F ; ASCII 0x55 U
              DEFB  0x5B,0x52 ; ASCII 0x56 V
              DEFB  0x5B,0xFD ; ASCII 0x57 W
              DEFB  0x5A,0xAD ; ASCII 0x58 X
              DEFB  0x5A,0x92 ; ASCII 0x59 Y
              DEFB  0x72,0xA7 ; ASCII 0x5A Z
              DEFB  0x69,0x26 ; ASCII 0x5B [
              DEFB  0x48,0x89 ; ASCII 0x5C \
              DEFB  0x32,0x4B ; ASCII 0x5D ]
              DEFB  0x2A,0x00 ; ASCII 0x5E ^
              DEFB  0x00,0x07 ; ASCII 0x5F _
FONT5X3_DATA_END:

; Input:  A = ASCII character
; Output: HL = address of its two-byte packed glyph
; Invalid characters map to '?'.
; Clobbers: AF, DE
FONT5X3_GET:
              SUB   0x20
              CP    FONT5X3_COUNT
              JR    C,FONT5X3_GET_INDEX
              LD    A,0x1F          ; '?' is ASCII 0x3F, index 0x1F
FONT5X3_GET_INDEX:
              ADD   A,A             ; two bytes per glyph
              LD    E,A
              LD    D,0
              LD    HL,FONT5X3_DATA
              ADD   HL,DE
              RET
