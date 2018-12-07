	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	THUMB_FUNC_START sub_02010B9C
sub_02010B9C: @ 0x02010B9C
	push {r4, lr}
	ldr r4, =gUnknown_300123C
	movs r0, #1
	str r0, [r4]
	bl IdentifyFlash
	cmp r0, #0
	beq _02010BB8
	movs r0, #0
	str r0, [r4]
	b _02010BC2
	.pool
_02010BB8:
	ldr r1, =gIntrFuncPointers + 0x24
	movs r0, #0
	bl SetFlashTimerIntr
	movs r0, #1
_02010BC2:
	pop {r4}
	pop {r1}
	bx r1
	.pool
	THUMB_FUNC_END sub_02010B9C

	THUMB_FUNC_START sub_02010BCC
sub_02010BCC: @ 0x02010BCC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl ReadFlash
	pop {r0}
	bx r0
	THUMB_FUNC_END sub_02010BCC

	THUMB_FUNC_START sub_02010BDC
sub_02010BDC: @ 0x02010BDC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_02010E2C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	THUMB_FUNC_END sub_02010BDC

	THUMB_FUNC_START sub_02010BF0
sub_02010BF0: @ 0x02010BF0
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_02011470
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	THUMB_FUNC_END sub_02010BF0

	THUMB_FUNC_START sub_02010C04
sub_02010C04: @ 0x02010C04
	ldr r0, =gUnknown_300122C
	bx lr
	.pool
	THUMB_FUNC_END sub_02010C04

	THUMB_FUNC_START sub_02010C0C
sub_02010C0C: @ 0x02010C0C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _02010C30
	cmp r0, #1
	ble _02010C1E
	cmp r0, #2
	beq _02010C4C
_02010C1E:
	ldr r0, =0x0000FFFF
	ldr r1, =gUnknown_2012E9C
	bl sub_02010BDC
	b _02010C54
	.pool
_02010C30:
	movs r4, #0
_02010C32:
	adds r0, r4, #0
	ldr r1, =gUnknown_2012E9C
	bl sub_02010BDC
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _02010C32
	b _02010C54
	.pool
_02010C4C:
	ldr r1, =gUnknown_2012E9C
	movs r0, #0
	bl sub_02010BDC
_02010C54:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.pool
	THUMB_FUNC_END sub_02010C0C

	THUMB_FUNC_START sub_02010C60
sub_02010C60: @ 0x02010C60
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_02010C0C
	bl sub_02010C04
	ldr r0, [r0]
	cmp r0, #0
	beq _02010C78
	movs r0, #0xff
	b _02010C7A
_02010C78:
	movs r0, #1
_02010C7A:
	pop {r1}
	bx r1
	THUMB_FUNC_END sub_02010C60

	THUMB_FUNC_START sub_02010C80
sub_02010C80: @ 0x02010C80
	push {lr}
	ldr r0, =0x0000FFFF
	ldr r1, =gUnknown_2012E9C
	bl sub_02010BF0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.pool
	THUMB_FUNC_END sub_02010C80
