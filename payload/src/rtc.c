#include <gba/gba.h>
#include <siirtc.h>
#include "rs.h"
#include "main.h"

BSS_DATA u16 gUnknown_3001008;
BSS_DATA u32 filler_300100C;
BSS_DATA struct SiiRtcInfo gUnknown_3001010;
BSS_DATA u8 gUnknown_300101C;
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

void sub_0201074C(struct SiiRtcInfo *);
u16 sub_02010760(struct SiiRtcInfo *);


void sub_0201052C(void)
{
    gUnknown_300101E = REG_IME;
    REG_IME = 0;
}

void sub_02010544(void)
{
    REG_IME = gUnknown_300101E;
}

s32 bcd_to_hex(u8 a0)
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
    return sub_020105B8(bcd_to_hex(info->year), bcd_to_hex(info->month), bcd_to_hex(info->day));
}

void sub_02010680(void)
{
    gUnknown_3001008 = 0;
    sub_0201052C();
    SiiRtcUnprotect();
    gUnknown_300101C = SiiRtcProbe();
    sub_02010544();
    if ((gUnknown_300101C & 0xF) != 1)
        gUnknown_3001008 = 1;
    else
    {
        if (gUnknown_300101C & 0xF0)
            gUnknown_3001008 = 2;
        else
            gUnknown_3001008 = 0;
        sub_0201074C(&gUnknown_3001010);
        gUnknown_3001008 = sub_02010760(&gUnknown_3001010);
    }
}

u16 sub_020106E0(void)
{
    return gUnknown_3001008;
}

void sub_020106EC(struct SiiRtcInfo * info)
{
    if (gUnknown_3001008 & 0xFF0)
        *info = gUnknown_2012E60;
    else
        sub_0201074C(info);
}

void sub_0201071C(struct SiiRtcInfo * info)
{
    sub_0201052C();
    SiiRtcGetDateTime(info);
    sub_02010544();
}

void sub_02010734(struct SiiRtcInfo * info)
{
    sub_0201052C();
    SiiRtcGetStatus(info);
    sub_02010544();
}

void sub_0201074C(struct SiiRtcInfo * info)
{
    sub_02010734(info);
    sub_0201071C(info);
}

u16 sub_02010760(struct SiiRtcInfo * info)
{
    s32 year, month, day;
    u16 r4 = (info->status & 0x80) ? 0x20 : 0;
    if (!(info->status & 0x40))
        r4 |= 0x10;
    year = bcd_to_hex(info->year);
    if (year == 0xFF)
        r4 |= 0x40;
    month = bcd_to_hex(info->month);
    if (month == 0xFF || month == 0 || month > 12)
        r4 |= 0x80;
    day = bcd_to_hex(info->day);
    if (day == 0xFF)
        r4 |= 0x100;
    if (month == 2)
    {
        if (day > is_leap_year(year) + sDaysPerMonth[1])
            r4 |= 0x100;
    }
    else
    {
        if (day > sDaysPerMonth[month - 1])
            r4 |= 0x100;
    }
    day = bcd_to_hex(info->hour);
    if (day > 24)
        r4 |= 0x200;
    day = bcd_to_hex(info->minute);
    if (day > 60)
        r4 |= 0x400;
    day = bcd_to_hex(info->second);
    if (day > 60)
        r4 |= 0x800;
    return r4;
}
