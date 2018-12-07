#include <gba/gba.h>
#include "global.h"
#include "main.h"
#include "rtc.h"

BSS_DATA s32 gUnknown_3001000;
BSS_DATA s32 gFiller_3001004;
IntrFunc gIntrTable[16];
u16 gHeldKeys;
u16 gNewKeys;
u8 gUnknown_3001090[0x100];
u32 gUnknown_3001190;
u32 gUnknown_3001194;
u32 gFiller_3001198;
u32 gFiller_300119C;
u32 gUnknown_30011A0;
u8 gFiller_30011A4[0x54];
u32 gUnknown_3001204;
u32 gGameVersion;

EWRAM_DATA u8 gUnknown_2020000[0xFF4] = {};
EWRAM_DATA u8 gUnknown_2020FF4[0xBDC] = {};
EWRAM_DATA u8 gUnknown_2021BD0[0x6430] = {};

void IntrMain(void);
void sub_02010C9C(void);
void ReadKeys(void);
void sub_020101C0(void);
void sub_020101BC(void);
void main_callback(u32 *, void *, void *);
bool32 sub_0201189C(void);
bool32 sub_02010B9C(void);
bool8 sub_02010C80(u32);

void sub_02010D00(u32);
bool32 sub_02011864(void);

const char gBerryFixGameCode[] = "AGBJ";
const IntrFunc gIntrFuncPointers[] = {
    sub_020101C0,
    sub_020101BC,
    sub_020101C0,
    sub_020101C0,
    sub_020101C0,
    sub_020101C0,
    sub_020101C0,
    sub_020101C0,
    sub_020101C0,
    sub_020101C0,
    NULL,
    NULL,
    NULL
};
const char gVersionData[][2] = {
    {'J', 1},
    {'E', 2},
    {'D', 1},
    {'F', 1},
    {'I', 1},
    {'S', 1}
};
const char gRubyTitleAndCode[] = "POKEMON RUBYAXV";
const char gSapphireTitleAndCode[] = "POKEMON SAPPAXP";
const u16 gUnknown_2012CF8[20] = {
    RGB(00, 00, 00),
    RGB(31, 00, 00),
    RGB(00, 31, 00),
    RGB(00, 00, 31)
};
const u16 gUnknown_2012D20[] = INCBIN_U16("graphics/unk_2D20.4bpp");

void AgbMain(void)
{
    RegisterRamReset(0x1E);
    DmaCopy32(3, gIntrFuncPointers, gIntrTable, sizeof gIntrFuncPointers);
    DmaCopy32(3, IntrMain, gUnknown_3001090, sizeof(gUnknown_3001090));
    INTR_VECTOR = gUnknown_3001090;
    REG_IE = INTR_FLAG_VBLANK;
    if (*RomHeaderMagic == 0x96 && *(u32 *)RomHeaderGameCode == *(u32 *)gBerryFixGameCode)
        REG_IE |= INTR_FLAG_GAMEPAK;
    REG_DISPSTAT = DISPSTAT_VBLANK_INTR;
    REG_IME = INTR_FLAG_VBLANK;
    sub_02010C9C();
    gUnknown_3001204 = 0;
    gUnknown_3001194 = 0;
    for (;;)
    {
        VBlankIntrWait();
        ReadKeys();
        main_callback(&gUnknown_3001204, &gUnknown_30011A0, gUnknown_2020000);
    }
}

void sub_020101BC(void)
{}

void sub_020101C0(void)
{}

void ReadKeys(void)
{
    u16 keyInput = REG_KEYINPUT ^ KEYS_MASK;
    gNewKeys = keyInput & ~gHeldKeys;
    gHeldKeys = keyInput;
}

void fill_palette(const u8 * src, u16 * dest, u8 value)
{
    s32 i;
    for (i = 0; src[i] != 0; i++)
        dest[i] = src[i] | value << 12;
}

