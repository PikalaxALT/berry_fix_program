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
