SilphCo1F_Object:
	db $2e ; border block

	def_warp_events
	warp_event  8, 17, SAFFRON_CITY, 6
	warp_event  9, 17, SAFFRON_CITY, 6
	warp_event 26,  0, SILPH_CO_2F, 1
	warp_event  8,  0, SILPH_CO_ELEVATOR, 1
	warp_event 12,  0, SILPH_CO_3F, 7

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, 1 ; person

	def_warps_to SILPH_CO_1F
