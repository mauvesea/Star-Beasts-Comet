Route11Gate1F_Object:
	db $a ; border block

	def_warp_events
	warp_event  0,  4, LAST_MAP, 1
	warp_event  0,  5, LAST_MAP, 2
	warp_event  7,  4, LAST_MAP, 3
	warp_event  7,  5, LAST_MAP, 4
	warp_event  2, 20, ROUTE_11_GATE_2F, 1

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_GUARD, STAY, NONE, 1 ; person

	def_warps_to ROUTE_11_GATE_1F
