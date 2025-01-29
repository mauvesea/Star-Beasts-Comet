MtMoonB1F_Object:
	db $3 ; border block

	def_warp_events
	warp_event  3, 23, MT_MOON_POKECENTER, 3
	warp_event  5, 43, MT_MOON_1F, 1
	warp_event 13, 25, MT_MOON_1F, 4
	warp_event 17, 35, MT_MOON_1F, 7
	warp_event 25, 23, MT_MOON_1F, 5
	warp_event 23, 43, MT_MOON_1F, 6
	warp_event 17, 15, LAST_MAP, 3
	warp_event 16, 15, MT_MOON_B2F, 3

	def_bg_events

	def_object_events
	object_event  15,  27, SPRITE_SCIENTIST, STAY, RIGHT, 1 ; person


	def_warps_to MT_MOON_B1F
