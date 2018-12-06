#include <gba/gba.h>
#include "rs.h"

extern IntrFunc gIntrTable[13];
extern u8 gUnknown_3001090[0x100];
extern u32 gUnknown_3001204;
extern u32 gUnknown_3001194;
extern u32 gUnknown_30011A0;
extern u32 gUnknown_2020000;

extern void IntrMain(void);
extern void sub_02010C9C(void);
extern void sub_020101C4(void);
extern void sub_0201031C(u32 *, void *, void *);

extern u32 gUnknown_2012C90;
extern const IntrFunc gUnknown_2012C98[13];

void AgbMain(void)
{
    RegisterRamReset(0x1E);
    DmaCopy32(3, gUnknown_2012C98, gIntrTable, sizeof gIntrTable);
    DmaCopy32(3, IntrMain, gUnknown_3001090, sizeof(gUnknown_3001090));
    INTR_VECTOR = gUnknown_3001090;
    REG_IE = INTR_FLAG_VBLANK;
    if (RomHeaderMagic == 0x96 && RomHeaderGameCode == gUnknown_2012C90)
        REG_IE |= INTR_FLAG_GAMEPAK;
    REG_DISPSTAT = DISPSTAT_VBLANK_INTR;
    REG_IME = INTR_FLAG_VBLANK;
    sub_02010C9C();
    gUnknown_3001204 = 0;
    gUnknown_3001194 = 0;
    for (;;)
    {
        VBlankIntrWait();
        sub_020101C4();
        sub_0201031C(&gUnknown_3001204, &gUnknown_30011A0, &gUnknown_2020000);
    }
}
