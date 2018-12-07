    .include "asm/macros.inc"
    .include "constants/constants.inc"

	.section .rodata
	.align 2, 0

gUnknown_2012E60::
	.byte 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

gUnknown_2012E6C::
	.4byte 0x1f, 0x1c, 0x1f, 0x1e, 0x1f, 0x1e, 0x1f, 0x1f
	.4byte 0x1e, 0x1f, 0x1e, 0x1f

gUnknown_2012E9C::
	.4byte gUnknown_2028000, 0x890
	.4byte gUnknown_2028890, 0xF80
	.4byte gUnknown_2029810, 0xF80
	.4byte gUnknown_202A790, 0xF80
	.4byte gUnknown_202B710, 0xC40
	.4byte gUnknown_202C350, 0xF80
	.4byte gUnknown_202D2D0, 0xF80
	.4byte gUnknown_202E250, 0xF80
	.4byte gUnknown_202F1D0, 0xF80
	.4byte gUnknown_2030150, 0xF80
	.4byte gUnknown_20310D0, 0xF80
	.4byte gUnknown_2032050, 0xF80
	.4byte gUnknown_2032FD0, 0xF80
	.4byte gUnknown_2033F50, 0x7D0

gUnknown_2012F0C::
	.incbin "graphics/unk_2F0C.gbapal"

gUnknown_2012F2C::
	.incbin "graphics/unk_2F2C.tilemap.lz"

gUnknown_2013758::
	.incbin "graphics/unk_3758.4bpp.lz"
