	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text
	.align 2, 0

	THUMB_FUNC_START AgbMain
AgbMain: @ 0x020100F4
	push {lr}
	movs r0, #0x1e
	bl RegisterRamReset
	ldr r1, _02010174
	ldr r0, _02010178
	str r0, [r1]
	ldr r0, _0201017C
	str r0, [r1, #4]
	ldr r0, _02010180
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _02010184
	str r0, [r1]
	ldr r2, _02010188
	str r2, [r1, #4]
	ldr r0, _0201018C
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _02010190
	str r2, [r0]
	ldr r3, _02010194
	movs r0, #1
	strh r0, [r3]
	ldr r0, _02010198
	ldrb r0, [r0]
	cmp r0, #0x96
	bne _02010144
	ldr r0, _0201019C
	ldr r1, _020101A0
	ldr r2, [r0]
	ldr r0, [r1]
	cmp r2, r0
	bne _02010144
	ldrh r0, [r3]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3]
_02010144:
	ldr r1, _020101A4
	movs r0, #8
	strh r0, [r1]
	ldr r1, _020101A8
	movs r0, #1
	strh r0, [r1]
	bl sub_02010C9C
	ldr r0, _020101AC
	movs r1, #0
	str r1, [r0]
	ldr r0, _020101B0
	str r1, [r0]
_0201015E:
	bl VBlankIntrWait
	bl sub_020101C4
	ldr r0, _020101AC
	ldr r1, _020101B4
	ldr r2, _020101B8
	bl sub_0201031C
	b _0201015E
	.align 2, 0
_02010174: .4byte REG_DMA3
_02010178: .4byte gUnknown_2012C98
_0201017C: .4byte gUnknown_3001040
_02010180: .4byte 0x8400000D
_02010184: .4byte IntrMain
_02010188: .4byte gUnknown_3001090
_0201018C: .4byte 0x84000040
_02010190: .4byte INTR_VECTOR
_02010194: .4byte REG_IE
_02010198: .4byte RomHeaderMagic
_0201019C: .4byte RomHeaderGameCode
_020101A0: .4byte gUnknown_2012C90
_020101A4: .4byte REG_DISPSTAT
_020101A8: .4byte REG_IME
_020101AC: .4byte gUnknown_3001204
_020101B0: .4byte gUnknown_3001194
_020101B4: .4byte gUnknown_30011A0
_020101B8: .4byte gUnknown_2020000

	THUMB_FUNC_START sub_020101BC
sub_020101BC: @ 0x020101BC
	bx lr
	.align 2, 0

	THUMB_FUNC_START sub_020101C0
sub_020101C0: @ 0x020101C0
	bx lr
	.align 2, 0

	THUMB_FUNC_START sub_020101C4
sub_020101C4: @ 0x020101C4
	push {r4, lr}
	ldr r0, _020101E4
	ldrh r0, [r0]
	ldr r2, _020101E8
	adds r1, r2, #0
	eors r1, r0
	ldr r4, _020101EC
	ldr r3, _020101F0
	ldrh r2, [r3]
	adds r0, r1, #0
	bics r0, r2
	strh r0, [r4]
	strh r1, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_020101E4: .4byte REG_KEYINPUT
_020101E8: .4byte 0x000003FF
_020101EC: .4byte gUnknown_3001084
_020101F0: .4byte gUnknown_3001080

	THUMB_FUNC_START sub_020101F4
sub_020101F4: @ 0x020101F4
	push {lr}
	adds r3, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r3]
	cmp r0, #0
	beq _02010214
	lsls r2, r2, #0xc
_02010204:
	ldrb r0, [r3]
	orrs r0, r2
	strh r0, [r1]
	adds r3, #1
	adds r1, #2
	ldrb r0, [r3]
	cmp r0, #0
	bne _02010204
_02010214:
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_02010218
sub_02010218: @ 0x02010218
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r3, #0
	cmp r3, r2
	bhs _0201023A
_02010224:
	adds r0, r5, r3
	adds r1, r4, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _02010234
	movs r0, #0
	b _0201023C
_02010234:
	adds r3, #1
	cmp r3, r2
	blo _02010224
_0201023A:
	movs r0, #1
_0201023C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	THUMB_FUNC_START sub_02010244
sub_02010244: @ 0x02010244
	push {r4, r5, r6, lr}
	ldr r0, _0201025C
	ldrb r3, [r0]
	adds r0, #0xd
	ldrb r4, [r0]
	movs r5, #1
	rsbs r5, r5, #0
	movs r2, #0
	ldr r1, _02010260
	subs r0, r1, #1
	b _0201026E
	.align 2, 0
_0201025C: .4byte RomHeaderGameCode + 3
_02010260: .4byte gUnknown_2012CCD
_02010264:
	adds r1, #2
	adds r0, #2
	adds r2, #1
	cmp r2, #5
	bhi _0201027E
_0201026E:
	ldrb r6, [r0]
	cmp r3, r6
	bne _02010264
	movs r5, #1
	ldrb r1, [r1]
	cmp r4, r1
	blt _0201027E
	movs r5, #0
_0201027E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _020102E0
	ldr r4, _020102A0
	ldr r1, _020102A4
	adds r0, r4, #0
	movs r2, #0xf
	bl sub_02010218
	cmp r0, #1
	bne _020102B8
	cmp r5, #0
	bne _020102A8
	movs r0, #5
	b _020102E2
	.align 2, 0
_020102A0: .4byte RomHeaderGameTitle
_020102A4: .4byte gUnknown_2012CD8
_020102A8:
	ldr r1, _020102B4
	movs r0, #2
	str r0, [r1]
	movs r0, #3
	b _020102E2
	.align 2, 0
