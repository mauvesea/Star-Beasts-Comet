Route1_Object:
	db $b ; border block

	def_warp_events
	warp_event 40,  7, MT_MOON_1F, 1
	warp_event 4, 11, VERMILION_OLD_ROD_HOUSE, 2

	def_bg_events
	bg_event 19,  5, 3 ; Route1Text3
	bg_event 37,  5, 4 ; Route1Text4

	def_object_events
	object_event 37,  8, SPRITE_COOLTRAINER_M, STAY, DOWN, 1 ; person
	object_event 18,  6, SPRITE_YOUNGSTER, WALK, LEFT_RIGHT, 2 ; person

	def_warps_to ROUTE_1

	; unused
	warp_to 40, 19, 4
