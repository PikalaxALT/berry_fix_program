#include <gba/gba.h>
#include <agb_flash.h>
#include "global.h"
#include "main.h"
#include "flash.h"

struct SaveBlockChunk
{
    u8 * ptr;
    u16 size;
};

u8 sub_02010E2C(u16 a0, const struct SaveBlockChunk * a1);
u8 sub_02010ECC(u16 a0, const struct SaveBlockChunk * a1);
u8 sub_02011034(u8, u8 *);
u8 sub_020111AC(u16 a0, const struct SaveBlockChunk * a1);
u8 sub_02011470(u16 a0, const struct SaveBlockChunk * a1);
u8 sub_020114B0(u16 a0, const struct SaveBlockChunk * a1);
u8 sub_02011568(const struct SaveBlockChunk * a1);
u8 sub_020117E8(u8 a0, u8 * a1);
u16 sub_02011800(u8 *, size_t);

u16 gUnknown_3001220;
u32 gUnknown_3001224;
u16 gUnknown_3001228;
u32 gUnknown_300122C;
u32 gUnknown_3001230;
struct UnkEwramStruct * gUnknown_3001234;
u16 gUnknown_3001238;
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

u8 sub_02010C80(u32 unused)
{
    return sub_02010BF0(0xFFFF, gUnknown_2012E9C);
}

void msg_load_gfx(void)
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

void msg_display(u32 a0)
{
    switch (a0)
    {
        case 0:
            REG_BG0HOFS = 0;
            REG_BG0VOFS = 0;
            break;
        case 1:
            REG_BG0HOFS = 0x100;
            REG_BG0VOFS = 0;
            break;
        case 2:
            REG_BG0HOFS = 0x100;
            REG_BG0VOFS = 0xB0;
            break;
        case 3:
            REG_BG0HOFS = 0;
            REG_BG0VOFS = 0xB0;
            break;
        case 4:
            REG_BG0HOFS = 0;
            REG_BG0VOFS = 0x160;
            break;
    }
}

void sub_02010D88(void)
{
    u16 i;
    for (i = 0; i < 32; i++)
        EraseFlashSector(i);
}

void sub_02010DAC(void)
{
    gUnknown_3001230 = 0;
    gUnknown_3001220 = 0;
    gUnknown_300122C = 0;
}

bool32 sub_02010DC8(u8 action, u8 flagno)
{
    bool32 result = FALSE;
    switch (action)
    {
        case 0:
            gUnknown_300122C |= (1 << flagno);
            break;
        case 1:
            gUnknown_300122C &= ~(1 << flagno);
            break;
        case 2:
            if (gUnknown_300122C & (1 << flagno))
                result = TRUE;
            break;
    }
    return result;
}

u8 sub_02010E2C(u16 a0, const struct SaveBlockChunk * a1)
{
    u8 result;
    u16 i;
    gUnknown_3001234 = (struct UnkEwramStruct *)gUnknown_2020000;
    if (a0 != 0xFFFF)
    {
        result = sub_02010ECC(a0, a1);
    }
    else
    {
        gUnknown_3001228 = gUnknown_3001220;
        gUnknown_3001224 = gUnknown_3001230;
        gUnknown_3001220++;
        gUnknown_3001220 %= 14;
        gUnknown_3001230++;
        result = 1;
        for (i = 0; i < 14; i++)
            sub_02010ECC(i, a1);
        if (gUnknown_300122C)
        {
            result = 0xFF;
            gUnknown_3001220 = gUnknown_3001228;
            gUnknown_3001230 = gUnknown_3001224;
        }
    }
    return result;
}