_020102B4: .4byte gUnknown_3001208
_020102B8:
	ldr r1, _020102D0
	adds r0, r4, #0
	movs r2, #0xf
	bl sub_02010218
	adds r1, r0, #0
	cmp r1, #1
	bne _020102E0
	cmp r5, #0
	bne _020102D4
	movs r0, #4
	b _020102E2
	.align 2, 0
_020102D0: .4byte gUnknown_2012CE8
_020102D4:
	ldr r0, _020102DC
	str r1, [r0]
	movs r0, #2
	b _020102E2
	.align 2, 0
_020102DC: .4byte gUnknown_3001208
_020102E0:
	movs r0, #6
_020102E2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_020102E8
sub_020102E8: @ 0x020102E8
	push {lr}
	ldr r0, _02010308
	ldrb r0, [r0]
	cmp r0, #0x30
	bne _02010314
	ldr r0, _0201030C
	ldrb r0, [r0]
	cmp r0, #0x31
	bne _02010314
	ldr r0, _02010310
	ldrb r0, [r0]
	cmp r0, #0x96
	bne _02010314
	bl sub_02010244
	b _02010316
	.align 2, 0
_02010308: .4byte RomHeaderMakerCode
_0201030C: .4byte RomHeaderMakerCode + 1
_02010310: .4byte RomHeaderMagic
_02010314:
	movs r0, #6
_02010316:
	pop {r1}
	bx r1
	.align 2, 0

	THUMB_FUNC_START sub_0201031C
sub_0201031C: @ 0x0201031C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0xb
	bls _0201032A
	b _02010486
_0201032A:
	lsls r0, r0, #2
	ldr r1, _02010334
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_02010334: .4byte _02010338
_02010338: @ jump table
	.4byte _02010368 @ case 0
	.4byte _020103BC @ case 1
	.4byte _020103C6 @ case 2
	.4byte _020103D0 @ case 3
	.4byte _020103DC @ case 4
	.4byte _02010406 @ case 5
	.4byte _02010470 @ case 6
	.4byte _02010478 @ case 7
	.4byte _02010456 @ case 8
	.4byte _02010420 @ case 9
	.4byte _0201042E @ case 10
	.4byte _02010480 @ case 11
_02010368:
	movs r0, #0
	bl sub_02010D00
	ldr r1, _0201039C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #0xb3
	bgt _0201037C
	b _02010486
_0201037C:
	movs r0, #0
	str r0, [r1]
	ldr r1, _020103A0
	str r0, [r1]
	bl sub_020102E8
	subs r0, #2
	cmp r0, #4
	bls _02010390
	b _02010486
_02010390:
	lsls r0, r0, #2
	ldr r1, _020103A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0201039C: .4byte gUnknown_3001000
_020103A0: .4byte gUnknown_3001190
_020103A4: .4byte _020103A8
_020103A8: @ jump table
	.4byte _020103FE @ case 0
	.4byte _020103FE @ case 1
	.4byte _0201045E @ case 2
	.4byte _0201045E @ case 3
	.4byte _02010450 @ case 4
_020103BC:
	bl sub_02010960
	cmp r0, #0
	beq _02010450
	b _020103FE
_020103C6:
	bl sub_02010B9C
_020103CA:
	cmp r0, #1
	beq _020103FE
	b _02010450
_020103D0:
	movs r0, #0
	bl sub_02010C80
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _020103CA
_020103DC:
	mov r0, sp
	bl sub_020109A8
	cmp r0, #1
	bne _020103F0
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _020103FE
	b _02010414
_020103F0:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #1
	beq _020103FE
	movs r0, #7
	str r0, [r4]
	b _02010486
_020103FE:
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	b _02010486
_02010406:
	bl sub_02010B2C
	ldr r2, _0201041C
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
_02010414:
	movs r0, #9
	str r0, [r4]
	b _02010486
	.align 2, 0
_0201041C: .4byte gUnknown_3001190
_02010420:
	bl sub_02011864
	cmp r0, #1
	beq _02010446
	movs r0, #0xa
	str r0, [r4]
	b _02010486
_0201042E:
	movs r0, #4
	bl sub_02010D00
	bl sub_0201189C
	adds r2, r0, #0
	cmp r2, #1
	bne _02010450
	ldr r0, _0201044C
	ldr r1, [r0]
	orrs r1, r2
	str r1, [r0]
_02010446:
	movs r0, #8
	str r0, [r4]
	b _02010486
	.align 2, 0
_0201044C: .4byte gUnknown_3001190
_02010450:
	movs r0, #0xb
	str r0, [r4]
	b _02010486
_02010456:
	ldr r0, _02010464
	ldr r0, [r0]
	cmp r0, #0
	bne _02010468
_0201045E:
	movs r0, #6
	str r0, [r4]
	b _02010486
	.align 2, 0
_02010464: .4byte gUnknown_3001190
_02010468:
	movs r0, #1
	bl sub_02010D00
	b _02010486
_02010470:
	movs r0, #3
	bl sub_02010D00
	b _02010486
_02010478:
	movs r0, #2
	bl sub_02010D00
	b _02010486
_02010480:
	movs r0, #2
	bl sub_02010D00
_02010486:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	THUMB_FUNC_START sub_02010490
sub_02010490: @ 0x02010490
	push {lr}
	sub sp, #4
	ldr r3, _020104C8
	mov r1, sp
	ldr r2, _020104CC
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _020104D0
	mov r0, sp
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _020104D4
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _020104D8
	movs r1, #3
