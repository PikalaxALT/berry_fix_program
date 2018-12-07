	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	THUMB_FUNC_START sub_02010C9C
sub_02010C9C: @ 0x02010C9C
	push {r4, r5, lr}
	movs r5, #0x80
	lsls r5, r5, #0x13
	movs r1, #0
	strh r1, [r5]
	ldr r0, =REG_BG0HOFS
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #0x3e
	strh r1, [r0]
	ldr r0, =gUnknown_2013758
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UnCompVram
	ldr r0, =gUnknown_2012F2C
	ldr r1, =VRAM + 0xe000
	bl LZ77UnCompVram
	ldr r0, =gUnknown_2012F0C
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r4, #0x80
	lsls r4, r4, #1
	adds r2, r4, #0
	bl CpuSet
	ldr r1, =REG_BG0CNT
	movs r2, #0xdc
	lsls r2, r2, #8
	adds r0, r2, #0
	strh r0, [r1]
	strh r4, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.pool
	THUMB_FUNC_END sub_02010C9C

	THUMB_FUNC_START sub_02010D00
sub_02010D00: @ 0x02010D00
	push {lr}
	cmp r0, #4
	bhi _02010D80
	lsls r0, r0, #2
	ldr r1, =_02010D14
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
_02010D14: @ jump table
	.4byte _02010D28 @ case 0
	.4byte _02010D38 @ case 1
	.4byte _02010D4C @ case 2
	.4byte _02010D60 @ case 3
	.4byte _02010D70 @ case 4
_02010D28:
	ldr r0, =REG_BG0HOFS
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	b _02010D80
	.pool
_02010D38:
	ldr r1, =REG_BG0HOFS
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0
	b _02010D7E
	.pool
_02010D4C:
	ldr r1, =REG_BG0HOFS
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xb0
	b _02010D7E
	.pool
_02010D60:
	ldr r1, =REG_BG0HOFS
	movs r0, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xb0
	b _02010D7E
	.pool
_02010D70:
	ldr r1, =REG_BG0HOFS
	movs r0, #0
	strh r0, [r1]
	adds r1, #2
	movs r2, #0xb0
	lsls r2, r2, #1
	adds r0, r2, #0
_02010D7E:
	strh r0, [r1]
_02010D80:
	pop {r0}
	bx r0
	.pool
	THUMB_FUNC_END sub_02010D00

	THUMB_FUNC_START sub_02010D88
sub_02010D88: @ 0x02010D88
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, =EraseFlashSector
_02010D8E:
	ldr r1, [r5]
	adds r0, r4, #0
	bl _call_via_r1
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x1f
	bls _02010D8E
	pop {r4, r5}
	pop {r0}
	bx r0
	.pool
	THUMB_FUNC_END sub_02010D88

	THUMB_FUNC_START sub_02010DAC
sub_02010DAC: @ 0x02010DAC
	ldr r0, =gUnknown_3001230
	movs r1, #0
	str r1, [r0]
	ldr r0, =gUnknown_3001220
	strh r1, [r0]
	ldr r0, =gUnknown_300122C
	str r1, [r0]
	bx lr
	.pool
	THUMB_FUNC_END sub_02010DAC

	THUMB_FUNC_START sub_02010DC8
sub_02010DC8: @ 0x02010DC8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	movs r4, #0
	cmp r0, #1
	beq _02010DFC
	cmp r0, #1
	bgt _02010DE2
	cmp r0, #0
	beq _02010DE8
	b _02010E20
_02010DE2:
	cmp r0, #2
	beq _02010E10
	b _02010E20
_02010DE8:
	ldr r2, =gUnknown_300122C
	movs r1, #1
	lsls r1, r3
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	b _02010E20
	.pool
_02010DFC:
	ldr r2, =gUnknown_300122C
	adds r1, r0, #0
	lsls r1, r3
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	b _02010E20
	.pool
_02010E10:
	ldr r0, =gUnknown_300122C
	movs r1, #1
	lsls r1, r3
	ldr r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _02010E20
	movs r4, #1
_02010E20:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.pool
	THUMB_FUNC_END sub_02010DC8

	THUMB_FUNC_START sub_02010E2C