#ifdef NONMATCHING
u8 sub_02010ECC(u16 a0, const struct SaveBlockChunk * a1)
{
    u16 r3;
    u8 * r10;
    u16 r4;
    u16 r5 = a0 + gUnknown_3001220;
    r5 %= 14;
    r5 += 14 * (gUnknown_3001230 & 1);
    r10 = a1[a0].ptr;
    r4 = a1[a0].size;
    for (r3 = 0; r3 < 0x1000; r3++)
    {
        gUnknown_3001234->unk_0000[r3] = 0;
    }
    gUnknown_3001234->unk_0FF4 = a0;
    gUnknown_3001234->unk_0FF8 = (struct UnkEwramSubstruct){0x25, 0x20, 0x01, 0x08};
    gUnknown_3001234->unk_0FFC = gUnknown_3001230;
    for (r3 = 0; r3 < r4; r3++)
    {
        gUnknown_3001234->unk_0000[r3] = r10[r3];
    }
    gUnknown_3001234->unk_0FF6 = sub_02011800(r10, r4);
    return sub_02011034(r5, gUnknown_3001234->unk_0000);
}
#else
NAKED
u8 sub_02010ECC(u16 a0, const struct SaveBlockChunk * a1)
{
    asm_unified("\tpush {r4, r5, r6, r7, lr}\n"
                "\tmov r7, sl\n"
                "\tmov r6, sb\n"
                "\tmov r5, r8\n"
                "\tpush {r5, r6, r7}\n"
                "\tadds r4, r1, #0\n"
                "\tlsls r0, r0, #0x10\n"
                "\tlsrs r6, r0, #0x10\n"
                "\tldr r0, =gUnknown_3001220\n"
                "\tldrh r0, [r0]\n"
                "\tadds r0, r6, r0\n"
                "\tlsls r0, r0, #0x10\n"
                "\tlsrs r5, r0, #0x10\n"
                "\tadds r0, r5, #0\n"
                "\tmovs r1, #0xe\n"
                "\tbl __umodsi3\n"
                "\tlsls r0, r0, #0x10\n"
                "\tlsrs r5, r0, #0x10\n"
                "\tldr r2, =gUnknown_3001230\n"
                "\tldr r1, [r2]\n"
                "\tmovs r0, #1\n"
                "\tands r1, r0\n"
                "\tlsls r0, r1, #3\n"
                "\tsubs r0, r0, r1\n"
                "\tlsls r0, r0, #1\n"
                "\tadds r0, r5, r0\n"
                "\tlsls r0, r0, #0x10\n"
                "\tlsrs r5, r0, #0x10\n"
                "\tlsls r0, r6, #3\n"
                "\tadds r0, r0, r4\n"
                "\tldr r1, [r0]\n"
                "\tmov sl, r1\n"
                "\tldrh r4, [r0, #4]\n"
                "\tmovs r3, #0\n"
                "\tmov sb, r2\n"
                "\tldr r2, =gUnknown_3001234\n"
                "\tmov ip, r2\n"
                "\tmov r8, ip\n"
                "\tmovs r2, #0\n"
                "\tldr r1, =0x00000FFF\n"
                "_02010F1E:\n"
                "\tmov r7, r8\n"
                "\tldr r0, [r7]\n"
                "\tadds r0, r0, r3\n"
                "\tstrb r2, [r0]\n"
                "\tadds r0, r3, #1\n"
                "\tlsls r0, r0, #0x10\n"
                "\tlsrs r3, r0, #0x10\n"
                "\tcmp r3, r1\n"
                "\tbls _02010F1E\n"
                "\tmov r0, ip\n"
                "\tldr r1, [r0]\n"
                "\tldr r2, =0x00000FF4\n"
                "\tadds r0, r1, r2\n"
                "\tstrh r6, [r0]\n"
                "\tldr r3, =0x00000FF8\n"
                "\tadds r2, r1, r3\n"
                "\tldr r0, =0x08012025\n"
                "\tstr r0, [r2]\n"
                "\tldr r6, =0x00000FFC\n"
                "\tadds r1, r1, r6\n"
                "\tmov r7, sb\n"
                "\tldr r0, [r7]\n"
                "\tstr r0, [r1]\n"
                "\tmovs r3, #0\n"
                "\tlsls r5, r5, #0x18\n"
                "\tcmp r3, r4\n"
                "\tbhs _02010F6C\n"
                "\tmov r2, ip\n"
                "_02010F56:\n"
                "\tldr r1, [r2]\n"
                "\tadds r1, r1, r3\n"
                "\tmov r6, sl\n"
                "\tadds r0, r6, r3\n"
                "\tldrb r0, [r0]\n"
                "\tstrb r0, [r1]\n"
                "\tadds r0, r3, #1\n"
                "\tlsls r0, r0, #0x10\n"
                "\tlsrs r3, r0, #0x10\n"
                "\tcmp r3, r4\n"
                "\tblo _02010F56\n"
                "_02010F6C:\n"
                "\tmov r0, sl\n"
                "\tadds r1, r4, #0\n"
                "\tbl sub_02011800\n"
                "\tldr r1, =gUnknown_3001234\n"
                "\tldr r1, [r1]\n"
                "\tldr r7, =0x00000FF6\n"
                "\tadds r2, r1, r7\n"
                "\tstrh r0, [r2]\n"
                "\tlsrs r0, r5, #0x18\n"
                "\tbl sub_02011034\n"
                "\tlsls r0, r0, #0x18\n"
                "\tlsrs r0, r0, #0x18\n"
                "\tpop {r3, r4, r5}\n"
                "\tmov r8, r3\n"
                "\tmov sb, r4\n"
                "\tmov sl, r5\n"
                "\tpop {r4, r5, r6, r7}\n"
                "\tpop {r1}\n"
                "\tbx r1\n"
                "\t.pool");
}
#endif

