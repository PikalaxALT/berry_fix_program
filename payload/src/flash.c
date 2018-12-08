#include <gba/gba.h>
#include <agb_flash.h>
#include "global.h"
#include "main.h"

struct SaveBlockChunk
{
    void * ptr;
    size_t size;
};

u8 sub_02010E2C(u16 a0, const struct SaveBlockChunk * a1);
u8 sub_02011470(u16 a0, const struct SaveBlockChunk * a1);

u32 gUnknown_300122C;
bool32 gUnknown_300123C;

EWRAM_DATA struct SaveBlock2 gSaveBlock2 = {};
EWRAM_DATA struct SaveBlock1 gSaveBlock1 = {};
EWRAM_DATA struct PokemonStorage gPokemonStorage = {};

// Each 4 KiB flash sector contains 3968 bytes of actual data followed by a 128 byte footer
#define SECTOR_DATA_SIZE 3968
#define SECTOR_FOOTER_SIZE 128

#define SAVEBLOCK_CHUNK(structure, chunkNum)                                \
{                                                                           \
    (u8 *)&structure + chunkNum * SECTOR_DATA_SIZE,                         \
    min(sizeof(structure) - chunkNum * SECTOR_DATA_SIZE, SECTOR_DATA_SIZE)  \
}                                                                           \

const struct SaveBlockChunk gUnknown_2012E9C[] =
{
    SAVEBLOCK_CHUNK(gSaveBlock2, 0),

    SAVEBLOCK_CHUNK(gSaveBlock1, 0),
    SAVEBLOCK_CHUNK(gSaveBlock1, 1),
    SAVEBLOCK_CHUNK(gSaveBlock1, 2),
    SAVEBLOCK_CHUNK(gSaveBlock1, 3),

    SAVEBLOCK_CHUNK(gPokemonStorage, 0),
    SAVEBLOCK_CHUNK(gPokemonStorage, 1),
    SAVEBLOCK_CHUNK(gPokemonStorage, 2),
    SAVEBLOCK_CHUNK(gPokemonStorage, 3),
    SAVEBLOCK_CHUNK(gPokemonStorage, 4),
    SAVEBLOCK_CHUNK(gPokemonStorage, 5),
    SAVEBLOCK_CHUNK(gPokemonStorage, 6),
    SAVEBLOCK_CHUNK(gPokemonStorage, 7),
    SAVEBLOCK_CHUNK(gPokemonStorage, 8),
};

const u16 gUnknown_2012F0C[] = INCBIN_U16("graphics/unk_2F0C.gbapal");
const u8 gUnknown_2012F2C[] = INCBIN_U8("graphics/unk_2F2C.tilemap.lz");
const u8 gUnknown_2013758[] = INCBIN_U8("graphics/unk_3758.4bpp.lz");

bool32 sub_02010B9C(void)
{
    gUnknown_300123C = TRUE;
    if (!IdentifyFlash())
    {
        SetFlashTimerIntr(0, &((IntrFunc *)gIntrFuncPointers)[9]);
        return TRUE;
    }
    gUnknown_300123C = FALSE;
    return FALSE;
}

void sub_02010BCC(u16 sectorNum, ptrdiff_t offset, void * dest, size_t size)
{
    ReadFlash(sectorNum, offset, dest, size);
}

u8 sub_02010BDC(u16 a0, const struct SaveBlockChunk * a1)
{
    return sub_02010E2C(a0, a1);
}

u8 sub_02010BF0(u16 a0, const struct SaveBlockChunk * a1)
{
    return sub_02011470(a0, a1);
}

u32 * sub_02010C04(void)
{
    return &gUnknown_300122C;
}

s32 sub_02010C0C(u8 a0)
{
    u8 i;

    switch (a0)
    {
        case 0:
        default:
            sub_02010BDC(0xFFFF, gUnknown_2012E9C);
            break;
        case 1:
            for (i = 0; i < 5; i++)
            {
                sub_02010BDC(i, gUnknown_2012E9C);
            }
            break;
        case 2:
            sub_02010BDC(0, gUnknown_2012E9C);
            break;
    }

    return 0;
}

u8 sub_02010C60(u8 a0)
{
    sub_02010C0C(a0);
    if (*sub_02010C04() == 0)
        return 1;
    return 0xFF;
}

u8 sub_02010C80(void)
{
    return sub_02010BF0(0xFFFF, gUnknown_2012E9C);
}

void sub_02010C9C(void)
{
    REG_DISPCNT = 0;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    REG_BLDCNT = 0;
    LZ77UnCompVram(gUnknown_2013758, (void *)BG_VRAM);
    LZ77UnCompVram(gUnknown_2012F2C, (void *)BG_SCREEN_ADDR(28));
    CpuCopy16(gUnknown_2012F0C, (void *)BG_PLTT, 0x200);
    REG_BG0CNT = BGCNT_SCREENBASE(28) | BGCNT_TXT512x512;
    REG_DISPCNT = DISPCNT_BG0_ON;
}
