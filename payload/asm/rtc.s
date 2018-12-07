	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	THUMB_FUNC_START sub_02010760
sub_02010760: @ 0x02010760
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldrb r1, [r7, #7]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	asrs r4, r0, #0x1f
	movs r0, #0x20
	ands r4, r0
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _02010786
	movs r0, #0x10
	orrs r4, r0
_02010786:
	ldrb r0, [r7]
	bl sub_02010558
	mov r8, r0
	cmp r0, #0xff
	bne _0201079A
	movs r0, #0x40
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_0201079A:
	ldrb r0, [r7, #1]
	bl sub_02010558
	adds r6, r0, #0
	cmp r6, #0xff
	beq _020107AE
	cmp r6, #0
	beq _020107AE
	cmp r6, #0xc
	ble _020107B6
_020107AE:
	movs r0, #0x80
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_020107B6:
	ldrb r0, [r7, #2]
	bl sub_02010558
	adds r5, r0, #0
	cmp r5, #0xff
	bne _020107CE
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_020107CE:
	cmp r6, #2
	bne _020107EC
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl is_leap_year
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, =sDaysPerMonth
	ldr r1, [r1, #4]
	adds r0, r0, r1
	b _020107F6
	.pool
_020107EC:
	ldr r0, =sDaysPerMonth
	subs r1, r6, #1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
_020107F6:
	cmp r5, r0
	ble _02010806
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_02010806:
	ldrb r0, [r7, #4]
	bl sub_02010558
	adds r5, r0, #0
	cmp r5, #0x18
	ble _0201081E
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_0201081E:
	ldrb r0, [r7, #5]
	bl sub_02010558
	adds r5, r0, #0
	cmp r5, #0x3c
	ble _02010836
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_02010836:
	ldrb r0, [r7, #6]
	bl sub_02010558
	adds r5, r0, #0
	cmp r5, #0x3c
	ble _0201084E
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r1, #0
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_0201084E:
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.pool
	THUMB_FUNC_END sub_02010760

	THUMB_FUNC_START sub_02010860
sub_02010860: @ 0x02010860
	push {lr}
	bl sub_0201052C
	bl SiiRtcReset
	bl sub_02010544
	pop {r0}
	bx r0
	THUMB_FUNC_END sub_02010860

	THUMB_FUNC_START sub_02010874
sub_02010874: @ 0x02010874
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	bl sub_02010644
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrb r0, [r5, #6]
	bl sub_02010558
	ldrb r1, [r6, #4]
	subs r0, r0, r1
	strb r0, [r7, #4]
	ldrb r0, [r5, #5]
	bl sub_02010558
	ldrb r1, [r6, #3]
	subs r0, r0, r1
	strb r0, [r7, #3]
	ldrb r0, [r5, #4]
	bl sub_02010558
	ldrb r1, [r6, #2]
	subs r0, r0, r1
	strb r0, [r7, #2]
	ldrh r0, [r6]
	subs r4, r4, r0
	strh r4, [r7]
	ldrb r1, [r7, #4]
	movs r0, #4
	ldrsb r0, [r7, r0]
	cmp r0, #0
	bge _020108C6
	adds r0, r1, #0
	adds r0, #0x3c
	strb r0, [r7, #4]
	ldrb r0, [r7, #3]
	subs r0, #1
	strb r0, [r7, #3]
_020108C6:
	ldrb r1, [r7, #3]
	movs r0, #3
	ldrsb r0, [r7, r0]
	cmp r0, #0
	bge _020108DC
	adds r0, r1, #0
	adds r0, #0x3c
	strb r0, [r7, #3]
	ldrb r0, [r7, #2]
	subs r0, #1
	strb r0, [r7, #2]
_020108DC:
	ldrb r1, [r7, #2]
	movs r0, #2
	ldrsb r0, [r7, r0]
	cmp r0, #0
	bge _020108F2
	adds r0, r1, #0
	adds r0, #0x18
	strb r0, [r7, #2]
	ldrh r0, [r7]
	subs r0, #1
	strh r0, [r7]
_020108F2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	THUMB_FUNC_END sub_02010874

	THUMB_FUNC_START sub_020108F8
sub_020108F8: @ 0x020108F8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrb r3, [r2, #4]
	ldrb r0, [r1, #4]
	subs r5, r3, r0
	strb r5, [r4, #4]
	ldrb r3, [r2, #3]
	ldrb r0, [r1, #3]
	subs r6, r3, r0
	strb r6, [r4, #3]
	ldrb r0, [r2, #2]
	ldrb r3, [r1, #2]
	subs r0, r0, r3
	strb r0, [r4, #2]
	ldrh r0, [r2]
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r4]
	lsls r0, r5, #0x18
	cmp r0, #0
	bge _0201092C
	adds r0, r5, #0
	adds r0, #0x3c
	strb r0, [r4, #4]
	subs r0, r6, #1
	strb r0, [r4, #3]
_0201092C:
	ldrb r1, [r4, #3]
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bge _02010942
	adds r0, r1, #0
	adds r0, #0x3c
	strb r0, [r4, #3]
	ldrb r0, [r4, #2]
	subs r0, #1
	strb r0, [r4, #2]
_02010942:
	ldrb r1, [r4, #2]
	movs r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bge _02010958
	adds r0, r1, #0
	adds r0, #0x18
	strb r0, [r4, #2]
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
_02010958:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	THUMB_FUNC_END sub_020108F8

	THUMB_FUNC_START sub_02010960
sub_02010960: @ 0x02010960
	push {lr}
	bl sub_02010680
	bl sub_020106E0
	movs r1, #0xff
	lsls r1, r1, #4
	ands r1, r0
	cmp r1, #0
	bne _02010978
	movs r0, #1
	b _0201097A
_02010978:
	movs r0, #0
_0201097A:
	pop {r1}
	bx r1
	THUMB_FUNC_END sub_02010960

	THUMB_FUNC_START sub_02010980
sub_02010980: @ 0x02010980
	push {r4, lr}
	sub sp, #4
	mov r2, sp
	ldr r4, =REG_IME
	ldrh r1, [r4]
	strh r1, [r2]
	movs r1, #0
	strh r1, [r4]
	bl SiiRtcSetDateTime
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.pool
	THUMB_FUNC_END sub_02010980

	THUMB_FUNC_START sub_020109A8
sub_020109A8: @ 0x020109A8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, =gUnknown_3001020
	adds r0, r4, #0
	bl sub_0201074C
	ldrb r0, [r4]
	bl sub_02010558
	strb r0, [r5]
	ldr r5, =gUnknown_3001218
	ldr r2, =gUnknown_2028000 + 0x98
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_02010874
	ldr r4, =gUnknown_3001210
	ldr r1, =gUnknown_2028000 + 0xA0
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_020108F8
	movs r0, #0
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #5
	movs r2, #2
	ldrsb r2, [r4, r2]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r0, #3
	ldrsb r0, [r4, r0]
	adds r1, r1, r0
	cmp r1, #0
	bge _02010A10
	movs r0, #0
	b _02010A12
	.pool
_02010A10:
	movs r0, #1
_02010A12:
	pop {r4, r5}
	pop {r1}
	bx r1
	THUMB_FUNC_END sub_020109A8

	THUMB_FUNC_START sub_02010A18
sub_02010A18: @ 0x02010A18
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x63
	bhi _02010A3C
	adds r0, r5, #0
	movs r1, #0xa
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #4
	adds r0, r5, #0
	movs r1, #0xa
	bl Mod
	orrs r4, r0
	adds r0, r4, #0
	b _02010A3E
_02010A3C:
	movs r0, #0xff
_02010A3E:
	pop {r4, r5}
	pop {r1}
	bx r1
	THUMB_FUNC_END sub_02010A18

	THUMB_FUNC_START sub_02010A44
sub_02010A44: @ 0x02010A44
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4]
	bl sub_02010558
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_02010A18
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	THUMB_FUNC_END sub_02010A44

	THUMB_FUNC_START sub_02010A60
sub_02010A60: @ 0x02010A60
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r4, #1
	bl sub_02010A44
	ldrb r0, [r4, #1]
	bl sub_02010558
	cmp r0, #0xc
	ble _02010A7E
	adds r0, r4, #0
	bl sub_02010A44
	movs r0, #1
	strb r0, [r4, #1]
_02010A7E:
	pop {r4}
	pop {r0}
	bx r0
	THUMB_FUNC_END sub_02010A60

	THUMB_FUNC_START sub_02010A84
sub_02010A84: @ 0x02010A84
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, r6, #2
	bl sub_02010A44
	ldrb r0, [r6, #2]
	bl sub_02010558
	adds r5, r0, #0
	ldr r4, =sDaysPerMonth
	ldrb r0, [r6, #1]
	bl sub_02010558
	subs r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r5, r0
	ble _02010ADC
	ldrb r0, [r6]
	bl sub_02010558
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl is_leap_year
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _02010AD2
	ldrb r0, [r6, #1]
	bl sub_02010558
	cmp r0, #2
	bne _02010AD2
	ldrb r0, [r6, #2]
	bl sub_02010558
	cmp r0, #0x1d
	beq _02010ADC
_02010AD2:
	movs r0, #1
	strb r0, [r6, #2]
	adds r0, r6, #0
	bl sub_02010A60
_02010ADC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.pool
	THUMB_FUNC_END sub_02010A84

	THUMB_FUNC_START sub_02010AE8
sub_02010AE8: @ 0x02010AE8
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4]
	bl sub_02010558
	cmp r0, #0
	bne _02010B16
	ldrb r0, [r4, #1]
	bl sub_02010558
	cmp r0, #1
	beq _02010B20
	ldrb r0, [r4, #1]
	bl sub_02010558
	cmp r0, #2
	bgt _02010B24
	ldrb r0, [r4, #2]
	bl sub_02010558
	cmp r0, #0x1d
	beq _02010B24
	b _02010B20
_02010B16:
	ldrb r0, [r4]
	bl sub_02010558
	cmp r0, #1
	beq _02010B24
_02010B20:
	movs r0, #0
	b _02010B26
_02010B24:
	movs r0, #1
_02010B26:
	pop {r4}
	pop {r1}
	bx r1
	THUMB_FUNC_END sub_02010AE8

	THUMB_FUNC_START sub_02010B2C
sub_02010B2C: @ 0x02010B2C
	push {r4, lr}
	ldr r4, =gUnknown_3001020
	adds r0, r4, #0
	bl sub_0201074C
	ldrb r0, [r4]
	bl sub_02010558
	cmp r0, #0
	beq _02010B4A
	ldrb r0, [r4]
	bl sub_02010558
	cmp r0, #1
	bne _02010B90
_02010B4A:
	ldrb r0, [r4]
	bl sub_02010558
	adds r1, r0, #0
	cmp r1, #1
	bne _02010B6C
	movs r0, #2
	strb r0, [r4]
	strb r1, [r4, #1]
	strb r0, [r4, #2]
	adds r0, r4, #0
	bl sub_02010980
	b _02010B90
	.pool
_02010B6C:
	adds r0, r4, #0
	bl sub_02010AE8
	cmp r0, #1
	bne _02010B84
	adds r0, r4, #0
	bl sub_02010A84
	adds r0, r4, #0
	bl sub_02010A44
	b _02010B8A
_02010B84:
	adds r0, r4, #0
	bl sub_02010A44
_02010B8A:
	ldr r0, =gUnknown_3001020
	bl sub_02010980
_02010B90:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	THUMB_FUNC_END sub_02010B2C
