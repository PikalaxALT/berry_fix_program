#include <gba/gba.h>
#include "global.h"
#include "main.h"
#include "rtc.h"
#include "flash.h"

static s32 gUnknown_3001000;
IntrFunc gIntrTable[16];
u16 gHeldKeys;
u16 gNewKeys;
u8 gUnknown_3001090[0x100];
u32 gUnknown_3001190;
u32 gUnknown_3001194;
u32 gUnknown_30011A0[0x19];
u32 gUnknown_3001204;
u32 gGameVersion;

EWRAM_DATA u8 gSharedMem[0x8000] = {};

void IntrMain(void);
void ReadKeys(void);
void sub_020101C0(void);
void sub_020101BC(void);
void main_callback(u32 *, void *, void *);
bool32 sub_02010B9C(void);
bool8 sub_02010C80(u32);


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
    msg_load_gfx();
    gUnknown_3001204 = 0;
    gUnknown_3001194 = 0;
    for (;;)
    {
        VBlankIntrWait();
        ReadKeys();
        main_callback(&gUnknown_3001204, gUnknown_30011A0, gSharedMem);
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

s32 validate_rom_header_internal(void)
{
    char languageCode = *(RomHeaderGameCode + 3);
    s32 softwareVersion = *RomHeaderSoftwareVersion;
    s32 shouldUpdate = -1;
    s32 i;
    for (i = 0; i < ARRAY_COUNT(gVersionData); i++)
    {
        if (languageCode == gVersionData[i][0])
        {
            if (softwareVersion >= gVersionData[i][1])
            {
                shouldUpdate = 0;
            }
            else
            {
                shouldUpdate = 1;
            }
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
            msg_display(0);
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
            msg_display(4);
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
                msg_display(1);
            break;
        case 6:
            msg_display(3);
            break;
        case 7:
            msg_display(2);
            break;
        case 11:
            msg_display(2);
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
