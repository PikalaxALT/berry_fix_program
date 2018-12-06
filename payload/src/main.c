#include <gba/gba.h>
#include "rs.h"

extern IntrFunc gIntrTable[13];
extern u16 gUnknown_3001080;
extern u16 gUnknown_3001084;
extern u8 gUnknown_3001090[0x100];
extern u32 gUnknown_3001194;
extern u32 gUnknown_30011A0;
extern u32 gUnknown_3001204;
extern u32 gUnknown_3001208;

extern u32 gUnknown_2020000;

extern void IntrMain(void);
extern void sub_02010C9C(void);
extern void ReadKeys(void);
extern void sub_0201031C(u32 *, void *, void *);

extern u32 gBerryFixGameCode;
extern const IntrFunc gIntrFuncPointers[13];
extern const char gVersionData[6][2];
extern const char gRubyTitleAndCode[16];
extern const char gSapphrieTitleAndCode[16];

void AgbMain(void)
{
    RegisterRamReset(0x1E);
    DmaCopy32(3, gIntrFuncPointers, gIntrTable, sizeof gIntrTable);
    DmaCopy32(3, IntrMain, gUnknown_3001090, sizeof(gUnknown_3001090));
    INTR_VECTOR = gUnknown_3001090;
    REG_IE = INTR_FLAG_VBLANK;
    if (RomHeaderMagic == 0x96 && *(u32 *)RomHeaderGameCode == gBerryFixGameCode)
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
        sub_0201031C(&gUnknown_3001204, &gUnknown_30011A0, &gUnknown_2020000);
    }
}

void sub_020101BC(void)
{}

void sub_020101C0(void)
{}

void ReadKeys(void)
{
    u16 keyInput = REG_KEYINPUT ^ KEYS_MASK;
    gUnknown_3001084 = keyInput & ~gUnknown_3001080;
    gUnknown_3001080 = keyInput;
}

void sub_020101F4(const u8 * src, u16 * dest, u8 value)
{
    s32 i;
    for (i = 0; src[i] != 0; i++)
        dest[i] = src[i] | value << 12;
}

bool32 sub_02010218(const char * src1, const char * src2, size_t size)
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
s32 sub_02010244(void)
{
    u32 r2;
    s32 r3, r4, r5;
    const void * ptr = RomHeaderGameCode + 3;
    r3 = *(const u8 *)ptr;
    ptr += 13;
    r4 = *(const u8 *)ptr;
    r5 = -1;
    for (r2 = 0; r2 < 6; r2++)
    {
        if (r3 == gVersionData[r2][0])
        {
            r5 = r4 < gVersionData[r2][1] ? 1 : 0;
            break;
        }
    }
    if (r5 != -1)
    {
        if (sub_02010218(RomHeaderGameTitle, gRubyTitleAndCode, 15) == TRUE)
        {
            if (r5 == 0)
                return 5;
            else
            {
                gUnknown_3001208 = 2;
                return 3;
            }
        }
        else if (sub_02010218(RomHeaderGameTitle, gSapphrieTitleAndCode, 15) == TRUE)
        {
            if (r5 == 0)
                return 4;
            else
            {
                gUnknown_3001208 = 1;
                return 2;
            }
        }
    }
    return 6;
}
#else
NAKED
s32 sub_02010244(void)
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
        "\tbl sub_02010218\n"
        "\tcmp r0, #1\n"
        "\tbne _020102B8\n"
        "\tcmp r5, #0\n"
        "\tbne _020102A8\n"
        "\tmovs r0, #5\n"
        "\tb _020102E2\n"
        "\t.pool\n"
        "_020102A8:\n"
        "\tldr r1, =gUnknown_3001208\n"
        "\tmovs r0, #2\n"
        "\tstr r0, [r1]\n"
        "\tmovs r0, #3\n"
        "\tb _020102E2\n"
        "\t.pool\n"
        "_020102B8:\n"
        "\tldr r1, =gSapphrieTitleAndCode\n"
        "\tadds r0, r4, #0\n"
        "\tmovs r2, #0xf\n"
        "\tbl sub_02010218\n"
        "\tadds r1, r0, #0\n"
        "\tcmp r1, #1\n"
        "\tbne _020102E0\n"
        "\tcmp r5, #0\n"
        "\tbne _020102D4\n"
        "\tmovs r0, #4\n"
        "\tb _020102E2\n"
        "\t.pool\n"
        "_020102D4:\n"
        "\tldr r0, =gUnknown_3001208\n"
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
