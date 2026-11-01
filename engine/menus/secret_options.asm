; Secret settings live outside the normal save checksum. A new game clears the
; cheat but leaves the unlock signature in SRAM bank 1.
EnableSecretOptionsSRAM:
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, 1
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamBank], a
	ret

DisableSecretOptionsSRAM:
	xor a
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamEnable], a
	ret

InitTitleSecretOptions:
	xor a
	ld [wTitleCodeProgress], a
	ld [wSecretOptionsState], a
	ld [wWalkThroughWalls], a
	farcall CheckSecretSaveAvailable
	ld a, [wSecretSaveValid]
	and a
	ret z
	call EnableSecretOptionsSRAM
	ld a, SECRET_STATE_LOCKED
	ld [wSecretOptionsState], a
	ld a, [sSecretOptionsMagic1]
	cp SECRET_OPTIONS_MAGIC_1
	jr nz, .done
	ld a, [sSecretOptionsMagic2]
	cp SECRET_OPTIONS_MAGIC_2
	jr nz, .done
	ld a, [sSecretOptionsFlags]
	bit SECRET_OPTIONS_UNLOCKED, a
	jr z, .done
	ld a, SECRET_STATE_UNLOCKED
	ld [wSecretOptionsState], a
	ld a, [sSecretOptionsFlags]
	bit SECRET_WALK_THROUGH_WALLS, a
	jr z, .done
	ld a, 1
	ld [wWalkThroughWalls], a
.done
	jp DisableSecretOptionsSRAM

; Return carry only for normal title-screen exit keys. The final A of the
; Konami code is consumed, so unlocking leaves the player on the title screen.
PollTitleSecretCode:
	call DelayFrame
	call Joypad
	ldh a, [hJoyHeld]
	cp D_UP | SELECT | B_BUTTON
	jr z, .exit
	ldh a, [hJoyPressed]
	and a
	jr z, .stay
	ld b, a
	ld a, [wSecretOptionsState]
	and a
	jr z, .checkExit
	ld a, [wTitleCodeProgress]
	ld e, a
	ld d, 0
	ld hl, .code
	add hl, de
	ld a, [hl]
	cp b
	jr nz, .mismatch
	ld a, e
	inc a
	cp 10
	jr z, .complete
	ld [wTitleCodeProgress], a
	jr .stay
.mismatch
	xor a
	ld [wTitleCodeProgress], a
	ld a, b
	cp D_UP
	jr nz, .checkExit
	ld a, 1
	ld [wTitleCodeProgress], a
	jr .stay
.complete
	xor a
	ld [wTitleCodeProgress], a
	ld a, [wSecretOptionsState]
	cp SECRET_STATE_UNLOCKED
	jr z, .stay
	call UnlockSecretOptions
	jr .stay
.checkExit
	ld a, b
IF DEF(_DEBUG)
	and A_BUTTON | START | SELECT
ELSE
	and A_BUTTON | START
ENDC
	jr nz, .exit
.stay
	xor a
	ld [wTitleInputExit], a
	ret
.exit
	ld a, 1
	ld [wTitleInputExit], a
	ret
.code
	db D_UP, D_UP, D_DOWN, D_DOWN, D_LEFT, D_RIGHT, D_LEFT, D_RIGHT, B_BUTTON, A_BUTTON

UnlockSecretOptions:
	ld a, SECRET_STATE_UNLOCKED
	ld [wSecretOptionsState], a
	xor a
	ld [wWalkThroughWalls], a
	call EnableSecretOptionsSRAM
	ld a, SECRET_OPTIONS_MAGIC_1
	ld [sSecretOptionsMagic1], a
	ld a, SECRET_OPTIONS_MAGIC_2
	ld [sSecretOptionsMagic2], a
	ld a, 1 << SECRET_OPTIONS_UNLOCKED
	ld [sSecretOptionsFlags], a
	call DisableSecretOptionsSRAM
	ld a, SFX_GET_KEY_ITEM
	jp PlaySound

ResetSecretCheatsForNewGame:
	xor a
	ld [wWalkThroughWalls], a
	ld a, [wSecretOptionsState]
	cp SECRET_STATE_UNLOCKED
	ret nz
	call EnableSecretOptionsSRAM
	ld a, 1 << SECRET_OPTIONS_UNLOCKED
	ld [sSecretOptionsFlags], a
	jp DisableSecretOptionsSRAM

ToggleWalkThroughWalls:
	ld a, [wWalkThroughWalls]
	xor 1
	ld [wWalkThroughWalls], a
	add a ; bit 1 is the wall cheat
	or 1 << SECRET_OPTIONS_UNLOCKED
	push af
	call EnableSecretOptionsSRAM
	pop af
	ld [sSecretOptionsFlags], a
	jp DisableSecretOptionsSRAM

DisplaySecretMenu:
	call ClearScreen
	hlcoord 0, 0
	ld b, 3
	ld c, 18
	call TextBoxBorder
	hlcoord 1, 1
	ld de, .wallLabel
	call PlaceString
	hlcoord 3, 3
	ld de, .wallChoices
	call PlaceString
	hlcoord 2, 16
	ld de, .backText
	call PlaceString
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, 3
	ld [wTopMenuItemY], a
	call .setChoiceCursor
.loop
	call PlaceMenuCursor
.input
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	ld b, a
	and A_BUTTON | B_BUTTON | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
	jr z, .input
	bit BIT_B_BUTTON, b
	jr nz, .exit
	bit BIT_START, b
	jr nz, .exit
	ld a, [wTopMenuItemY]
	bit BIT_D_DOWN, b
	jr nz, .changeRow
	bit BIT_D_UP, b
	jr nz, .changeRow
	bit BIT_A_BUTTON, b
	jr nz, .pressedA
	cp 3
	jr nz, .loop
	call EraseMenuCursor
	call ToggleWalkThroughWalls
	call .setChoiceCursor
	jp .loop
.pressedA
	cp 16
	jr z, .exit
	call EraseMenuCursor
	call ToggleWalkThroughWalls
	call .setChoiceCursor
	jp .loop
.changeRow
	ld a, [wTopMenuItemY]
	cp 3
	jr nz, .leaveBack
	call PlaceUnfilledArrowMenuCursor ; keep the active cheat marked while Back is selected
	jr .chooseNewRow
.leaveBack
	call EraseMenuCursor
.chooseNewRow
	ld a, [wTopMenuItemY]
	cp 3
	ld a, 16
	jr z, .storeRow
	ld a, 3
.storeRow
	ld [wTopMenuItemY], a
	cp 16
	ld a, 1
	jr z, .storeX
	ld a, [wWalkThroughWalls]
	and a
	ld a, 2
	jr z, .storeX
	ld a, 11
.storeX
	ld [wTopMenuItemX], a
	jp .loop
.setChoiceCursor
	ld a, [wWalkThroughWalls]
	and a
	ld a, 2
	jr z, .setX
	ld a, 11
.setX
	ld [wTopMenuItemX], a
	ret
.exit
	ld a, SFX_PRESS_AB
	call PlaySound
	ret
.wallLabel
	db "WALK THROUGH WALLS@"
.wallChoices
	db "OFF      ON@"
.backText
	db "BACK@"