#ifdef NONMATCHING
u8 sub_02010FBC(u8 a0, u8 * a1, u16 a2)
{
    u16 r3;
    struct UnkEwramStruct *r4 = &UnkFlashData;
    for (r3 = 0; r3 < 0x1000; r3++)
    {
        r4->unk_0000[r3] = 0;
    }
    r4->unk_0FF8 = (struct UnkEwramSubstruct){0x25, 0x20, 0x01, 0x08};
    for (r3 = 0; r3 < a2; r3++)
    {
        r4->unk_0000[r3] = a1[r3];
    }
    r4->unk_0FF4 = sub_02011800(a1, a2);
    return sub_02011034(a0, r4);
}
#else
NAKED
void sub_02010FBC(u8 a0, u8 * a1, u16 a2)
{
    asm_unified("\tpush {r4, r5, r6, r7, lr}\n"
                "\tadds r5, r1, #0\n"
                "\tlsls r0, r0, #0x18\n"
                "\tlsrs r7, r0, #0x18\n"
                "\tlsls r2, r2, #0x10\n"
                "\tlsrs r2, r2, #0x10\n"
                "\tldr r4, =gUnknown_2020000\n"
                "\tmovs r3, #0\n"
                "\tmovs r6, #0\n"
                "\tldr r1, =0x00000FFF\n"
                "_02010FD0:\n"
                "\tadds r0, r4, r3\n"
                "\tstrb r6, [r0]\n"
                "\tadds r0, r3, #1\n"
                "\tlsls r0, r0, #0x10\n"
                "\tlsrs r3, r0, #0x10\n"
                "\tcmp r3, r1\n"
                "\tbls _02010FD0\n"
                "\tldr r0, =0x00000FF8\n"
                "\tadds r0, r4, r0\n"
                "\tldr r1, =0x08012025\n"
                "\tstr r1, [r0]\n"
                "\tmovs r3, #0\n"
                "\tcmp r3, r2\n"
                "\tbhs _02010FFE\n"
                "_02010FEC:\n"
                "\tadds r1, r4, r3\n"
                "\tadds r0, r5, r3\n"
                "\tldrb r0, [r0]\n"
                "\tstrb r0, [r1]\n"
                "\tadds r0, r3, #1\n"
                "\tlsls r0, r0, #0x10\n"
                "\tlsrs r3, r0, #0x10\n"
                "\tcmp r3, r2\n"
                "\tblo _02010FEC\n"
                "_02010FFE:\n"
                "\tadds r0, r5, #0\n"
                "\tadds r1, r2, #0\n"
                "\tbl sub_02011800\n"
                "\tldr r1, =0x00000FF4\n"
                "\tadds r1, r4, r1\n"
                "\tstrh r0, [r1]\n"
                "\tadds r0, r7, #0\n"
                "\tadds r1, r4, #0\n"
                "\tbl sub_02011034\n"
                "\tlsls r0, r0, #0x18\n"
                "\tlsrs r0, r0, #0x18\n"
                "\tpop {r4, r5, r6, r7}\n"
                "\tpop {r1}\n"
                "\tbx r1\n"
                "\t.pool");
}
#endif

u8 sub_02011034(u8 a0, u8 * a1)
{
    if (ProgramFlashSectorAndVerify(a0, a1))
    {
        sub_02010DC8(0, a0);
        return 0xFF;
    }
    sub_02010DC8(1, a0);
    return 1;
}

s32 sub_02011060(void)
{
    gUnknown_3001234 = (struct UnkEwramStruct *)gUnknown_2020000;
    gUnknown_3001228 = gUnknown_3001220;
    gUnknown_3001224 = gUnknown_3001230;
    gUnknown_3001220++;
    gUnknown_3001220 %= 14;
    gUnknown_3001230++;
    gUnknown_3001238 = 0;
    gUnknown_300122C = 0;
    return 0;
}