_020104B4:
	ldrh r0, [r2]
	strh r0, [r3]
	adds r3, #0x20
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _020104B4
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_020104C8: .4byte PLTT + 0x2
_020104CC: .4byte 0x00007FFF
_020104D0: .4byte REG_DMA3
_020104D4: .4byte 0x81000100
_020104D8: .4byte gUnknown_2012CF8

	THUMB_FUNC_START sub_020104DC
sub_020104DC: @ 0x020104DC
	push {lr}
	sub sp, #4
	mov r1, sp
	ldr r2, _02010510
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _02010514
	str r1, [r0]
	ldr r1, _02010518
	str r1, [r0, #4]
	ldr r1, _0201051C
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _02010520
	str r1, [r0]
	ldr r1, _02010524
	str r1, [r0, #4]
	ldr r1, _02010528
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	bl sub_02010490
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_02010510: .4byte 0x00001111
_02010514: .4byte REG_DMA3
_02010518: .4byte VRAM + 0x008420
_0201051C: .4byte 0x81000C00
_02010520: .4byte gUnknown_2012D20
_02010524: .4byte VRAM + 0x008600
_02010528: .4byte 0x84000080

	THUMB_FUNC_START sub_0201052C
sub_0201052C: @ 0x0201052C
	ldr r2, _0201053C
	ldr r1, _02010540
	ldrh r0, [r1]
	strh r0, [r2]
	movs r0, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_0201053C: .4byte gUnknown_300101E
_02010540: .4byte REG_IME

	THUMB_FUNC_START sub_02010544
sub_02010544: @ 0x02010544
	ldr r0, _02010550
	ldr r1, _02010554
	ldrh r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_02010550: .4byte REG_IME
_02010554: .4byte gUnknown_300101E

	THUMB_FUNC_START sub_02010558
sub_02010558: @ 0x02010558
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x9f
	bhi _0201056A
	movs r3, #0xf
	ands r3, r2
	cmp r3, #9
	bls _0201056E
_0201056A:
	movs r0, #0xff
	b _0201057C
_0201056E:
	lsrs r1, r0, #0x1c
	movs r0, #0xf
	ands r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
_0201057C:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_02010580
sub_02010580: @ 0x02010580
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r4, r1, #0
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0201059E
	adds r0, r1, #0
	movs r1, #0x64
	bl __umodsi3
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _020105AC
_0201059E:
	movs r1, #0xc8
	lsls r1, r1, #1
	adds r0, r4, #0
	bl __modsi3
	cmp r0, #0
	bne _020105B0
_020105AC:
	movs r0, #1
	b _020105B2
_020105B0:
	movs r0, #0
_020105B2:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_020105B8
sub_020105B8: @ 0x020105B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	movs r5, #0
	subs r4, r7, #1
	cmp r4, #0
	ble _020105F8
_020105D4:
	ldr r1, _0201063C
	adds r0, r5, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_02010580
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _020105F2
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_020105F2:
	subs r4, #1
	cmp r4, #0
	bgt _020105D4
_020105F8:
	subs r0, r6, #1
	cmp r0, #0
	ble _02010610
	ldr r1, _02010640
	adds r4, r0, #0
_02010602:
	ldm r1!, {r0}
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	subs r4, #1
	cmp r4, #0
	bne _02010602
_02010610:
	cmp r6, #2
	bls _02010628
	adds r0, r7, #0
	bl sub_02010580
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _02010628
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_02010628:
	mov r1, r8
	adds r0, r5, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r5, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0201063C: .4byte 0x0000016D
_02010640: .4byte gUnknown_2012E6C

	THUMB_FUNC_START sub_02010644
sub_02010644: @ 0x02010644
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrb r0, [r6]
	bl sub_02010558
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldrb r0, [r6, #1]
	bl sub_02010558
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldrb r0, [r6, #2]
	bl sub_02010558
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_020105B8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	THUMB_FUNC_START sub_02010680
sub_02010680: @ 0x02010680
	push {r4, r5, lr}
	ldr r5, _020106AC
	movs r0, #0
	strh r0, [r5]
	bl sub_0201052C
	bl SiiRtcUnprotect
	bl SiiRtcProbe
	ldr r4, _020106B0
	strb r0, [r4]
	bl sub_02010544
	ldrb r4, [r4]
	movs r0, #0xf
	ands r0, r4
	cmp r0, #1
	beq _020106B4
	movs r0, #1
	strh r0, [r5]
	b _020106D2
	.align 2, 0
_020106AC: .4byte gUnknown_3001008
_020106B0: .4byte gUnknown_300101C
_020106B4:
	movs r0, #0xf0
	ands r0, r4
	cmp r0, #0
	beq _020106BE
	movs r0, #2
_020106BE:
	strh r0, [r5]
	ldr r4, _020106D8
	adds r0, r4, #0
	bl sub_0201074C
	adds r0, r4, #0
	bl sub_02010760
	ldr r1, _020106DC
	strh r0, [r1]
_020106D2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_020106D8: .4byte gUnknown_3001010
_020106DC: .4byte gUnknown_3001008

	THUMB_FUNC_START sub_020106E0
sub_020106E0: @ 0x020106E0
	ldr r0, _020106E8
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_020106E8: .4byte gUnknown_3001008

	THUMB_FUNC_START sub_020106EC
sub_020106EC: @ 0x020106EC
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, _02010708
	ldrh r1, [r0]
	movs r0, #0xff
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _02010710
	adds r1, r2, #0
	ldr r0, _0201070C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	b _02010716
	.align 2, 0
_02010708: .4byte gUnknown_3001008
_0201070C: .4byte gUnknown_2012E60
_02010710:
	adds r0, r2, #0
	bl sub_0201074C
_02010716:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_0201071C
sub_0201071C: @ 0x0201071C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0201052C
	adds r0, r4, #0
	bl SiiRtcGetDateTime
	bl sub_02010544
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_02010734
sub_02010734: @ 0x02010734
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0201052C
	adds r0, r4, #0
	bl SiiRtcGetStatus
	bl sub_02010544
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_0201074C
sub_0201074C: @ 0x0201074C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_02010734
	adds r0, r4, #0
	bl sub_0201071C
	pop {r4}
	pop {r0}
	bx r0

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
	bl sub_02010580
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _020107E8
	ldr r1, [r1, #4]
	adds r0, r0, r1
	b _020107F6
	.align 2, 0
_020107E8: .4byte gUnknown_2012E6C
_020107EC:
	ldr r0, _0201085C
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
	.align 2, 0
_0201085C: .4byte gUnknown_2012E6C

	THUMB_FUNC_START sub_02010860
sub_02010860: @ 0x02010860
	push {lr}
	bl sub_0201052C
	bl SiiRtcReset
	bl sub_02010544
	pop {r0}
	bx r0
	.align 2, 0

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
	.align 2, 0

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
	.align 2, 0

	THUMB_FUNC_START sub_02010980
sub_02010980: @ 0x02010980
	push {r4, lr}
	sub sp, #4
	mov r2, sp
	ldr r4, _020109A4
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
	.align 2, 0
_020109A4: .4byte REG_IME

	THUMB_FUNC_START sub_020109A8
sub_020109A8: @ 0x020109A8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _020109FC
	adds r0, r4, #0
	bl sub_0201074C
	ldrb r0, [r4]
	bl sub_02010558
	strb r0, [r5]
	ldr r5, _02010A00
	ldr r2, _02010A04
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_02010874
	ldr r4, _02010A08
	ldr r1, _02010A0C
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
	.align 2, 0
_020109FC: .4byte gUnknown_3001020
_02010A00: .4byte gUnknown_3001218
_02010A04: .4byte gUnknown_2028098
_02010A08: .4byte gUnknown_3001210
_02010A0C: .4byte gUnknown_20280A0
_02010A10:
	movs r0, #1
_02010A12:
	pop {r4, r5}
	pop {r1}
	bx r1

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

	THUMB_FUNC_START sub_02010A84
sub_02010A84: @ 0x02010A84
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, r6, #2
	bl sub_02010A44
	ldrb r0, [r6, #2]
	bl sub_02010558
	adds r5, r0, #0
	ldr r4, _02010AE4
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
	bl sub_02010580
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
	.align 2, 0
_02010AE4: .4byte gUnknown_2012E6C

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

	THUMB_FUNC_START sub_02010B2C
sub_02010B2C: @ 0x02010B2C
	push {r4, lr}
	ldr r4, _02010B68
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
	.align 2, 0
_02010B68: .4byte gUnknown_3001020
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
	ldr r0, _02010B98
	bl sub_02010980
_02010B90:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02010B98: .4byte gUnknown_3001020

	THUMB_FUNC_START sub_02010B9C
sub_02010B9C: @ 0x02010B9C
	push {r4, lr}
	ldr r4, _02010BB4
	movs r0, #1
	str r0, [r4]
	bl IdentifyFlash
	cmp r0, #0
	beq _02010BB8
	movs r0, #0
	str r0, [r4]
	b _02010BC2
	.align 2, 0
_02010BB4: .4byte gUnknown_300123C
_02010BB8:
	ldr r1, _02010BC8
	movs r0, #0
	bl SetFlashTimerIntr
	movs r0, #1
_02010BC2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_02010BC8: .4byte gUnknown_2012CBC

	THUMB_FUNC_START sub_02010BCC
sub_02010BCC: @ 0x02010BCC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl ReadFlash
	pop {r0}
	bx r0
	.align 2, 0

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
	.align 2, 0

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
	.align 2, 0

	THUMB_FUNC_START sub_02010C04
sub_02010C04: @ 0x02010C04
	ldr r0, _02010C08
	bx lr
	.align 2, 0
_02010C08: .4byte gUnknown_300122C

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
	ldr r0, _02010C28
	ldr r1, _02010C2C
	bl sub_02010BDC
	b _02010C54
	.align 2, 0
_02010C28: .4byte 0x0000FFFF
_02010C2C: .4byte gUnknown_2012E9C
_02010C30:
	movs r4, #0
_02010C32:
	adds r0, r4, #0
	ldr r1, _02010C48
	bl sub_02010BDC
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _02010C32
	b _02010C54
	.align 2, 0
_02010C48: .4byte gUnknown_2012E9C
_02010C4C:
	ldr r1, _02010C5C
	movs r0, #0
	bl sub_02010BDC
_02010C54:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_02010C5C: .4byte gUnknown_2012E9C

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
	.align 2, 0

	THUMB_FUNC_START sub_02010C80
sub_02010C80: @ 0x02010C80
	push {lr}
	ldr r0, _02010C94
	ldr r1, _02010C98
	bl sub_02010BF0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_02010C94: .4byte 0x0000FFFF
_02010C98: .4byte gUnknown_2012E9C

	THUMB_FUNC_START sub_02010C9C
sub_02010C9C: @ 0x02010C9C
	push {r4, r5, lr}
	movs r5, #0x80
	lsls r5, r5, #0x13
	movs r1, #0
	strh r1, [r5]
	ldr r0, _02010CE8
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #0x3e
	strh r1, [r0]
	ldr r0, _02010CEC
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UnCompVram
	ldr r0, _02010CF0
	ldr r1, _02010CF4
	bl LZ77UnCompVram
	ldr r0, _02010CF8
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r4, #0x80
	lsls r4, r4, #1
	adds r2, r4, #0
	bl CpuSet
	ldr r1, _02010CFC
	movs r2, #0xdc
	lsls r2, r2, #8
	adds r0, r2, #0
	strh r0, [r1]
	strh r4, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02010CE8: .4byte REG_BG0HOFS
_02010CEC: .4byte gUnknown_2013758
_02010CF0: .4byte gUnknown_2012F2C
_02010CF4: .4byte VRAM + 0x00E000
_02010CF8: .4byte gUnknown_2012F0C
_02010CFC: .4byte REG_BG0CNT

	THUMB_FUNC_START sub_02010D00
sub_02010D00: @ 0x02010D00
	push {lr}
	cmp r0, #4
	bhi _02010D80
	lsls r0, r0, #2
	ldr r1, _02010D10
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_02010D10: .4byte _02010D14
_02010D14: @ jump table
	.4byte _02010D28 @ case 0
	.4byte _02010D38 @ case 1
	.4byte _02010D4C @ case 2
	.4byte _02010D60 @ case 3
	.4byte _02010D70 @ case 4
_02010D28:
	ldr r0, _02010D34
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	b _02010D80
	.align 2, 0
_02010D34: .4byte REG_BG0HOFS
_02010D38:
	ldr r1, _02010D48
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0
	b _02010D7E
	.align 2, 0
_02010D48: .4byte REG_BG0HOFS
_02010D4C:
	ldr r1, _02010D5C
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xb0
	b _02010D7E
	.align 2, 0
_02010D5C: .4byte REG_BG0HOFS
_02010D60:
	ldr r1, _02010D6C
	movs r0, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xb0
	b _02010D7E
	.align 2, 0
_02010D6C: .4byte REG_BG0HOFS
_02010D70:
	ldr r1, _02010D84
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
	.align 2, 0
_02010D84: .4byte REG_BG0HOFS

	THUMB_FUNC_START sub_02010D88
sub_02010D88: @ 0x02010D88
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _02010DA8
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
	.align 2, 0
_02010DA8: .4byte EraseFlashSector

	THUMB_FUNC_START sub_02010DAC
sub_02010DAC: @ 0x02010DAC
	ldr r0, _02010DBC
	movs r1, #0
	str r1, [r0]
	ldr r0, _02010DC0
	strh r1, [r0]
	ldr r0, _02010DC4
	str r1, [r0]
	bx lr
	.align 2, 0
_02010DBC: .4byte gUnknown_3001230
_02010DC0: .4byte gUnknown_3001220
_02010DC4: .4byte gUnknown_300122C

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
	ldr r2, _02010DF8
	movs r1, #1
	lsls r1, r3
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	b _02010E20
	.align 2, 0
_02010DF8: .4byte gUnknown_300122C
_02010DFC:
	ldr r2, _02010E0C
	adds r1, r0, #0
	lsls r1, r3
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	b _02010E20
	.align 2, 0
_02010E0C: .4byte gUnknown_300122C
_02010E10:
	ldr r0, _02010E28
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
	.align 2, 0
_02010E28: .4byte gUnknown_300122C

	THUMB_FUNC_START sub_02010E2C
sub_02010E2C: @ 0x02010E2C
	push {r4, r5, r6, r7, lr}
	adds r7, r1, #0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, _02010E50
	ldr r0, _02010E54
	str r0, [r1]
	ldr r0, _02010E58
	cmp r2, r0
	beq _02010E5C
	adds r0, r2, #0
	adds r1, r7, #0
	bl sub_02010ECC
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _02010EAE
	.align 2, 0
_02010E50: .4byte gUnknown_3001234
_02010E54: .4byte gUnknown_2020000
_02010E58: .4byte 0x0000FFFF
_02010E5C:
	ldr r1, _02010EB8
	ldr r5, _02010EBC
	ldrh r0, [r5]
	strh r0, [r1]
	ldr r1, _02010EC0
	ldr r6, _02010EC4
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
	ldr r0, _02010EC8
	ldr r0, [r0]
	cmp r0, #0
	beq _02010EAE
	movs r5, #0xff
	ldr r1, _02010EBC
	ldr r0, _02010EB8
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _02010EC4
	ldr r0, _02010EC0
	ldr r0, [r0]
	str r0, [r1]
_02010EAE:
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_02010EB8: .4byte gUnknown_3001228
_02010EBC: .4byte gUnknown_3001220
_02010EC0: .4byte gUnknown_3001224
_02010EC4: .4byte gUnknown_3001230
_02010EC8: .4byte gUnknown_300122C

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
	ldr r0, _02010F98
	ldrh r0, [r0]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r5, #0
	movs r1, #0xe
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, _02010F9C
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
	ldr r2, _02010FA0
	mov ip, r2
	mov r8, ip
	movs r2, #0
	ldr r1, _02010FA4
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
	ldr r2, _02010FA8
	adds r0, r1, r2
	strh r6, [r0]
	ldr r3, _02010FAC
	adds r2, r1, r3
	ldr r0, _02010FB0
	str r0, [r2]
	ldr r6, _02010FB4
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
	ldr r1, _02010FA0
	ldr r1, [r1]
	ldr r7, _02010FB8
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
	.align 2, 0
_02010F98: .4byte gUnknown_3001220
_02010F9C: .4byte gUnknown_3001230
_02010FA0: .4byte gUnknown_3001234
_02010FA4: .4byte 0x00000FFF
_02010FA8: .4byte 0x00000FF4
_02010FAC: .4byte 0x00000FF8
_02010FB0: .4byte gRS_Unknown_8012025
_02010FB4: .4byte 0x00000FFC
_02010FB8: .4byte 0x00000FF6

	THUMB_FUNC_START sub_02010FBC
sub_02010FBC: @ 0x02010FBC
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r4, _02011020
	movs r3, #0
	movs r6, #0
	ldr r1, _02011024
_02010FD0:
	adds r0, r4, r3
	strb r6, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r1
	bls _02010FD0
	ldr r0, _02011028
	adds r0, r4, r0
	ldr r1, _0201102C
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
	ldr r1, _02011030
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
	.align 2, 0
_02011020: .4byte gUnknown_2020000
_02011024: .4byte 0x00000FFF
_02011028: .4byte 0x00000FF8
_0201102C: .4byte gRS_Unknown_8012025
_02011030: .4byte 0x00000FF4

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

	THUMB_FUNC_START sub_02011060
sub_02011060: @ 0x02011060
	push {r4, r5, r6, lr}
	ldr r1, _0201109C
	ldr r0, _020110A0
	str r0, [r1]
	ldr r1, _020110A4
	ldr r5, _020110A8
	ldrh r0, [r5]
	strh r0, [r1]
	ldr r1, _020110AC
	ldr r6, _020110B0
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
	ldr r1, _020110B4
	movs r0, #0
	strh r0, [r1]
	ldr r1, _020110B8
	movs r0, #0
	str r0, [r1]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0201109C: .4byte gUnknown_3001234
_020110A0: .4byte gUnknown_2020000
_020110A4: .4byte gUnknown_3001228
_020110A8: .4byte gUnknown_3001220
_020110AC: .4byte gUnknown_3001224
_020110B0: .4byte gUnknown_3001230
_020110B4: .4byte gUnknown_3001238
_020110B8: .4byte gUnknown_300122C

	THUMB_FUNC_START sub_020110BC
sub_020110BC: @ 0x020110BC
	ldr r1, _020110E0
	ldr r0, _020110E4
	str r0, [r1]
	ldr r1, _020110E8
	ldr r0, _020110EC
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _020110F0
	ldr r0, _020110F4
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _020110F8
	movs r0, #0
	strh r0, [r1]
	ldr r1, _020110FC
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_020110E0: .4byte gUnknown_3001234
_020110E4: .4byte gUnknown_2020000
_020110E8: .4byte gUnknown_3001228
_020110EC: .4byte gUnknown_3001220
_020110F0: .4byte gUnknown_3001224
_020110F4: .4byte gUnknown_3001230
_020110F8: .4byte gUnknown_3001238
_020110FC: .4byte gUnknown_300122C

	THUMB_FUNC_START sub_02011000
sub_02011000: @ 0x02011100
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _0201113C
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
	ldr r0, _02011140
	ldr r0, [r0]
	cmp r0, #0
	beq _02011156
	movs r5, #0xff
	ldr r1, _02011144
	ldr r0, _02011148
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0201114C
	ldr r0, _02011150
	ldr r0, [r0]
	str r0, [r1]
	b _02011156
	.align 2, 0
_0201113C: .4byte gUnknown_3001238
_02011140: .4byte gUnknown_300122C
_02011144: .4byte gUnknown_3001220
_02011148: .4byte gUnknown_3001228
_0201114C: .4byte gUnknown_3001230
_02011150: .4byte gUnknown_3001224
_02011154:
	movs r5, #0xff
_02011156:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	THUMB_FUNC_START sub_02011160
sub_02011160: @ 0x02011160
	push {r4, lr}
	lsls r0, r0, #0x10
	movs r4, #1
	ldr r2, _02011194
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	bl sub_020111AC
	ldr r0, _02011198
	ldr r0, [r0]
	cmp r0, #0
	beq _0201118A
	movs r4, #0xff
	ldr r1, _0201119C
	ldr r0, _020111A0
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _020111A4
	ldr r0, _020111A8
	ldr r0, [r0]
	str r0, [r1]
_0201118A:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_02011194: .4byte 0xFFFF0000
_02011198: .4byte gUnknown_300122C
_0201119C: .4byte gUnknown_3001220
_020111A0: .4byte gUnknown_3001228
_020111A4: .4byte gUnknown_3001230
_020111A8: .4byte gUnknown_3001224

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
	ldr r0, _02011278
	ldrh r0, [r0]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r5, #0
	movs r1, #0xe
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, _0201127C
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
	ldr r2, _02011280
	mov ip, r2
	mov r8, ip
	movs r2, #0
	ldr r1, _02011284
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
	ldr r2, _02011288
	adds r0, r1, r2
	strh r6, [r0]
	ldr r6, _0201128C
	adds r2, r1, r6
	ldr r0, _02011290
	str r0, [r2]
	ldr r7, _02011294
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
	ldr r1, _02011280
	ldr r1, [r1]
	ldr r2, _02011298
	adds r1, r1, r2
	strh r0, [r1]
	ldr r0, _0201129C
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	movs r6, #1
	movs r4, #0
	ldr r7, _020112A0
	mov sb, r7
	ldr r7, _020112A4
	b _020112AE
	.align 2, 0
_02011278: .4byte gUnknown_3001220
_0201127C: .4byte gUnknown_3001230
_02011280: .4byte gUnknown_3001234
_02011284: .4byte 0x00000FFF
_02011288: .4byte 0x00000FF4
_0201128C: .4byte 0x00000FF8
_02011290: .4byte gRS_Unknown_8012025
_02011294: .4byte 0x00000FFC
_02011298: .4byte 0x00000FF6
_0201129C: .4byte EraseFlashSector
_020112A0: .4byte 0x00000FF7
_020112A4: .4byte ProgramFlashByte
_020112A8:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_020112AE:
	cmp r4, sb
	bhi _020112CC
	ldr r0, _020112D8
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
	.align 2, 0
_020112D8: .4byte gUnknown_3001234
_020112DC:
	movs r6, #1
	movs r4, #0
	ldr r1, _020112E8
	mov sb, r1
	ldr r7, _020112EC
	b _020112F6
	.align 2, 0
_020112E8: .4byte ProgramFlashByte
_020112EC: .4byte 0x00000FF9
_020112F0:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_020112F6:
	cmp r4, #6
	bhi _02011318
	adds r1, r4, r7
	ldr r0, _0201132C
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
	.align 2, 0
_0201132C: .4byte gUnknown_3001234
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
	.align 2, 0

	THUMB_FUNC_START sub_0201134C
sub_0201134C: @ 0x0201134C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	ldr r6, _020113A8
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
	ldr r5, _020113AC
	ldr r1, [r5]
	movs r0, #1
	ands r1, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r3, _020113B0
	ldr r1, _020113B4
	ldr r0, _020113B8
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
	.align 2, 0
_020113A8: .4byte gUnknown_3001220
_020113AC: .4byte gUnknown_3001230
_020113B0: .4byte ProgramFlashByte
_020113B4: .4byte 0x00000FF8
_020113B8: .4byte gUnknown_3001234
_020113BC:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	bl sub_02010DC8
	ldr r0, _020113DC
	ldrh r0, [r0]
	strh r0, [r6]
	ldr r0, _020113E0
	ldr r0, [r0]
	str r0, [r5]
	movs r0, #0xff
_020113D4:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_020113DC: .4byte gUnknown_3001228
_020113E0: .4byte gUnknown_3001224

	THUMB_FUNC_START sub_020113E4
sub_020113E4: @ 0x020113E4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	ldr r6, _02011438
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
	ldr r5, _0201143C
	ldr r1, [r5]
	movs r0, #1
	ands r1, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _02011440
	ldr r1, _02011444
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
	.align 2, 0
_02011438: .4byte gUnknown_3001220
_0201143C: .4byte gUnknown_3001230
_02011440: .4byte ProgramFlashByte
_02011444: .4byte 0x00000FF8
_02011448:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	bl sub_02010DC8
	ldr r0, _02011468
	ldrh r0, [r0]
	strh r0, [r6]
	ldr r0, _0201146C
	ldr r0, [r0]
	str r0, [r5]
	movs r0, #0xff
_02011460:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_02011468: .4byte gUnknown_3001228
_0201146C: .4byte gUnknown_3001224

	THUMB_FUNC_START sub_02011470
sub_02011470: @ 0x02011470
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r1, _02011488
	ldr r0, _0201148C
	str r0, [r1]
	ldr r0, _02011490
	cmp r4, r0
	beq _02011494
	movs r5, #0xff
	b _020114A6
	.align 2, 0
_02011488: .4byte gUnknown_3001234
_0201148C: .4byte gUnknown_2020000
_02011490: .4byte 0x0000FFFF
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
	.align 2, 0

	THUMB_FUNC_START sub_020114B0
sub_020114B0: @ 0x020114B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	ldr r0, _0201154C
	ldr r1, [r0]
	movs r0, #1
	ands r1, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #0x11
	lsrs r7, r0, #0x10
	movs r5, #0
	ldr r6, _02011550
_020114CC:
	adds r0, r5, r7
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r6]
	bl sub_020117E8
	ldr r0, [r6]
	ldr r1, _02011554
	adds r0, r0, r1
	ldrh r1, [r0]
	cmp r1, #0
	bne _020114E8
	ldr r0, _02011558
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
	ldr r1, _0201155C
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, _02011560
	adds r5, #1
	cmp r1, r0
	bne _02011538
	ldr r1, _02011564
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, r3
	bne _02011538
	movs r2, #0
	ldrh r0, [r4, #4]
	cmp r2, r0
	bhs _02011538
	adds r3, r4, #0
	ldr r4, _02011550
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
	.align 2, 0
_0201154C: .4byte gUnknown_3001230
_02011550: .4byte gUnknown_3001234
_02011554: .4byte 0x00000FF4
_02011558: .4byte gUnknown_3001220
_0201155C: .4byte 0x00000FF8
_02011560: .4byte gRS_Unknown_8012025
_02011564: .4byte 0x00000FF6

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
	ldr r7, _020115F4
_02011584:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r7]
	bl sub_020117E8
	ldr r2, [r7]
	ldr r1, _020115F8
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, _020115FC
	cmp r1, r0
	bne _020115D4
	movs r5, #1
	ldr r3, _02011600
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
	ldr r3, _02011604
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _020115D4
	ldr r2, _02011608
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
	ldr r0, _0201160C
	movs r1, #0xff
	str r1, [sp]
	cmp r6, r0
	bne _02011614
	movs r2, #1
	str r2, [sp]
	b _02011614
	.align 2, 0
_020115F4: .4byte gUnknown_3001234
_020115F8: .4byte 0x00000FF8
_020115FC: .4byte gRS_Unknown_8012025
_02011600: .4byte 0x00000FF4
_02011604: .4byte 0x00000FF6
_02011608: .4byte 0x00000FFC
_0201160C: .4byte 0x00003FFF
_02011610:
	movs r3, #0
	str r3, [sp]
_02011614:
	movs r6, #0
	movs r5, #0
	movs r4, #0
	ldr r7, _0201168C
_0201161C:
	adds r0, r4, #0
	adds r0, #0xe
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r7]
	bl sub_020117E8
	ldr r2, [r7]
	ldr r1, _02011690
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, _02011694
	cmp r1, r0
	bne _02011670
	movs r5, #1
	ldr r3, _02011698
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
	ldr r3, _0201169C
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, r2
	bne _02011670
	ldr r2, _020116A0
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
	ldr r0, _020116A4
	movs r1, #0xff
	cmp r6, r0
	bne _020116AA
	movs r1, #1
	b _020116AA
	.align 2, 0
_0201168C: .4byte gUnknown_3001234
_02011690: .4byte 0x00000FF8
_02011694: .4byte gRS_Unknown_8012025
_02011698: .4byte 0x00000FF4
_0201169C: .4byte 0x00000FF6
_020116A0: .4byte 0x00000FFC
_020116A4: .4byte 0x00003FFF
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
	ldr r0, _020116E0
	mov r3, sb
	b _02011704
	.align 2, 0
_020116E0: .4byte gUnknown_3001230
_020116E4:
	ldr r0, _020116EC
	mov r1, r8
	str r1, [r0]
	b _02011734
	.align 2, 0
_020116EC: .4byte gUnknown_3001230
_020116F0:
	cmp r8, sb
	bhs _02011700
	ldr r0, _020116FC
	mov r2, sb
	str r2, [r0]
	b _02011734
	.align 2, 0
_020116FC: .4byte gUnknown_3001230
_02011700:
	ldr r0, _02011708
	mov r3, r8
_02011704:
	str r3, [r0]
	b _02011734
	.align 2, 0
_02011708: .4byte gUnknown_3001230
_0201170C:
	ldr r0, _02011718
	mov r2, r8
	str r2, [r0]
	cmp r1, #0xff
	beq _0201172C
	b _02011734
	.align 2, 0
_02011718: .4byte gUnknown_3001230
_0201171C:
	cmp r1, #1
	bne _02011738
	ldr r0, _02011730
	mov r3, sb
	str r3, [r0]
	ldr r0, [sp]
	cmp r0, #0xff
	bne _02011734
_0201172C:
	movs r0, #0xff
	b _02011764
	.align 2, 0
_02011730: .4byte gUnknown_3001230
_02011734:
	movs r0, #1
	b _02011764
_02011738:
	ldr r2, [sp]
	cmp r2, #0
	bne _02011758
	cmp r1, #0
	bne _02011758
	ldr r0, _02011750
	str r1, [r0]
	ldr r0, _02011754
	strh r1, [r0]
	movs r0, #0
	b _02011764
	.align 2, 0
_02011750: .4byte gUnknown_3001230
_02011754: .4byte gUnknown_3001220
_02011758:
	ldr r0, _02011774
	movs r1, #0
	str r1, [r0]
	ldr r0, _02011778
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
	.align 2, 0
_02011774: .4byte gUnknown_3001230
_02011778: .4byte gUnknown_3001220

	THUMB_FUNC_START sub_0201177C
sub_0201177C: @ 0x0201177C
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	ldr r5, _020117CC
	adds r1, r5, #0
	bl sub_020117E8
	ldr r0, _020117D0
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r0, _020117D4
	cmp r1, r0
	bne _020117E0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_02011800
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _020117D8
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
	.align 2, 0
_020117CC: .4byte gUnknown_2020000
_020117D0: .4byte 0x00000FF8
_020117D4: .4byte gRS_Unknown_8012025
_020117D8: .4byte gUnknown_2020FF4
_020117DC:
	movs r0, #2
	b _020117E2
_020117E0:
	movs r0, #0
_020117E2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

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

	THUMB_FUNC_START sub_0201182C
sub_0201182C: @ 0x0201182C
	bx lr
	.align 2, 0

	THUMB_FUNC_START sub_02011830
sub_02011830: @ 0x02011830
	bx lr
	.align 2, 0

	THUMB_FUNC_START sub_02011834
sub_02011834: @ 0x02011834
	bx lr
	.align 2, 0

	THUMB_FUNC_START sub_02011838
sub_02011838: @ 0x02011838
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r2, r1, #0
	ldr r0, _02011850
	cmp r1, r0
	bls _0201184C
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _02011854
_0201184C:
	movs r0, #0
	b _0201185A
	.align 2, 0
_02011850: .4byte 0x00003FFF
_02011854:
	lsls r0, r2, #1
	ldr r1, _02011860
	adds r0, r0, r1
_0201185A:
	pop {r1}
	bx r1
	.align 2, 0
_02011860: .4byte gUnknown_2021BD0

	THUMB_FUNC_START sub_02011864
sub_02011864: @ 0x02011864
	push {r4, lr}
	sub sp, #4
	ldr r0, _02011888
	bl sub_02011838
	adds r4, r0, #0
	mov r0, sp
	bl sub_020109A8
	ldrh r1, [r4]
	ldr r0, _0201188C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _02011890
	movs r0, #0
	b _02011892
	.align 2, 0
_02011888: .4byte 0x000040C2
_0201188C: .4byte gUnknown_3001218
_02011890:
	movs r0, #1
_02011892:
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	THUMB_FUNC_START sub_0201189C
sub_0201189C: @ 0x0201189C
	push {lr}
	sub sp, #4
	bl sub_02011864
	cmp r0, #1
	beq _020118D0
	mov r0, sp
	bl sub_020109A8
	ldr r0, _020118D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	blt _020118DC
	ldr r0, _020118D8
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
	.align 2, 0
_020118D4: .4byte gUnknown_3001218
_020118D8: .4byte 0x000040C2
_020118DC:
	movs r0, #0
_020118DE:
	add sp, #4
	pop {r1}
	bx r1
