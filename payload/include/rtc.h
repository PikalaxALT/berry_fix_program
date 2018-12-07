#ifndef GUARD_RTC_H
#define GUARD_RTC_H

#include <gba/gba.h>
#include <siirtc.h>
#include "global.h"

extern struct Time gUnknown_3001210;
extern struct Time gUnknown_3001218;

bool32 sub_02010960(void);
bool32 sub_020109A8(u8 *);
void sub_02010B2C(void);

#endif //GUARD_RTC_H