s32 sub_020110BC(void)
{
    gUnknown_3001234 = (struct UnkEwramStruct *)gUnknown_2020000;
    gUnknown_3001228 = gUnknown_3001220;
    gUnknown_3001224 = gUnknown_3001230;
    gUnknown_3001238 = 0;
    gUnknown_300122C = 0;
    return 0;
}

u8 sub_02011000(u16 a0, const struct SaveBlockChunk * a1)
{
    u8 response;
    if (gUnknown_3001238 < a0 - 1)
    {
        response = 1;
        sub_02010ECC(gUnknown_3001238, a1);
        gUnknown_3001238++;
        if (gUnknown_300122C != 0)
        {
            response = 0xFF;
            gUnknown_3001220 = gUnknown_3001228;
            gUnknown_3001230 = gUnknown_3001224;
        }
    }
    else
        response = 0xFF;
    return response;
}

u8 sub_02011160(u16 a0, const struct SaveBlockChunk * a1)
{
    u8 response = 1;
    sub_020111AC(a0 - 1, a1);
    if (gUnknown_300122C != 0)
    {
        response = 0xFF;
        gUnknown_3001220 = gUnknown_3001228;
        gUnknown_3001230 = gUnknown_3001224;
    }
    return response;
}

#ifdef NONMATCHING
u8 sub_020111AC(u16 a0, const struct SaveBlockChunk * a1)
{
    u8 * r10;
    u16 r3;
    u16 r4;
    u8 result;
    u16 r5 = a0 + gUnknown_3001220;
    r5 %= 14;
    r5 += 14 * (gUnknown_3001230 & 1);
    r10 = a1[a0].ptr;
    r3 = a1[a0].size;
    for (r4 = 0; r4 < 0x1000; r4++)
    {
        gUnknown_3001234->unk_0000[r4] = 0;
    }
    gUnknown_3001234->unk_0FF4 = a0;
    gUnknown_3001234->unk_0FF8 = (struct UnkEwramSubstruct){0x25, 0x20, 0x01, 0x08};
    gUnknown_3001234->unk_0FFC = gUnknown_3001230;
    for (r4 = 0; r4 < r3; r4++)
    {
        gUnknown_3001234->unk_0000[r4] = r10[r4];
    }
    gUnknown_3001234->unk_0FF6 = sub_02011800(r10, r3);
    EraseFlashSector(r5);
    result = 1;
    for (r4 = 0; r4 < 0xFF8; r4++)
    {
        if (ProgramFlashByte(r5, r4, gUnknown_3001234->unk_0000[r4]))
        {
            result = 0xFF;
            break;
        }
    }
    if (result == 0xFF)
    {
        sub_02010DC8(0, r5);
        return 0xFF;
    }
    result = 1;
    for (r4 = 0; r4 < 7; r4++)
    {
        if (ProgramFlashByte(r5, r4 + 0xFF9, (&gUnknown_3001234->unk_0FF8.unk1)[r4]))
        {
            result = 0xFF;
            break;
        }
    }
    if (result == 0xFF)
    {
        sub_02010DC8(0, r5);
        return 0xFF;
    }
    sub_02010DC8(1, r5);
    return 1;
}
#else
NAKED
u8 sub_020111AC(u16 a0, const struct SaveBlockChunk * a1)
{
    asm_unified("\tpush {r4, r5, r6, r7, lr}\n"
                "\tmov r7, sl\n"
                "\tmov r6, sb\n"
                "\tmov r5, r8\n"
                "\tpush {r5, r6, r7}\n"
                "\tadds r4, r1, #0\n"
                "\tlsls r0, r0, #0x10\n"
                "\tlsrs r6, r0, #0x10\n"
                "\tldr r0, =gUnknown_3001220\n"
                "\tldrh r0, [r0]\n"
                "\tadds r0, r6, r0\n"
                "\tlsls r0, r0, #0x10\n"
                "\tlsrs r5, r0, #0x10\n"
                "\tadds r0, r5, #0\n"
                "\tmovs r1, #0xe\n"
                "\tbl __umodsi3\n"
                "\tlsls r0, r0, #0x10\n"
                "\tlsrs r5, r0, #0x10\n"
                "\tldr r2, =gUnknown_3001230\n"
                "\tldr r1, [r2]\n"
                "\tmovs r0, #1\n"
                "\tands r1, r0\n"
                "\tlsls r0, r1, #3\n"
                "\tsubs r0, r0, r1\n"
                "\tlsls r0, r0, #1\n"
                "\tadds r0, r5, r0\n"
                "\tlsls r0, r0, #0x10\n"
                "\tlsrs r5, r0, #0x10\n"
                "\tlsls r0, r6, #3\n"
                "\tadds r0, r0, r4\n"
                "\tldr r1, [r0]\n"
                "\tmov sl, r1\n"
                "\tldrh r3, [r0, #4]\n"
                "\tmovs r4, #0\n"
                "\tmov sb, r2\n"
                "\tldr r2, =gUnknown_3001234\n"
                "\tmov ip, r2\n"
                "\tmov r8, ip\n"
                "\tmovs r2, #0\n"
                "\tldr r1, =0x00000FFF\n"
                "_020111FE:\n"
                "\tmov r7, r8\n"
                "\tldr r0, [r7]\n"
                "\tadds r0, r0, r4\n"
                "\tstrb r2, [r0]\n"
                "\tadds r0, r4, #1\n"
                "\tlsls r0, r0, #0x10\n"
                "\tlsrs r4, r0, #0x10\n"
                "\tcmp r4, r1\n"
                "\tbls _020111FE\n"
                "\tmov r0, ip\n"
                "\tldr r1, [r0]\n"
                "\tldr r2, =0x00000FF4\n"
                "\tadds r0, r1, r2\n"
                "\tstrh r6, [r0]\n"
                "\tldr r6, =0x00000FF8\n"
                "\tadds r2, r1, r6\n"
                "\tldr r0, =0x08012025\n"
                "\tstr r0, [r2]\n"
                "\tldr r7, =0x00000FFC\n"
                "\tadds r1, r1, r7\n"
                "\tmov r2, sb\n"
                "\tldr r0, [r2]\n"
                "\tstr r0, [r1]\n"
                "\tmovs r4, #0\n"
                "\tlsls r6, r5, #0x18\n"
                "\tmov r8, r6\n"
                "\tcmp r4, r3\n"
                "\tbhs _0201124E\n"
                "\tmov r2, ip\n"
                "_02011238:\n"
                "\tldr r1, [r2]\n"
                "\tadds r1, r1, r4\n"
                "\tmov r7, sl\n"
                "\tadds r0, r7, r4\n"
                "\tldrb r0, [r0]\n"
                "\tstrb r0, [r1]\n"
                "\tadds r0, r4, #1\n"
                "\tlsls r0, r0, #0x10\n"
                "\tlsrs r4, r0, #0x10\n"
                "\tcmp r4, r3\n"
                "\tblo _02011238\n"
                "_0201124E:\n"
                "\tmov r0, sl\n"
                "\tadds r1, r3, #0\n"
                "\tbl sub_02011800\n"
                "\tldr r1, =gUnknown_3001234\n"
                "\tldr r1, [r1]\n"
                "\tldr r2, =0x00000FF6\n"
                "\tadds r1, r1, r2\n"
                "\tstrh r0, [r1]\n"
                "\tldr r0, =EraseFlashSector\n"
                "\tldr r1, [r0]\n"
                "\tadds r0, r5, #0\n"
                "\tbl _call_via_r1\n"
                "\tmovs r6, #1\n"
                "\tmovs r4, #0\n"
                "\tldr r7, =0x00000FF7\n"
                "\tmov sb, r7\n"
                "\tldr r7, =ProgramFlashByte\n"
                "\tb _020112AE\n"
                "\t.pool\n"
                "_020112A8:\n"
                "\tadds r0, r4, #1\n"
                "\tlsls r0, r0, #0x10\n"
                "\tlsrs r4, r0, #0x10\n"
                "_020112AE:\n"
                "\tcmp r4, sb\n"
                "\tbhi _020112CC\n"
                "\tldr r0, =gUnknown_3001234\n"
                "\tldr r0, [r0]\n"
                "\tadds r0, r0, r4\n"
                "\tldrb r2, [r0]\n"
                "\tldr r3, [r7]\n"
                "\tadds r0, r5, #0\n"
                "\tadds r1, r4, #0\n"
                "\tbl _call_via_r3\n"
                "\tlsls r0, r0, #0x10\n"
                "\tcmp r0, #0\n"
                "\tbeq _020112A8\n"
                "\tmovs r6, #0xff\n"
                "_020112CC:\n"
                "\tcmp r6, #0xff\n"
                "\tbne _020112DC\n"
                "\tmov r0, r8\n"
                "\tlsrs r1, r0, #0x18\n"
                "\tb _02011334\n"
                "\t.pool\n"
                "_020112DC:\n"
                "\tmovs r6, #1\n"
                "\tmovs r4, #0\n"
                "\tldr r1, =ProgramFlashByte\n"
                "\tmov sb, r1\n"
                "\tldr r7, =0x00000FF9\n"
                "\tb _020112F6\n"
                "\t.pool\n"
                "_020112F0:\n"
                "\tadds r0, r4, #1\n"
                "\tlsls r0, r0, #0x10\n"
                "\tlsrs r4, r0, #0x10\n"
                "_020112F6:\n"
                "\tcmp r4, #6\n"
                "\tbhi _02011318\n"
                "\tadds r1, r4, r7\n"
                "\tldr r0, =gUnknown_3001234\n"
                "\tldr r0, [r0]\n"
                "\tadds r0, r4, r0\n"
                "\tadds r0, r0, r7\n"
                "\tldrb r2, [r0]\n"
                "\tmov r0, sb\n"
                "\tldr r3, [r0]\n"
                "\tadds r0, r5, #0\n"
                "\tbl _call_via_r3\n"
                "\tlsls r0, r0, #0x10\n"
                "\tcmp r0, #0\n"
                "\tbeq _020112F0\n"
                "\tmovs r6, #0xff\n"
                "_02011318:\n"
                "\tcmp r6, #0xff\n"
                "\tbeq _02011330\n"
                "\tmov r2, r8\n"
                "\tlsrs r1, r2, #0x18\n"
                "\tmovs r0, #1\n"
                "\tbl sub_02010DC8\n"
                "\tmovs r0, #1\n"
                "\tb _0201133C\n"
                "\t.pool\n"
                "_02011330:\n"
                "\tmov r6, r8\n"
                "\tlsrs r1, r6, #0x18\n"
                "_02011334:\n"
                "\tmovs r0, #0\n"
                "\tbl sub_02010DC8\n"
                "\tmovs r0, #0xff\n"
                "_0201133C:\n"
                "\tpop {r3, r4, r5}\n"
                "\tmov r8, r3\n"
                "\tmov sb, r4\n"
                "\tmov sl, r5\n"
                "\tpop {r4, r5, r6, r7}\n"
                "\tpop {r1}\n"
                "\tbx r1");
}
#endif

