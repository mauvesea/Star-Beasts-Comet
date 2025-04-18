MACRO external_map
	dn \2, \1
	dw \3
ENDM

; the appearance of towns and routes in the town map
ExternalMapEntries:
	table_width 3, ExternalMapEntries
	; x, y, name
	external_map  8, 3, PalletTownName
	external_map  10, 3, ViridianCityName
	external_map  9,  6, PewterCityName
	external_map  7,  6, CeruleanCityName
	external_map 6,  3, VermilionCityName
	external_map  3,  5, CeladonCityName
	external_map 2,  7, LavenderTownName
	external_map 7,  8, SaffronCityName
	external_map  7, 10, FuchsiaCityName
	external_map  3,  10, RangerStationName
	external_map  14, 12, CinnabarIslandName
	external_map  6,  0, IndigoPlateauName
	external_map  7, 3, Route1Name
	external_map  9,  3, Route2Name
	external_map  11,  2, Route3Name
	external_map  12, 2, Route4Name
	external_map 14,  2, Route5Name
	external_map 7,  5, Route6Name
	external_map  4,  7, Route7Name
	external_map 5,  5, Route8Name
	external_map 0,  2, Route9Name
	external_map 7,  7, Route10Name
	external_map 3,  12, Route11Name
	external_map 8,  8, Route12Name
	external_map 13, 11, Route13Name
	external_map 11, 12, Route14Name
	external_map 12, 12, Route15Name
	external_map  6,  8, Route16Name
	external_map  4,  8, Route17Name
	external_map  6, 13, Route18Name
	external_map  6, 15, Route19Name
	external_map  4, 15, Route20Name
	external_map  2, 13, Route21Name
	external_map  0,  8, Route22Name
	external_map  6,  2, Route23Name
	external_map 10,  1, Route24Name
	external_map 11,  0, Route25Name
	assert_table_length FIRST_INDOOR_MAP


MACRO internal_map
	db \1 + 1
	dn \3, \2
	dw \4
ENDM