sub_02010E2C: @ 0x02010E2C
	push {r4, r5, r6, r7, lr}
	adds r7, r1, #0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, =gUnknown_3001234
	ldr r0, =gUnknown_2020000
	str r0, [r1]
	ldr r0, =0x0000FFFF
	cmp r2, r0
	beq _02010E5C
	adds r0, r2, #0
	adds r1, r7, #0
	bl sub_02010ECC
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _02010EAE
	.pool
_02010E5C:
	ldr r1, =gUnknown_3001228
	ldr r5, =gUnknown_3001220
	ldrh r0, [r5]
	strh r0, [r1]
	ldr r1, =gUnknown_3001224
	ldr r6, =gUnknown_3001230
	ldr r4, [r6]
	str r4, [r1]
	adds r0, #1
	strh r0, [r5]
	ldrh r0, [r5]
	movs r1, #0xe
	bl __umodsi3
	strh r0, [r5]
	adds r4, #1
	str r4, [r6]
	movs r5, #1
	movs r4, #0
_02010E82:
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_02010ECC
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xd
	bls _02010E82
	ldr r0, =gUnknown_300122C
	ldr r0, [r0]
	cmp r0, #0
	beq _02010EAE
	movs r5, #0xff
	ldr r1, =gUnknown_3001220
	ldr r0, =gUnknown_3001228
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, =gUnknown_3001230
	ldr r0, =gUnknown_3001224
	ldr r0, [r0]
	str r0, [r1]
_02010EAE:
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.pool
	THUMB_FUNC_END sub_02010E2C

	THUMB_FUNC_START sub_02010ECC
