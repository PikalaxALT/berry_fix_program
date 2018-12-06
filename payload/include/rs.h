#ifndef GUARD_RS_H
#define GUARD_RS_H

#include <gba/gba.h>

#define NELEMS(x) (sizeof(x) / sizeof(*x))

#define RomHeaderGameTitle       (const char *)0x080000A0
#define RomHeaderGameCode        (const char *)0x080000AC
#define RomHeaderMakerCode       (const char *)0x080000B0
#define RomHeaderMagic           (const u8 *)  0x080000B2
#define RomHeaderSoftwareVersion (const u8 *)  0x080000BC

#endif //GUARD_RS_H