u8 sub_0201134C(u16 a0)
{
    u16 r4 = a0 + gUnknown_3001220 - 1;
    r4 %= 14;
    r4 += 14 * (gUnknown_3001230 & 1);
    if (ProgramFlashByte(r4, 0xFF8, gUnknown_3001234->unk_0FF8.unk0))
    {
        sub_02010DC8(0, r4);
        gUnknown_3001220 = gUnknown_3001228;
        gUnknown_3001230 = gUnknown_3001224;
        return 0xFF;
    }
    sub_02010DC8(1, r4);
    return 1;
}

u8 sub_020113E4(u16 a0)
{
    u16 r4 = a0 + gUnknown_3001220 - 1;
    r4 %= 14;
    r4 += 14 * (gUnknown_3001230 & 1);
    if (ProgramFlashByte(r4, 0xFF8, 0x25))
    {
        sub_02010DC8(0, r4);
        gUnknown_3001220 = gUnknown_3001228;
        gUnknown_3001230 = gUnknown_3001224;
        return 0xFF;
    }
    sub_02010DC8(1, r4);
    return 1;
}

u8 sub_02011470(u16 a0, const struct SaveBlockChunk * a1)
{
    u8 result;
    gUnknown_3001234 = (struct UnkEwramStruct *)gUnknown_2020000;
    if (a0 != 0xFFFF)
        result = 0xFF;
    else
    {
        result = sub_02011568(a1);
        sub_020114B0(a0, a1);
    }
    return result;
}

u8 sub_020114B0(u16 a0, const struct SaveBlockChunk * a1)
{
    u16 r7 = 14 * (gUnknown_3001230 & 1);
    u16 r5;
    u16 r3;
    u16 r1;
    for (r5 = 0; r5 < 14; r5++)
    {
        sub_020117E8(r5 + r7, gUnknown_3001234->unk_0000);
        r1 = gUnknown_3001234->unk_0FF4;
        if (r1 == 0)
            gUnknown_3001220 = r5;
        r3 = sub_02011800(gUnknown_3001234->unk_0000, a1[r1].size);
        if (*(u32 *)&gUnknown_3001234->unk_0FF8 == 0x08012025 && gUnknown_3001234->unk_0FF6 == r3)
        {
            memcpy(a1[r1].ptr, gUnknown_3001234->unk_0000, a1[r1].size);
        }
    }
    return 1;
}
