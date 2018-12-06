#ifndef GUARD_RS_H
#define GUARD_RS_H

#include <gba/gba.h>

#define NELEMS(x) (sizeof(x) / sizeof(*x))

enum
{
    VERSION_SAPPHIRE = 1,
    VERSION_RUBY = 2,
    VERSION_EMERALD = 3,
    VERSION_FIRE_RED = 4,
    VERSION_LEAF_GREEN = 5,
    VERSION_HEART_GOLD = 7,
    VERSION_SOUL_SILVER = 8,
    VERSION_DIAMOND = 10,
    VERSION_PEARL = 11,
    VERSION_PLATINUM = 12,
    VERSION_GAMECUBE = 15,
};

enum LanguageId
{
    LANGUAGE_JAPANESE = 1,
    LANGUAGE_ENGLISH = 2,
    LANGUAGE_FRENCH = 3,
    LANGUAGE_ITALIAN = 4,
    LANGUAGE_GERMAN = 5,
    // 6 goes unused but the theory is it was meant to be Korean
            LANGUAGE_SPANISH = 7,
};

#define RomHeaderGameTitle       (const char *)0x080000A0
#define RomHeaderGameCode        (const char *)0x080000AC
#define RomHeaderMakerCode       (const char *)0x080000B0
#define RomHeaderMagic           (const u8 *)  0x080000B2
#define RomHeaderSoftwareVersion (const u8 *)  0x080000BC

#endif //GUARD_RS_H
