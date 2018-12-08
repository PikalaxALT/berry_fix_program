#ifndef GUARD_MAIN_H
#define GUARD_MAIN_H

#include <gba/gba.h>

extern IntrFunc gIntrTable[];
extern u16 gHeldKeys;
extern u16 gNewKeys;
extern u8 gUnknown_3001090[];
extern u32 gUnknown_3001190;
extern u32 gUnknown_3001194;
extern u32 gUnknown_30011A0;
extern u32 gUnknown_3001204;
extern u32 gGameVersion;

extern u8 gUnknown_2020000[0xFF4];
extern u8 gUnknown_2020FF4[0xBDC];
extern u8 gUnknown_2021BD0[0x6430];

extern const IntrFunc gIntrFuncPointers[];

#endif //GUARD_MAIN_H