sub_02010ECC: @ 0x02010ECC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, =gUnknown_3001220
	ldrh r0, [r0]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r5, #0
	movs r1, #0xe
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, =gUnknown_3001230
	ldr r1, [r2]
	movs r0, #1
	ands r1, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r6, #3
	adds r0, r0, r4
	ldr r1, [r0]
	mov sl, r1
	ldrh r4, [r0, #4]
	movs r3, #0
	mov sb, r2
	ldr r2, =gUnknown_3001234
	mov ip, r2
	mov r8, ip
	movs r2, #0
	ldr r1, =0x00000FFF
_02010F1E:
	mov r7, r8
	ldr r0, [r7]
	adds r0, r0, r3
	strb r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r1
	bls _02010F1E
	mov r0, ip
	ldr r1, [r0]
	ldr r2, =0x00000FF4
	adds r0, r1, r2
	strh r6, [r0]
	ldr r3, =0x00000FF8
	adds r2, r1, r3
	ldr r0, =gRS_Unknown_8012025
	str r0, [r2]
	ldr r6, =0x00000FFC
	adds r1, r1, r6
	mov r7, sb
	ldr r0, [r7]
	str r0, [r1]
	movs r3, #0
	lsls r5, r5, #0x18
	cmp r3, r4
	bhs _02010F6C
	mov r2, ip
_02010F56:
	ldr r1, [r2]
	adds r1, r1, r3
	mov r6, sl
	adds r0, r6, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r4
	blo _02010F56
_02010F6C:
	mov r0, sl
	adds r1, r4, #0
	bl sub_02011800
	ldr r1, =gUnknown_3001234
	ldr r1, [r1]
	ldr r7, =0x00000FF6
	adds r2, r1, r7
	strh r0, [r2]
	lsrs r0, r5, #0x18
	bl sub_02011034
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.pool
	THUMB_FUNC_END sub_02010ECC

	THUMB_FUNC_START sub_02010FBC
sub_02010FBC: @ 0x02010FBC
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r4, =gUnknown_2020000
	movs r3, #0
	movs r6, #0
	ldr r1, =0x00000FFF
_02010FD0:
	adds r0, r4, r3
	strb r6, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r1
	bls _02010FD0
	ldr r0, =0x00000FF8
	adds r0, r4, r0
	ldr r1, =gRS_Unknown_8012025
	str r1, [r0]
	movs r3, #0
	cmp r3, r2
	bhs _02010FFE
_02010FEC:
	adds r1, r4, r3
	adds r0, r5, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r2
	blo _02010FEC
_02010FFE:
	adds r0, r5, #0
	adds r1, r2, #0
	bl sub_02011800
	ldr r1, =0x00000FF4
	adds r1, r4, r1
	strh r0, [r1]
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_02011034
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.pool
	THUMB_FUNC_END sub_02010FBC

	THUMB_FUNC_START sub_02011034
sub_02011034: @ 0x02011034
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl ProgramFlashSectorAndVerify
	cmp r0, #0
	bne _02011050
	movs r0, #1
	adds r1, r4, #0
	bl sub_02010DC8
	movs r0, #1
	b _0201105A
_02011050:
	movs r0, #0
	adds r1, r4, #0
	bl sub_02010DC8
	movs r0, #0xff
_0201105A:
	pop {r4}
	pop {r1}
	bx r1
	THUMB_FUNC_END sub_02011034

	THUMB_FUNC_START sub_02011060
sub_02011060: @ 0x02011060
	push {r4, r5, r6, lr}
	ldr r1, =gUnknown_3001234
	ldr r0, =gUnknown_2020000
	str r0, [r1]
	ldr r1, =gUnknown_3001228
	ldr r5, =gUnknown_3001220
	ldrh r0, [r5]
	strh r0, [r1]
	ldr r1, =gUnknown_3001224
	ldr r6, =gUnknown_3001230
	ldr r4, [r6]
	str r4, [r1]
	adds r0, #1
	strh r0, [r5]
	ldrh r0, [r5]
	movs r1, #0xe
	bl __umodsi3
	strh r0, [r5]
	adds r4, #1
	str r4, [r6]
	ldr r1, =gUnknown_3001238
	movs r0, #0
	strh r0, [r1]
	ldr r1, =gUnknown_300122C
	movs r0, #0
	str r0, [r1]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.pool
	THUMB_FUNC_END sub_02011060

	THUMB_FUNC_START sub_020110BC
sub_020110BC: @ 0x020110BC
	ldr r1, =gUnknown_3001234
	ldr r0, =gUnknown_2020000
	str r0, [r1]
	ldr r1, =gUnknown_3001228
	ldr r0, =gUnknown_3001220
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, =gUnknown_3001224
	ldr r0, =gUnknown_3001230
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, =gUnknown_3001238
	movs r0, #0
	strh r0, [r1]
	ldr r1, =gUnknown_300122C
	movs r0, #0
	str r0, [r1]
	bx lr
	.pool
	THUMB_FUNC_END sub_020110BC

	THUMB_FUNC_START sub_02011000
sub_02011000: @ 0x02011100
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, =gUnknown_3001238
	ldrh r2, [r4]
	subs r0, #1
	cmp r2, r0
	bge _02011154
	movs r5, #1
	adds r0, r2, #0
	bl sub_02010ECC
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldr r0, =gUnknown_300122C
	ldr r0, [r0]
	cmp r0, #0
	beq _02011156
	movs r5, #0xff
	ldr r1, =gUnknown_3001220
	ldr r0, =gUnknown_3001228
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, =gUnknown_3001230
	ldr r0, =gUnknown_3001224
	ldr r0, [r0]
	str r0, [r1]
	b _02011156
	.pool
_02011154:
	movs r5, #0xff
_02011156:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	THUMB_FUNC_END sub_02011000

	THUMB_FUNC_START sub_02011160
sub_02011160: @ 0x02011160
	push {r4, lr}
	lsls r0, r0, #0x10
	movs r4, #1
	ldr r2, =0xFFFF0000
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	bl sub_020111AC
	ldr r0, =gUnknown_300122C
	ldr r0, [r0]
	cmp r0, #0
	beq _0201118A
	movs r4, #0xff
	ldr r1, =gUnknown_3001220
	ldr r0, =gUnknown_3001228
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, =gUnknown_3001230
	ldr r0, =gUnknown_3001224
	ldr r0, [r0]
	str r0, [r1]
_0201118A:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.pool
	THUMB_FUNC_END sub_02011160

	THUMB_FUNC_START sub_020111AC
sub_020111AC: @ 0x020111AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, =gUnknown_3001220
	ldrh r0, [r0]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r5, #0
	movs r1, #0xe
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, =gUnknown_3001230
	ldr r1, [r2]
	movs r0, #1
	ands r1, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r6, #3
	adds r0, r0, r4
	ldr r1, [r0]
	mov sl, r1
	ldrh r3, [r0, #4]
	movs r4, #0
	mov sb, r2
	ldr r2, =gUnknown_3001234
	mov ip, r2
	mov r8, ip
	movs r2, #0
	ldr r1, =0x00000FFF
_020111FE:
	mov r7, r8
	ldr r0, [r7]
	adds r0, r0, r4
	strb r2, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r1
	bls _020111FE
	mov r0, ip
	ldr r1, [r0]
	ldr r2, =0x00000FF4
	adds r0, r1, r2
	strh r6, [r0]
	ldr r6, =0x00000FF8
	adds r2, r1, r6
	ldr r0, =gRS_Unknown_8012025
	str r0, [r2]
	ldr r7, =0x00000FFC
	adds r1, r1, r7
	mov r2, sb
	ldr r0, [r2]
	str r0, [r1]
	movs r4, #0
	lsls r6, r5, #0x18
	mov r8, r6
	cmp r4, r3
	bhs _0201124E
	mov r2, ip
_02011238:
	ldr r1, [r2]
	adds r1, r1, r4
	mov r7, sl
	adds r0, r7, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r3
	blo _02011238
_0201124E:
	mov r0, sl
	adds r1, r3, #0
	bl sub_02011800
	ldr r1, =gUnknown_3001234
	ldr r1, [r1]
	ldr r2, =0x00000FF6
	adds r1, r1, r2
	strh r0, [r1]
	ldr r0, =EraseFlashSector
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	movs r6, #1
	movs r4, #0
	ldr r7, =0x00000FF7
	mov sb, r7
	ldr r7, =ProgramFlashByte
	b _020112AE
	.pool
_020112A8:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_020112AE:
	cmp r4, sb
	bhi _020112CC
	ldr r0, =gUnknown_3001234
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r2, [r0]
	ldr r3, [r7]
	adds r0, r5, #0
	adds r1, r4, #0
	bl _call_via_r3
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _020112A8
	movs r6, #0xff
_020112CC:
	cmp r6, #0xff
	bne _020112DC
	mov r0, r8
	lsrs r1, r0, #0x18
	b _02011334
	.pool
_020112DC:
	movs r6, #1
	movs r4, #0
	ldr r1, =ProgramFlashByte
	mov sb, r1
	ldr r7, =0x00000FF9
	b _020112F6
	.pool
_020112F0:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_020112F6:
	cmp r4, #6
	bhi _02011318
	adds r1, r4, r7
	ldr r0, =gUnknown_3001234
	ldr r0, [r0]
	adds r0, r4, r0
	adds r0, r0, r7
	ldrb r2, [r0]
	mov r0, sb
	ldr r3, [r0]
	adds r0, r5, #0
	bl _call_via_r3
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _020112F0
	movs r6, #0xff
_02011318:
	cmp r6, #0xff
	beq _02011330
	mov r2, r8
	lsrs r1, r2, #0x18
	movs r0, #1
	bl sub_02010DC8
	movs r0, #1
	b _0201133C
	.pool
_02011330:
	mov r6, r8
	lsrs r1, r6, #0x18
_02011334:
	movs r0, #0
	bl sub_02010DC8
	movs r0, #0xff
_0201133C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	THUMB_FUNC_END sub_020111AC

	THUMB_FUNC_START sub_0201134C
sub_0201134C: @ 0x0201134C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	ldr r6, =gUnknown_3001220
	lsrs r0, r0, #0x10
	ldrh r1, [r6]
	adds r0, r0, r1
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	movs r1, #0xe
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r5, =gUnknown_3001230
	ldr r1, [r5]
	movs r0, #1
	ands r1, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r3, =ProgramFlashByte
	ldr r1, =0x00000FF8
	ldr r0, =gUnknown_3001234
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r3, [r3]
	adds r0, r4, #0
	bl _call_via_r3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _020113BC
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	bl sub_02010DC8
	movs r0, #1
	b _020113D4
	.pool
_020113BC:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	bl sub_02010DC8
	ldr r0, =gUnknown_3001228
	ldrh r0, [r0]
	strh r0, [r6]
	ldr r0, =gUnknown_3001224
	ldr r0, [r0]
	str r0, [r5]
	movs r0, #0xff
_020113D4:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.pool
	THUMB_FUNC_END sub_0201134C

	THUMB_FUNC_START sub_020113E4
sub_020113E4: @ 0x020113E4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	ldr r6, =gUnknown_3001220
	lsrs r0, r0, #0x10
	ldrh r1, [r6]
	adds r0, r0, r1
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	movs r1, #0xe
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r5, =gUnknown_3001230
	ldr r1, [r5]
	movs r0, #1
	ands r1, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, =ProgramFlashByte
	ldr r1, =0x00000FF8
	ldr r3, [r0]
	adds r0, r4, #0
	movs r2, #0x25
	bl _call_via_r3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _02011448
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	bl sub_02010DC8
	movs r0, #1
	b _02011460
	.pool
_02011448:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	bl sub_02010DC8
	ldr r0, =gUnknown_3001228
	ldrh r0, [r0]
	strh r0, [r6]
	ldr r0, =gUnknown_3001224
	ldr r0, [r0]
	str r0, [r5]
	movs r0, #0xff
_02011460:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.pool
	THUMB_FUNC_END sub_020113E4

	THUMB_FUNC_START sub_02011470
sub_02011470: @ 0x02011470
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r1, =gUnknown_3001234
	ldr r0, =gUnknown_2020000
	str r0, [r1]
	ldr r0, =0x0000FFFF
	cmp r4, r0
	beq _02011494
	movs r5, #0xff
	b _020114A6
	.pool
_02011494:
	adds r0, r6, #0
	bl sub_02011568
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_020114B0
_020114A6:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	THUMB_FUNC_END sub_02011470

	THUMB_FUNC_START sub_020114B0
sub_020114B0: @ 0x020114B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	ldr r0, =gUnknown_3001230
	ldr r1, [r0]
	movs r0, #1
	ands r1, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #0x11
	lsrs r7, r0, #0x10
	movs r5, #0
	ldr r6, =gUnknown_3001234
_020114CC:
	adds r0, r5, r7
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r6]
	bl sub_020117E8
	ldr r0, [r6]
	ldr r1, =0x00000FF4
	adds r0, r0, r1
	ldrh r1, [r0]
	cmp r1, #0
	bne _020114E8
	ldr r0, =gUnknown_3001220
	strh r5, [r0]
_020114E8:
	ldr r0, [r6]
	lsls r1, r1, #3
	mov r2, r8
	adds r4, r1, r2
	ldrh r1, [r4, #4]
	bl sub_02011800
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r2, [r6]
	ldr r1, =0x00000FF8
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, =gRS_Unknown_8012025
	adds r5, #1
	cmp r1, r0
	bne _02011538
	ldr r1, =0x00000FF6
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, r3
	bne _02011538
	movs r2, #0
	ldrh r0, [r4, #4]
	cmp r2, r0
	bhs _02011538
	adds r3, r4, #0
	ldr r4, =gUnknown_3001234
_02011520:
	ldr r1, [r3]
	adds r1, r1, r2
	ldr r0, [r4]
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r1, [r3, #4]
	cmp r2, r1
	blo _02011520
_02011538:
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xd
	bls _020114CC
	movs r0, #1
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.pool
	THUMB_FUNC_END sub_020114B0

	THUMB_FUNC_START sub_02011568
sub_02011568: @ 0x02011568
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	movs r0, #0
	mov r8, r0
	mov sb, r0
	movs r6, #0
	movs r5, #0
	movs r4, #0
	ldr r7, =gUnknown_3001234
_02011584:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r7]
	bl sub_020117E8
	ldr r2, [r7]
	ldr r1, =0x00000FF8
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, =gRS_Unknown_8012025
	cmp r1, r0
	bne _020115D4
	movs r5, #1
	ldr r3, =0x00000FF4
	adds r0, r2, r3
	ldrh r0, [r0]
	lsls r0, r0, #3
	add r0, sl
	ldrh r1, [r0, #4]
	adds r0, r2, #0
	bl sub_02011800
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, [r7]
	ldr r3, =0x00000FF6
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _020115D4
	ldr r2, =0x00000FFC
	adds r0, r1, r2
	ldr r0, [r0]
	mov r8, r0
	subs r3, #2
	adds r1, r1, r3
	adds r0, r5, #0
	ldrh r1, [r1]
	lsls r0, r1
	orrs r6, r0
_020115D4:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xd
	bls _02011584
	cmp r5, #0
	beq _02011610
	ldr r0, =0x00003FFF
	movs r1, #0xff
	str r1, [sp]
	cmp r6, r0
	bne _02011614
	movs r2, #1
	str r2, [sp]
	b _02011614
	.pool
_02011610:
	movs r3, #0
	str r3, [sp]
_02011614:
	movs r6, #0
	movs r5, #0
	movs r4, #0
	ldr r7, =gUnknown_3001234
_0201161C:
	adds r0, r4, #0
	adds r0, #0xe
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r7]
	bl sub_020117E8
	ldr r2, [r7]
	ldr r1, =0x00000FF8
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, =gRS_Unknown_8012025
	cmp r1, r0
	bne _02011670
	movs r5, #1
	ldr r3, =0x00000FF4
	adds r0, r2, r3
	ldrh r0, [r0]
	lsls r0, r0, #3
	add r0, sl
	ldrh r1, [r0, #4]
	adds r0, r2, #0
	bl sub_02011800
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, [r7]
	ldr r3, =0x00000FF6
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _02011670
	ldr r2, =0x00000FFC
	adds r0, r1, r2
	ldr r0, [r0]
	mov sb, r0
	subs r3, #2
	adds r1, r1, r3
	adds r0, r5, #0
	ldrh r1, [r1]
	lsls r0, r1
	orrs r6, r0
_02011670:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xd
	bls _0201161C
	cmp r5, #0
	beq _020116A8
	ldr r0, =0x00003FFF
	movs r1, #0xff
	cmp r6, r0
	bne _020116AA
	movs r1, #1
	b _020116AA
	.pool
_020116A8:
	movs r1, #0
_020116AA:
	ldr r0, [sp]
	cmp r0, #1
	bne _0201171C
	cmp r1, #1
	bne _0201170C
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	bne _020116C2
	mov r1, sb
	cmp r1, #0
	beq _020116CC
_020116C2:
	mov r2, r8
	cmp r2, #0
	bne _020116F0
	cmp sb, r0
	bne _020116F0
_020116CC:
	mov r1, r8
	adds r1, #1
	mov r0, sb
	adds r0, #1
	cmp r1, r0
	bhs _020116E4
	ldr r0, =gUnknown_3001230
	mov r3, sb
	b _02011704
	.pool
_020116E4:
	ldr r0, =gUnknown_3001230
	mov r1, r8
	str r1, [r0]
	b _02011734
	.pool
_020116F0:
	cmp r8, sb
	bhs _02011700
	ldr r0, =gUnknown_3001230
	mov r2, sb
	str r2, [r0]
	b _02011734
	.pool
_02011700:
	ldr r0, =gUnknown_3001230
	mov r3, r8
_02011704:
	str r3, [r0]
	b _02011734
	.pool
_0201170C:
	ldr r0, =gUnknown_3001230
	mov r2, r8
	str r2, [r0]
	cmp r1, #0xff
	beq _0201172C
	b _02011734
	.pool
_0201171C:
	cmp r1, #1
	bne _02011738
	ldr r0, =gUnknown_3001230
	mov r3, sb
	str r3, [r0]
	ldr r0, [sp]
	cmp r0, #0xff
	bne _02011734
_0201172C:
	movs r0, #0xff
	b _02011764
	.pool
_02011734:
	movs r0, #1
	b _02011764
_02011738:
	ldr r2, [sp]
	cmp r2, #0
	bne _02011758
	cmp r1, #0
	bne _02011758
	ldr r0, =gUnknown_3001230
	str r1, [r0]
	ldr r0, =gUnknown_3001220
	strh r1, [r0]
	movs r0, #0
	b _02011764
	.pool
_02011758:
	ldr r0, =gUnknown_3001230
	movs r1, #0
	str r1, [r0]
	ldr r0, =gUnknown_3001220
	strh r1, [r0]
	movs r0, #2
_02011764:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.pool
	THUMB_FUNC_END sub_02011568

	THUMB_FUNC_START sub_0201177C
sub_0201177C: @ 0x0201177C
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	ldr r5, =gUnknown_2020000
	adds r1, r5, #0
	bl sub_020117E8
	ldr r0, =0x00000FF8
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r0, =gRS_Unknown_8012025
	cmp r1, r0
	bne _020117E0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_02011800
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, =gUnknown_2020FF4
	ldrh r1, [r1]
	cmp r1, r0
	bne _020117DC
	movs r2, #0
	cmp r2, r4
	bhs _020117C8
_020117B6:
	adds r1, r6, r2
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r4
	blo _020117B6
_020117C8:
	movs r0, #1
	b _020117E2
	.pool
_020117DC:
	movs r0, #2
	b _020117E2
_020117E0:
	movs r0, #0
_020117E2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	THUMB_FUNC_END sub_0201177C

	THUMB_FUNC_START sub_020117E8
sub_020117E8: @ 0x020117E8
	push {lr}
	adds r2, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0x80
	lsls r3, r3, #5
	movs r1, #0
	bl ReadFlash
	movs r0, #1
	pop {r1}
	bx r1
	THUMB_FUNC_END sub_020117E8

	THUMB_FUNC_START sub_02011800
sub_02011800: @ 0x02011800
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	movs r2, #0
	movs r3, #0
	lsrs r1, r1, #0x12
	cmp r2, r1
	bhs _0201181E
_02011810:
	ldm r4!, {r0}
	adds r2, r2, r0
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r1
	blo _02011810
_0201181E:
	lsrs r0, r2, #0x10
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	THUMB_FUNC_END sub_02011800

	THUMB_FUNC_START sub_0201182C
sub_0201182C: @ 0x0201182C
	bx lr
	THUMB_FUNC_END sub_0201182C

	THUMB_FUNC_START sub_02011830
sub_02011830: @ 0x02011830
	bx lr
	THUMB_FUNC_END sub_02011830

	THUMB_FUNC_START sub_02011834
sub_02011834: @ 0x02011834
	bx lr
	THUMB_FUNC_END sub_02011834

	THUMB_FUNC_START sub_02011838
sub_02011838: @ 0x02011838
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r2, r1, #0
	ldr r0, =0x00003FFF
	cmp r1, r0
	bls _0201184C
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _02011854
_0201184C:
	movs r0, #0
	b _0201185A
	.pool
_02011854:
	lsls r0, r2, #1
	ldr r1, =gUnknown_2021BD0
	adds r0, r0, r1
_0201185A:
	pop {r1}
	bx r1
	.pool
	THUMB_FUNC_END sub_02011838

	THUMB_FUNC_START sub_02011864
sub_02011864: @ 0x02011864
	push {r4, lr}
	sub sp, #4
	ldr r0, =0x000040C2
	bl sub_02011838
	adds r4, r0, #0
	mov r0, sp
	bl sub_020109A8
	ldrh r1, [r4]
	ldr r0, =gUnknown_3001218
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _02011890
	movs r0, #0
	b _02011892
	.pool
_02011890:
	movs r0, #1
_02011892:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	THUMB_FUNC_END sub_02011864

	THUMB_FUNC_START sub_0201189C
sub_0201189C: @ 0x0201189C
	push {lr}
	sub sp, #4
	bl sub_02011864
	cmp r0, #1
	beq _020118D0
	mov r0, sp
	bl sub_020109A8
	ldr r0, =gUnknown_3001218
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	blt _020118DC
	ldr r0, =0x000040C2
	bl sub_02011838
	movs r1, #1
	strh r1, [r0]
	movs r0, #0
	bl sub_02010C60
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _020118DC
_020118D0:
	movs r0, #1
	b _020118DE
	.pool
_020118DC:
	movs r0, #0
_020118DE:
	add sp, #4
	pop {r1}
	bx r1
	THUMB_FUNC_END sub_0201189C