bool32 berry_fix_memcmp(const char * src1, const char * src2, size_t size)
{
    s32 i;
    for (i = 0; i < size; i++)
    {
        if (src1[i] != src2[i])
            return FALSE;
    }
    return TRUE;
}

#ifdef NONMATCHING
s32 validate_rom_header_internal(void)
{
    s32 languageCode = *(RomHeaderGameCode + 3);
    s32 softwareVersion = *RomHeaderSoftwareVersion;
    s32 shouldUpdate = -1;
    s32 i;
    for (i = 0; i < NELEMS(gVersionData); ++i)
    {
        if (languageCode == gVersionData[i][0])
        {
            shouldUpdate = softwareVersion < gVersionData[i][1];
            break;
        }
    }
    if (shouldUpdate != -1)
    {
        if (berry_fix_memcmp(RomHeaderGameTitle, gRubyTitleAndCode, 15) == TRUE)
        {
            if (shouldUpdate == 0)
                return 5;
            else
            {
                gGameVersion = VERSION_RUBY;
                return 3;
            }
        }
        else if (berry_fix_memcmp(RomHeaderGameTitle, gSapphireTitleAndCode, 15) == TRUE)
        {
            if (shouldUpdate == 0)
                return 4;
            else
            {
                gGameVersion = VERSION_SAPPHIRE;
                return 2;
            }
        }
    }
    return 6;
}
#else
NAKED
s32 validate_rom_header_internal(void)
{
    asm(".syntax unified\n"
        "\tpush {r4, r5, r6, lr}\n"
        "\tldr r0, =RomHeaderGameCode + 3\n"
        "\tldrb r3, [r0]\n"
        "\tadds r0, #0xd\n"
        "\tldrb r4, [r0]\n"
        "\tmovs r5, #1\n"
        "\trsbs r5, r5, #0\n"
        "\tmovs r2, #0\n"
        "\tldr r1, =gVersionData + 1\n"
        "\tsubs r0, r1, #1\n"
        "\tb _0201026E\n"
        "\t.pool\n"
        "_02010264:\n"
        "\tadds r1, #2\n"
        "\tadds r0, #2\n"
        "\tadds r2, #1\n"
        "\tcmp r2, #5\n"
        "\tbhi _0201027E\n"
        "_0201026E:\n"
        "\tldrb r6, [r0]\n"
        "\tcmp r3, r6\n"
        "\tbne _02010264\n"
        "\tmovs r5, #1\n"
        "\tldrb r1, [r1]\n"
        "\tcmp r4, r1\n"
        "\tblt _0201027E\n"
        "\tmovs r5, #0\n"
        "_0201027E:\n"
        "\tmovs r0, #1\n"
        "\trsbs r0, r0, #0\n"
        "\tcmp r5, r0\n"
        "\tbeq _020102E0\n"
        "\tldr r4, =RomHeaderGameTitle\n"
        "\tldr r1, =gRubyTitleAndCode\n"
        "\tadds r0, r4, #0\n"
        "\tmovs r2, #0xf\n"
        "\tbl berry_fix_memcmp\n"
        "\tcmp r0, #1\n"
        "\tbne _020102B8\n"
        "\tcmp r5, #0\n"
        "\tbne _020102A8\n"
        "\tmovs r0, #5\n"
        "\tb _020102E2\n"
        "\t.pool\n"
        "_020102A8:\n"
        "\tldr r1, =gGameVersion\n"
        "\tmovs r0, #2\n"
        "\tstr r0, [r1]\n"
        "\tmovs r0, #3\n"
        "\tb _020102E2\n"
        "\t.pool\n"
        "_020102B8:\n"
        "\tldr r1, =gSapphireTitleAndCode\n"
        "\tadds r0, r4, #0\n"
        "\tmovs r2, #0xf\n"
        "\tbl berry_fix_memcmp\n"
        "\tadds r1, r0, #0\n"
        "\tcmp r1, #1\n"
        "\tbne _020102E0\n"
        "\tcmp r5, #0\n"
        "\tbne _020102D4\n"
        "\tmovs r0, #4\n"
        "\tb _020102E2\n"
        "\t.pool\n"
        "_020102D4:\n"
        "\tldr r0, =gGameVersion\n"
        "\tstr r1, [r0]\n"
        "\tmovs r0, #2\n"
        "\tb _020102E2\n"
        "\t.pool\n"
        "_020102E0:\n"
        "\tmovs r0, #6\n"
        "_020102E2:\n"
        "\tpop {r4, r5, r6}\n"
        "\tpop {r1}\n"
        "\tbx r1\n"
        "\t.syntax divided");
}
#endif