; the appearance of buildings and dungeons in the town map
InternalMapEntries:
	; maximum map id subject to this rule, x, y, name
	internal_map OAKS_LAB,                       8, 3, PalletTownName
	internal_map VIRIDIAN_GYM,                   2,  8, ViridianCityName
	internal_map VIRIDIAN_FOREST_SOUTH_GATE,     2,  6, Route2Name
	internal_map VIRIDIAN_FOREST,                9,  4, ViridianForestName
	internal_map PEWTER_POKECENTER,              9,  6, PewterCityName
	internal_map MT_MOON_1F,                    9,  5, MountMoonName
	internal_map MT_MOON_B2F,                    8,  6, MountMoonName
	internal_map CERULEAN_MART,                 10,  2, CeruleanCityName
	internal_map MT_MOON_POKECENTER,             9,  6, Route4Name
	internal_map ANCIENT_CAVE, 	3,  4, DiglettsCaveName	
	internal_map DAYCARE,                       10,  4, Route5Name
	internal_map BLOODSTONE_BAY, 2,  5, BloodstoneBayName
	internal_map PURPLE_FOREST,  10,  4, ViridianCityName
	internal_map UNDERGROUND_PATH_ROUTE_8,      14,  8, SeafoamIslandsName
	internal_map ROCK_TUNNEL_1F,                0,  2, RockTunnelName
	internal_map POWER_PLANT,                   15,  4, PowerPlantName
	internal_map ROUTE_11_GATE_2F,              13,  9, Route11Name
	internal_map ROUTE_12_GATE_1F,              14,  7, Route12Name
	internal_map BILLS_HOUSE,                   12,  0, SeaCottageName
	internal_map VERMILION_DOCK,                10,  9, VermilionCityName
	internal_map SS_ANNE_B1F_ROOMS,              9, 10, SSAnneName
	internal_map MOLE_HOLE,				  9,  4, ViridianForestName
	internal_map VICTORY_ROAD_1F,                6,  1, VictoryRoadName
	internal_map VULT_MAZE,				  5,  3, VultMazeName
	internal_map VILLA_3F,                       4,  14, VillaName
	internal_map HALL_OF_FAME,                   0,  2, PokemonLeagueName
	internal_map UNDERGROUND_PATH_NORTH_SOUTH,  10,  5, UndergroundPathName
	internal_map CHAMPIONS_ROOM,                 0,  2, PokemonLeagueName
	internal_map UNDERGROUND_PATH_WEST_EAST,    10,  5, UndergroundPathName
	internal_map CELADON_MART_4F,    7,  8, SaffronCityName
	internal_map CELADON_MART_ELEVATOR,    7,  8, SewersName
	internal_map CELADON_HOTEL,                  7,  5, CeladonCityName
	internal_map LAVENDER_POKECENTER,           2,  7, LavenderTownName
	internal_map POKEMON_TOWER_7F,              2,  8, PokemonTowerName
	internal_map LAVENDER_CUBONE_HOUSE,         2,  7, LavenderTownName
	internal_map WARDENS_HOUSE,                  8, 13, FuchsiaCityName
	internal_map SAFARI_ZONE_GATE,               8, 10, SafariZoneName
	internal_map FUCHSIA_MEETING_ROOM,           8, 13, FuchsiaCityName
	internal_map SEAFOAM_ISLANDS_B4F,            5, 15, SeafoamIslandsName
	internal_map VERMILION_OLD_ROD_HOUSE,       10,  9, VermilionCityName
	internal_map FUCHSIA_GOOD_ROD_HOUSE,         8, 13, FuchsiaCityName
	internal_map POKEMON_MANSION_1F,             2, 15, PokemonMansionName
	internal_map GAS_STATION,             2, 15, Route4Name
	internal_map INDIGO_PLATEAU_LOBBY,           0,  2, IndigoPlateauName
	internal_map FIGHTING_DOJO,            2, 7, LavenderTownName
	internal_map MR_PSYCHICS_HOUSE,             10,  5, SaffronCityName
	internal_map ROUTE_15_GATE_2F,               9, 13, Route15Name
	internal_map ROUTE_16_FLY_HOUSE,             4,  5, Route16Name
	internal_map ROUTE_12_SUPER_ROD_HOUSE,      14, 10, Route12Name
	internal_map ROUTE_18_GATE_2F,               7, 13, Route18Name
	internal_map SEAFOAM_ISLANDS_1F,             5, 15, SeafoamIslandsName
	internal_map ROUTE_22_GATE,                  0,  7, Route22Name
	internal_map VICTORY_ROAD_2F,                6,  1, VictoryRoadName
	internal_map ROUTE_12_GATE_2F,              14,  7, Route12Name
	internal_map VERMILION_TRADE_HOUSE,         10,  9, VermilionCityName
	internal_map DIGLETTS_CAVE,                  7,  4, DiglettsCaveName
	internal_map VICTORY_ROAD_3F,                6,  1, VictoryRoadName
	internal_map ROCKET_HIDEOUT_B4F,              5,  4, RocketHQName
	internal_map SECRET_GARDEN,                  13, 0, SecretGardenName
	internal_map SECRET_PATH,                   13, 0, SecretGardenName
	internal_map DEVILS_CANYON, 	3,  4, DiglettsCaveName	
	internal_map SILPH_CO_8F,                   10,  5, SilphCoName
	internal_map POKEMON_MANSION_B1F,            2, 15, PokemonMansionName
	internal_map SAFARI_ZONE_NORTH_REST_HOUSE,   8, 10, SafariZoneName
	internal_map CERULEAN_CAVE_1F,               9,  1, CeruleanCaveName
	internal_map NAME_RATERS_HOUSE,             2,  7, LavenderTownName
	internal_map CERULEAN_BADGE_HOUSE,          10,  2, CeruleanCityName
	internal_map ROCK_TUNNEL_B1F,               14,  3, RockTunnelName
	internal_map SILPH_CO_ELEVATOR,             10,  5, SilphCoName
	internal_map AGATHAS_ROOM,                   0,  2, PokemonLeagueName
	db -1 ; end
