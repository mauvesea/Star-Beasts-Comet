MACRO overworld_sprite
	dw \1
	db \2 tiles
	db BANK(\1)
ENDM

SpriteSheetPointerTable:
	table_width 4, SpriteSheetPointerTable
	INCLUDE "data/sprites/entries.asm"
	assert_table_length NUM_SPRITES
