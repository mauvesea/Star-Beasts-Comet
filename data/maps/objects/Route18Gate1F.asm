Route18Gate1F_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  0, ROUTE_14, 2
	warp_event  3,  0, ROUTE_14, 2
	warp_event  2,  7, ROUTE_7_GATE, 1
	warp_event  3,  7, ROUTE_7_GATE, 1

	def_bg_events

	def_object_events
	object_event  5,  4, SPRITE_GUARD, STAY, LEFT, 1 ; person

	def_warps_to ROUTE_18_GATE_1F
