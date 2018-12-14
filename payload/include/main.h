#ifndef GUARD_MAIN_H
#define GUARD_MAIN_H

#include <gba/gba.h>

enum RomHeaderValidationResult
{
    SAPPHIRE_UPDATABLE = 2,
    RUBY_UPDATABLE,
    SAPPHIRE_NONEED,
    RUBY_NONEED,
    INVALID
};

extern IntrFunc gIntrTable[];
extern u16 gHeldKeys;
extern u16 gNewKeys;
extern u8 gUnknown_3001090[];
extern u32 gUpdateNotNeeded;
extern u32 gUnknown_3001194;
extern u32 gUnknown_30011A0[];
extern u32 gUnknown_3001204;
extern u32 gGameVersion;

extern u8 gSharedMem[0x8000];

extern const IntrFunc gIntrFuncPointers[];

#endif //GUARD_MAIN_H
