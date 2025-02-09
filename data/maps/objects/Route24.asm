Route24_Object:
	db $0F ; border block

	def_warp_events
	warp_event  2,  9, DIGLETTS_CAVE_ROUTE_11, 5
	warp_event  3,  9, DIGLETTS_CAVE_ROUTE_11, 5
	warp_event  14,  9, DIGLETTS_CAVE_ROUTE_11, 6
	warp_event  15,  9, DIGLETTS_CAVE_ROUTE_11, 6
	warp_event  26,  9, DIGLETTS_CAVE_ROUTE_11, 7
	warp_event  27,  9, DIGLETTS_CAVE_ROUTE_11, 7
	warp_event  38,  9, DIGLETTS_CAVE_ROUTE_11, 8
	warp_event  39,  9, DIGLETTS_CAVE_ROUTE_11, 8
	warp_event  50,  9, DIGLETTS_CAVE_ROUTE_11, 9
	warp_event  51,  9, DIGLETTS_CAVE_ROUTE_11, 9
	warp_event  62,  9, DIGLETTS_CAVE_ROUTE_11, 10
	warp_event  63,  9, DIGLETTS_CAVE_ROUTE_11, 10
	warp_event  74,  9, DIGLETTS_CAVE_ROUTE_11, 11
	warp_event  75,  9, DIGLETTS_CAVE_ROUTE_11, 11
	warp_event  86,  9, DIGLETTS_CAVE_ROUTE_11, 12
	warp_event  87,  9, DIGLETTS_CAVE_ROUTE_11, 12

	def_bg_events

	def_object_events
	object_event 91,  2, SPRITE_SILPH_PRESIDENT, STAY, ANY_DIR, 1, OPP_GENTLEMAN, 6
	object_event 15,  4, SPRITE_GAMBLER, STAY, UP, 2, OPP_JR_TRAINER_M, 2
	object_event 29,  5, SPRITE_MIDDLE_AGED_MAN, STAY, LEFT, 3, OPP_JR_TRAINER_M, 3
	object_event 37,  6, SPRITE_GAMBLER, STAY, RIGHT, 4, OPP_LASS, 7
	object_event  3,  5, SPRITE_BIKER, STAY, LEFT, 5, OPP_YOUNGSTER, 4
	object_event 63,  5, SPRITE_HIKER, STAY, RIGHT, 6, OPP_LASS, 8
	object_event 75,  6, SPRITE_FISHER, STAY, LEFT, 7, OPP_BUG_CATCHER, 9
	object_event 51,  5, SPRITE_POKE_BALL, STAY, NONE, 8, TM_THUNDER_WAVE

	def_warps_to ROUTE_24
