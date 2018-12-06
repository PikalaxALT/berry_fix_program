    .include "asm/macros.inc"
    .include "constants/constants.inc"

	.section .rodata
	.align 2, 0

gUnknown_2012CF8::
	.2byte 0x0000 @ RGB(00, 00, 00)
	.2byte 0x001f @ RGB(31, 00, 00)
	.2byte 0x03e0 @ RGB(00, 31, 00)
	.2byte 0x7c00 @ RGB(00, 00, 31)

	@ 2012D00
	.space 0x20

gUnknown_2012D20::
	.incbin "baserom.gba", 0x2D20, 0x140

gUnknown_2012E60::
	.incbin "baserom.gba", 0x2E60, 0xC

gUnknown_2012E6C::
	.incbin "baserom.gba", 0x2E6C, 0x30

gUnknown_2012E9C::
	.incbin "baserom.gba", 0x2E9C, 0x70

gUnknown_2012F0C::
	.incbin "baserom.gba", 0x2F0C, 0x20

gUnknown_2012F2C::
	.incbin "baserom.gba", 0x2F2C, 0x82C

gUnknown_2013758::
	.incbin "graphics/unk_13758.4bpp.lz"
