#ifndef GUARD_FLASH_H
#define GUARD_FLASH_H

#include <gba/gba.h>

enum
{
    SECTOR_DAMAGED,
    SECTOR_OK,
    SECTOR_CHECK, // unused
};

enum MsgBoxUpdateMessage
{
    MSGBOX_WILL_NOW_UPDATE = 0,
    MSGBOX_HAS_BEEN_UPDATED,
    MSGBOX_UNABLE_TO_UPDATE,
    MSGBOX_NO_NEED_TO_UPDATE,
    MSGBOX_UPDATING
};

struct UnkEwramSubstruct
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
};

struct SaveSector
{
    u8 data[0xFF4];
    u16 id;
    u16 checksum;
    u32 signature;
    u32 counter;
}; // size is 0x1000

// headless save section?
struct UnkSaveSection
{
    u8 data[0xFF4];
    u32 signature;
}; // size is 0xFF8

#define memcpy(dest, src, size) ({              \
    u16 i;                                      \
    for (i = 0; i < size; i++)                  \
        ((u8 *)dest)[i] = ((const u8 *)src)[i]; \
})

#define memset(dest, value, size) ({              \
    u16 i;                                      \
    for (i = 0; i < size; i++)                  \
        ((u8 *)dest)[i] = value; \
})

#define eSaveSection ((struct SaveSector *)0x2020000)

#define NUM_SECTORS_PER_SAVE_SLOT 14  // Number of sectors occupied by a save slot
#define FILE_SIGNATURE 0x08012025

#define SAVE_STATUS_EMPTY 0
#define SAVE_STATUS_OK 1
#define SAVE_STATUS_NO_FLASH 4
#define SAVE_STATUS_ERROR 0xFF

bool8 sub_02010C80(u32);
void msg_load_gfx(void);
void msg_display(enum MsgBoxUpdateMessage);
bool32 sub_02011864(void);
bool32 sub_0201189C(void);

#endif //GUARD_FLASH_H
