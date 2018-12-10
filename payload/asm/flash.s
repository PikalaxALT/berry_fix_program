	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

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
	ldr r0, =0x08012025
	cmp r1, r0
	bne _020117E0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_02011800
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, =gUnknown_2020000 + 0xFF4
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
