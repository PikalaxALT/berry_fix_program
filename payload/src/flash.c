#include <gba/gba.h>
#include <agb_flash.h>
#include "rs.h"

struct UnkStruct_2012E9C
{
    void * ptr;
    size_t size;
};

EWRAM_DATA u8 gUnknown_2028000[0x890] = {};
EWRAM_DATA u8 gUnknown_2028890[0xF80] = {};
EWRAM_DATA u8 gUnknown_2029810[0xF80] = {};
EWRAM_DATA u8 gUnknown_202A790[0xF80] = {};
EWRAM_DATA u8 gUnknown_202B710[0xC40] = {};
EWRAM_DATA u8 gUnknown_202C350[0xF80] = {};
EWRAM_DATA u8 gUnknown_202D2D0[0xF80] = {};
EWRAM_DATA u8 gUnknown_202E250[0xF80] = {};
EWRAM_DATA u8 gUnknown_202F1D0[0xF80] = {};
EWRAM_DATA u8 gUnknown_2030150[0xF80] = {};
EWRAM_DATA u8 gUnknown_20310D0[0xF80] = {};
EWRAM_DATA u8 gUnknown_2032050[0xF80] = {};
EWRAM_DATA u8 gUnknown_2032FD0[0xF80] = {};
EWRAM_DATA u8 gUnknown_2033F50[0x7D0] = {};

const struct UnkStruct_2012E9C gUnknown_2012E9C[] = {
    {gUnknown_2028000, sizeof(gUnknown_2028000)},
    {gUnknown_2028890, sizeof(gUnknown_2028890)},
    {gUnknown_2029810, sizeof(gUnknown_2029810)},
    {gUnknown_202A790, sizeof(gUnknown_202A790)},
    {gUnknown_202B710, sizeof(gUnknown_202B710)},
    {gUnknown_202C350, sizeof(gUnknown_202C350)},
    {gUnknown_202D2D0, sizeof(gUnknown_202D2D0)},
    {gUnknown_202E250, sizeof(gUnknown_202E250)},
    {gUnknown_202F1D0, sizeof(gUnknown_202F1D0)},
    {gUnknown_2030150, sizeof(gUnknown_2030150)},
    {gUnknown_20310D0, sizeof(gUnknown_20310D0)},
    {gUnknown_2032050, sizeof(gUnknown_2032050)},
    {gUnknown_2032FD0, sizeof(gUnknown_2032FD0)},
    {gUnknown_2033F50, sizeof(gUnknown_2033F50)}
};
const u16 gUnknown_2012F0C[] = INCBIN_U16("graphics/unk_2F0C.gbapal");
const u8 gUnknown_2012F2C[] = INCBIN_U8("graphics/unk_2F2C.tilemap.lz");
const u8 gUnknown_2013758[] = INCBIN_U8("graphics/unk_3758.4bpp.lz");

