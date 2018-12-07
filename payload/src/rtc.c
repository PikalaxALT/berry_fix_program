#include <gba/gba.h>
#include <siirtc.h>
#include "rs.h"
#include "main.h"

BSS_DATA u16 gUnknown_3001008;
BSS_DATA u32 filler_300100C;
BSS_DATA struct SiiRtcInfo gUnknown_3001010;
BSS_DATA u16 gUnknown_300101C;
BSS_DATA u16 gUnknown_300101E;
BSS_DATA struct SiiRtcInfo gUnknown_3001020;

extern EWRAM_DATA u8 gUnknown_2028000[0x890];
extern EWRAM_DATA u8 gUnknown_2028890[0xF80];
extern EWRAM_DATA u8 gUnknown_2029810[0xF80];
extern EWRAM_DATA u8 gUnknown_202A790[0xF80];
extern EWRAM_DATA u8 gUnknown_202B710[0xC40];
extern EWRAM_DATA u8 gUnknown_202C350[0xF80];
extern EWRAM_DATA u8 gUnknown_202D2D0[0xF80];
extern EWRAM_DATA u8 gUnknown_202E250[0xF80];
extern EWRAM_DATA u8 gUnknown_202F1D0[0xF80];
extern EWRAM_DATA u8 gUnknown_2030150[0xF80];
extern EWRAM_DATA u8 gUnknown_20310D0[0xF80];
extern EWRAM_DATA u8 gUnknown_2032050[0xF80];
extern EWRAM_DATA u8 gUnknown_2032FD0[0xF80];
extern EWRAM_DATA u8 gUnknown_2033F50[0x7D0];

const struct SiiRtcInfo gUnknown_2012E60 = {
    .year = 0, // 2000
    .month = 1, // January
    .day = 1, // 01
    .dayOfWeek = 0,
    .hour = 0,
    .minute = 0,
    .second = 0,
    .status = 0,
    .alarmHour = 0,
    .alarmMinute = 0
};
const s32 sDaysPerMonth[] = {
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
};
const struct UnkStruct_2012E9C gUnknown_2012E9C[] = {
    {gUnknown_2028000, sizeof(gUnknown_2028000)},
    {gUnknown_2028890, sizeof(gUnknown_2028890)},
    {gUnknown_2029810, sizeof(gUnknown_2029810)},
    {gUnknown_202A790, sizeof(gUnknown_202A790)},
    {gUnknown_202B710, sizeof(gUnknown_202B710)},
    {gUnknown_202C350, sizeof(gUnknown_202C350)},
    {gUnknown_202D2D0, sizeof(gUnknown_202D2D0)},
    {gUnknown_202E250, sizeof(gUnknown_202E250)},
    {gUnknown_202F1D0, sizeof(gUnknown_202F1D0)},
    {gUnknown_2030150, sizeof(gUnknown_2030150)},
    {gUnknown_20310D0, sizeof(gUnknown_20310D0)},
    {gUnknown_2032050, sizeof(gUnknown_2032050)},
    {gUnknown_2032FD0, sizeof(gUnknown_2032FD0)},
    {gUnknown_2033F50, sizeof(gUnknown_2033F50)}
};
const u16 gUnknown_2012F0C[] = INCBIN_U16("graphics/unk_2F0C.gbapal");
const u8 gUnknown_2012F2C[] = INCBIN_U8("graphics/unk_2F2C.tilemap.lz");
const u8 gUnknown_2013758[] = INCBIN_U8("graphics/unk_3758.4bpp.lz");

void sub_0201052C(void)
{
    gUnknown_300101E = REG_IME;
    REG_IME = 0;
}

void sub_02010544(void)
{
    REG_IME = gUnknown_300101E;
}

u32 sub_02010558(u8 a0)
{
    if (a0 >= 0xa0 || (a0 & 0xF) >= 10)
        return 0xFF;
    return ((a0 >> 4) & 0xF) * 10 + (a0 & 0xF);
}

bool8 is_leap_year(u8 year)
{
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)
        return TRUE;
    return FALSE;
}

u16 sub_020105B8(u8 year, u8 month, u8 day)
{
    u16 numDays = 0;
    s32 i;
    for (i = year - 1; i > 0; i--)
    {
        numDays += 365;
        if (is_leap_year(i) == TRUE)
            numDays++;
    }
    for (i = 0; i < month - 1; i++)
        numDays += sDaysPerMonth[i];
    if (month > 2 && is_leap_year(year) == TRUE)
        numDays++;
    numDays += day;
    return numDays;
}

u16 sub_02010644(struct SiiRtcInfo *info)
{
    return sub_020105B8(sub_02010558(info->year), sub_02010558(info->month), sub_02010558(info->day));
}
