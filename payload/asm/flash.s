	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

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
	ldr r0, =0x08012025
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
	ldr r0, =0x08012025
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
