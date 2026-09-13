	object_const_def

OlivineCity_MapScripts:
	def_scene_scripts
	scene_script OlivineCityNoop1Scene, SCENE_OLIVINECITY_RIVAL_ENCOUNTER
	scene_script OlivineCityNoop2Scene, SCENE_OLIVINECITY_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, OlivineCityFlypointCallback

OlivineCityNoop1Scene:
	end

OlivineCityNoop2Scene:
	end

OlivineCityFlypointCallback:
	setflag ENGINE_FLYPOINT_OLIVINE
	endcallback

OlivineCitySoldier1Script:
	opentext
	writetext OlivineCitySoldier1Text
	waitbutton
	closetext
	end

OlivineCitySoldier2Script:
	opentext
	writetext OlivineCitySoldier2Text
	waitbutton
	closetext
	end

OlivineCitySoldier3Script:
	opentext
	writetext OlivineCitySoldier3Text
	waitbutton
	closetext
	end

OlivineCityChosen1Script:
	opentext
	writetext OlivineCityChosen1Text
	waitbutton
	closetext
	end

OlivineCityChosen2Script:
	opentext
	writetext OlivineCityChosen2Text
	waitbutton
	closetext
	end

OlivineCityOfficerScript:
	opentext
	writetext OlivineCityOfficerText
	waitbutton
	closetext
	end

OlivineCitySailor1Script:
	jumptextfaceplayer OlivineCitySailor1Text

OlivineCityStandingYoungsterScript:
	faceplayer
	opentext
	random 2
	ifequal 0, .FiftyFifty
	writetext OlivineCityStandingYoungsterPokegearText
	waitbutton
	closetext
	end

.FiftyFifty:
	writetext OlivineCityStandingYoungsterPokedexText
	waitbutton
	closetext
	end

OlivineCitySailor2Script:
	jumptextfaceplayer OlivineCitySailor2Text

OlivineCitySign:
	jumptext OlivineCitySignText

OlivineCityPortSign:
	jumptext OlivineCityPortSignText

OlivineGymSign:
	jumptext OlivineGymSignText

OlivineLighthouseSign:
	jumptext OlivineLighthouseSignText

OlivineCityBattleTowerSign:
	jumptext OlivineCityBattleTowerSignText

OlivineCityPokecenterSign:
	jumpstd PokecenterSignScript

OlivineCityMartSign:
	jumpstd MartSignScript

OlivineCitySoldier1Text:
	text "Circolare."

	para "Nessuno spettacolo"
	line "da vedere qui."
	done

OlivineCitySoldier2Text:
	text "L'Ordine veglia"
	line "su Olivine."
	done

OlivineCitySoldier3Text:
	text "Il porto e' sotto"
	line "controllo."
	done

OlivineCityChosen1Text:
	text "Il deposito e'"
	line "riservato."

	para "Non avvicinarti"
	line "oltre."
	done

OlivineCityChosen2Text:
	text "Abbiamo ordini"
	line "precisi."

	para "Meglio non fare"
	line "domande."
	done

OlivineCityOfficerText:
	text "Il faro resta"
	line "sotto la nostra"
	cont "sorveglianza."

	para "Nessuno entra ed"
	line "esce senza"
	cont "autorizzazione."
	done

OlivineCitySailor1Text:
	text "Dark roads are"
	line "dangerous at"
	cont "night."

	para "But in the pitch-"
	line "black of night,"

	para "the sea is even"
	line "more treacherous!"

	para "Without the beacon"
	line "of the LIGHTHOUSE"

	para "to guide it, no"
	line "ship can sail."
	done

OlivineCityStandingYoungsterPokegearText:
	text "That thing you"
	line "have--it's a #-"
	cont "GEAR, right? Wow,"
	cont "that's cool."
	done

OlivineCityStandingYoungsterPokedexText:
	text "Wow, you have a"
	line "#DEX!"

	para "That is just so"
	line "awesome."
	done

OlivineCitySailor2Text:
	text "The sea is sweet!"

	para "Sunsets on the sea"
	line "are marvelous!"

	para "Sing with me! "
	line "Yo-ho! Blow the"
	cont "man down!…"
	done

OlivineCitySignText:
	text "OLIVINE CITY"

	para "The Port Closest"
	line "to Foreign Lands"
	done

OlivineCityPortSignText:
	text "OLIVINE PORT"
	line "FAST SHIP PIER"
	done

OlivineGymSignText:
	text "DEPOSITO"
	line "DELL'ORDINE"

	para "Accesso"
	line "riservato."
	done

OlivineLighthouseSignText:
	text "OLIVINE LIGHTHOUSE"
	line "Also known as the"
	cont "GLITTER LIGHTHOUSE"
	done

OlivineCityBattleTowerSignText:
	text "BATTLE TOWER AHEAD"
	line "Opening Now!"
	done

OlivineCityBattleTowerSignText_NotYetOpen: ; unreferenced
; originally shown when the Battle Tower was closed
	text "BATTLE TOWER AHEAD"
	done

OlivineCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13, 21, OLIVINE_POKECENTER_1F, 1
	warp_event  9, 11, OLIVINE_HOUSE_BETA, 1
	warp_event  7, 21, OLIVINE_CAFE, 1
	warp_event 19, 17, OLIVINE_MART, 2
	warp_event 29, 27, OLIVINE_LIGHTHOUSE_1F, 1
	warp_event 19, 27, OLIVINE_PORT_PASSAGE, 1
	warp_event 20, 27, OLIVINE_PORT_PASSAGE, 2

	def_coord_events

	def_bg_events
	bg_event 17, 11, BGEVENT_READ, OlivineCitySign
	bg_event 20, 24, BGEVENT_READ, OlivineCityPortSign
	bg_event  7, 11, BGEVENT_READ, OlivineGymSign
	bg_event 30, 28, BGEVENT_READ, OlivineLighthouseSign
	bg_event  3, 23, BGEVENT_READ, OlivineCityBattleTowerSign
	bg_event 14, 21, BGEVENT_READ, OlivineCityPokecenterSign
	bg_event 20, 17, BGEVENT_READ, OlivineCityMartSign

	def_object_events
	object_event 26, 27, SPRITE_ORDER_SOLDIER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCitySoldier1Script, -1
	object_event 20, 13, SPRITE_ORDER_SOLDIER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCitySoldier2Script, -1
	object_event 17, 21, SPRITE_ORDER_SOLDIER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCitySoldier3Script, -1
	object_event  8, 12, SPRITE_ORDER_CHOSEN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCityChosen1Script, -1
	object_event 12, 12, SPRITE_ORDER_CHOSEN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCityChosen2Script, -1
	object_event 28, 28, SPRITE_ORDER_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCityOfficerScript, -1
