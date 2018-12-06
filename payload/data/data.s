    .include "asm/macros.inc"
    .include "constants/constants.inc"

	.section .rodata
	.align 2, 0

gBerryFixGameCode::
    .asciz "AGBJ"

    .align 2
gIntrFuncPointers::
	.4byte sub_020101C0
	.4byte sub_020101BC
	.4byte sub_020101C0
	.4byte sub_020101C0
	.4byte sub_020101C0
	.4byte sub_020101C0
	.4byte sub_020101C0
	.4byte sub_020101C0
	.4byte sub_020101C0
	.4byte sub_020101C0
	.4byte NULL
	.4byte NULL
	.4byte NULL

gVersionData::
	.ascii "J" @ 0x4a
	.byte 1
	.ascii "E" @ 0x45
	.byte 2
	.ascii "D" @ 0x44
	.byte 1
	.ascii "F" @ 0x46
	.byte 1
	.ascii "I" @ 0x49
	.byte 1
	.ascii "S" @ 0x53
	.byte 1

gRubyTitleAndCode::
    .asciz "POKEMON RUBYAXV"

gSapphrieTitleAndCode::
    .asciz "POKEMON SAPPAXP"

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
