SeafoamIslandsB2F_Object:
	db $43 ; border block

	def_warp_events
	warp_event 6, 26, ROUTE_11_GATE_1F, 7
	warp_event 6, 27, ROUTE_11_GATE_1F, 8
	warp_event 45, 26, SEAFOAM_ISLANDS_B3F, 1
	warp_event 45, 27, SEAFOAM_ISLANDS_B3F, 2
	warp_event 23, 11, SILPH_CO_1F, 1

	def_bg_events

	def_object_events

	def_warps_to SEAFOAM_ISLANDS_B2F
