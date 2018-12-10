#ifndef GUARD_FLASH_H
#define GUARD_FLASH_H

#include <gba/gba.h>

struct UnkEwramSubstruct
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
};

struct UnkEwramStruct
{
    u8 unk_0000[0xff4];
    u16 unk_0FF4;
    u16 unk_0FF6;
    struct UnkEwramSubstruct unk_0FF8;
    u32 unk_0FFC;
};

#define memcpy(dest, src, size) ({              \
    u16 i;                                      \
    for (i = 0; i < size; i++)                  \
        ((u8 *)dest)[i] = ((const u8 *)src)[i]; \
})

#define UnkFlashData (*(struct UnkEwramStruct *)gUnknown_2020000)

bool8 sub_02010C80(u32);
void msg_load_gfx(void);
void msg_display(u32);
bool32 sub_02011864(void);
bool32 sub_0201189C(void);

#endif //GUARD_FLASH_H