s32 validate_rom_header(void)
{
    if (*RomHeaderMakerCode == '0' && *(RomHeaderMakerCode + 1) == '1' && *RomHeaderMagic == 0x96)
        return validate_rom_header_internal();
    else
        return 6;
}

void main_callback(u32 * a0, void * unused1, void * unused2)
{
    u8 sp0;
    switch (*a0)
    {
        case 0:
            sub_02010D00(0);
            if (++gUnknown_3001000 >= 180)
            {
                gUnknown_3001000 = 0;
                gUnknown_3001190 = 0;
                switch (validate_rom_header())
                {
                    case 2: // Should Update Sapphire
                    case 3: // Should Update Ruby
                        ++(*a0);
                        break;
                    case 6: // Invalid header
                        *a0 = 11;
                        break;
                    case 4: // Should not update Sapphire
                    case 5: // Should not update Ruby
                        *a0 = 6;
                        break;
                }
            }
            break;
        case 1:
            if (!sub_02010960())
                *a0 = 11;
            else
                ++(*a0);
            break;
        case 2:
            if (sub_02010B9C() == TRUE)
                ++(*a0);
            else
                *a0 = 11;
            break;
        case 3:
            if (sub_02010C80(0) == TRUE)
                ++(*a0);
            else
                *a0 = 11;
            break;
        case 4:
            if (sub_020109A8(&sp0) == TRUE)
            {
                if (sp0 == 0)
                    ++(*a0);
                else
                    *a0 = 9;
            }
            else
            {
                if (sp0 != 1)
                    *a0 = 7;
                else
                    ++(*a0);
            }
            break;
        case 5:
            sub_02010B2C();
            gUnknown_3001190 |= 1;
            *a0 = 9;
            break;
        case 9:
            if (sub_02011864() == TRUE)
                *a0 = 8;
            else
                *a0 = 10;
            break;
        case 10:
            sub_02010D00(4);
            if (sub_0201189C() == TRUE)
            {
                gUnknown_3001190 |= 1;
                *a0 = 8;
            }
            else
                *a0 = 11;
            break;
        case 8:
            if (gUnknown_3001190 == 0)
                *a0 = 6;
            else
                sub_02010D00(1);
            break;
        case 6:
            sub_02010D00(3);
            break;
        case 7:
            sub_02010D00(2);
            break;
        case 11:
            sub_02010D00(2);
            break;
    }
}

void sub_02010490(void)
{
    register u16 * dest asm("r3");
    const u16 * src;
    s32 i;
    dest = (u16 *)BG_PLTT + 1;
    DmaFill16(3, RGB(31, 31, 31), (void *)BG_PLTT, BG_PLTT_SIZE);
    src = gUnknown_2012CF8;
    for (i = 0; i < 4; i++)
    {
        *dest = *src;
        dest += 16;
        src++;
    }
}

void sub_020104DC(void)
{
    DmaFill16(3, 0x1111, (void *)VRAM + 0x8420, 0x1800);
    DmaCopy32(3, gUnknown_2012D20, (void *)VRAM + 0x8600, 0x200);
    sub_02010490();
}
