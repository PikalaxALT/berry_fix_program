#ifndef GUARD_RS_H
#define GUARD_RS_H

#include <gba/gba.h>

struct RomHeader
{
    u8 gameTitle[12];
    u8 gameCode[4];
    u8 makerCode[2];
    u8 magic;
    u8 unitCode;
    u8 deviceType;
    u8 reserved1[7];
    u8 softwareVersion;
    u8 checksum;
    u8 reserved2[2];
};

extern const struct RomHeader RS_RomHeader;

extern const char RomHeaderGameTitle[12];
extern const char RomHeaderGameCode[4];
extern const u8 RomHeaderMagic;

#endif //GUARD_RS_H
