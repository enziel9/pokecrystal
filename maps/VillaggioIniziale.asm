	object_const_def
	const_skip 3 ; VillaggioIniziale_Tauros x2, VillaggioIniziale_Woodpile
	const VILLAGGIO_WOUNDED_POKEMON
	const VILLAGGIO_GRANDPA

VillaggioIniziale_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, VillaggioIniziale_InitStarterSpriteCallback

VillaggioIniziale_InitStarterSpriteCallback:
; The wounded Pokemon's real species isn't chosen yet (or was never seen
; this visit), so it always starts looking like Togepi until the player
; actually picks one in VillaggioIniziale_WoundedPokemon below.
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_TOGEPI
	endcallback

VillaggioIniziale_Tauros:
	opentext
	writetext VillaggioIniziale_TaurosText
	cry TAUROS
	waitbutton
	closetext
	end

VillaggioIniziale_Protagonist:
	opentext
	writetext VillaggioIniziale_ProtagonistText
	waitbutton
	closetext
	end

VillaggioIniziale_Grandpa:
	opentext
	writetext VillaggioIniziale_GrandpaText
	waitbutton
	closetext
	end

VillaggioIniziale_Woodpile:
	opentext
	writetext VillaggioIniziale_WoodpileText
	waitbutton
	closetext
	end

VillaggioIniziale_WoundedPokemon:
	opentext
	writetext VillaggioIniziale_WoundedPokemonText
	waitbutton
	closetext

.ChooseCategory:
	loadmenu .CategoryMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .CategoryGrass
	ifequal 2, .CategoryWater
	ifequal 3, .CategoryGround
	ifequal 4, .CategorySpecial
	ifequal 5, .CategoryRare
	end ; player backed out (pressed B) - nothing lost, can talk again

.CategoryGrass:
	loadmenu .GrassMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .PickBulbasaur
	ifequal 2, .PickOddish
	ifequal 3, .PickParas
	ifequal 4, .PickDiglett
	ifequal 5, .PickWeedle
	sjump .ChooseCategory

.CategoryWater:
	loadmenu .WaterMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .PickSquirtle
	ifequal 2, .PickPoliwag
	ifequal 3, .PickMagikarp
	ifequal 4, .PickShellder
	ifequal 5, .PickTentacool
	sjump .ChooseCategory

.CategoryGround:
	loadmenu .GroundMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .PickGeodude
	ifequal 2, .PickGrowlithe
	ifequal 3, .PickMachop
	ifequal 4, .PickVoltorb
	ifequal 5, .PickEkans
	sjump .ChooseCategory

.CategorySpecial:
	loadmenu .SpecialMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .PickCharmander
	ifequal 2, .PickTogepi
	ifequal 3, .PickGrimer
	ifequal 4, .PickZubat
	ifequal 5, .PickTauros
	sjump .ChooseCategory

.CategoryRare:
	loadmenu .RareMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .PickUnown
	ifequal 2, .PickLapras
	ifequal 3, .PickSnorlax
	sjump .ChooseCategory

.PickBulbasaur:
	givepoke BULBASAUR, 5
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_BULBASAUR
	sjump .GotStarter
.PickOddish:
	givepoke ODDISH, 5
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_ODDISH
	sjump .GotStarter
.PickParas:
	givepoke PARAS, 5
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_PARAS
	sjump .GotStarter
.PickDiglett:
	givepoke DIGLETT, 5
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_DIGLETT
	sjump .GotStarter
.PickWeedle:
	givepoke WEEDLE, 5
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_WEEDLE
	sjump .GotStarter
.PickSquirtle:
	givepoke SQUIRTLE, 5
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_SQUIRTLE
	sjump .GotStarter
.PickPoliwag:
	givepoke POLIWAG, 5
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_POLIWAG
	sjump .GotStarter
.PickMagikarp:
	givepoke MAGIKARP, 5
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_MAGIKARP
	sjump .GotStarter
.PickShellder:
	givepoke SHELLDER, 5
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_SHELLDER
	sjump .GotStarter
.PickTentacool:
	givepoke TENTACOOL, 5
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_TENTACOOL
	sjump .GotStarter
.PickGeodude:
	givepoke GEODUDE, 5
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_GEODUDE
	sjump .GotStarter
.PickGrowlithe:
	givepoke GROWLITHE, 5
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_GROWLITHE
	sjump .GotStarter
.PickMachop:
	givepoke MACHOP, 5
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_MACHOP
	sjump .GotStarter
.PickVoltorb:
	givepoke VOLTORB, 5
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_VOLTORB
	sjump .GotStarter
.PickEkans:
	givepoke EKANS, 5
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_EKANS
	sjump .GotStarter
.PickCharmander:
	givepoke CHARMANDER, 5
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_CHARMANDER
	sjump .GotStarter
.PickTogepi:
	givepoke TOGEPI, 5
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_TOGEPI
	sjump .GotStarter
.PickGrimer:
	givepoke GRIMER, 5
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_GRIMER
	sjump .GotStarter
.PickZubat:
	givepoke ZUBAT, 5
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_ZUBAT
	sjump .GotStarter
.PickTauros:
	givepoke TAUROS, 5
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_TAUROS
	sjump .GotStarter
.PickUnown:
	givepoke UNOWN, 5
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_UNOWN
	sjump .GotStarter
.PickLapras:
	givepoke LAPRAS, 5
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_LAPRAS
	sjump .GotStarter
.PickSnorlax:
	givepoke SNORLAX, 5
	variablesprite SPRITE_VILLAGGIO_STARTER, SPRITE_SNORLAX
	sjump .GotStarter

.GotStarter:
	follow PLAYER, VILLAGGIO_WOUNDED_POKEMON
	applymovement VILLAGGIO_GRANDPA, VillaggioIniziale_GrandpaApproachMovement
	opentext
	writetext VillaggioIniziale_GrandpaApproachText
	waitbutton
	closetext
	setevent EVENT_VILLAGGIO_INIZIALE_GOT_STARTER
	end

.CategoryMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 4, 15, TEXTBOX_Y - 1
	dw .CategoryMenuData
	db 1 ; default option

.CategoryMenuData:
	db STATICMENU_CURSOR ; flags
	db 5 ; items
	db "ERBA E PICCOLI@"
	db "ACQUA@"
	db "TERRA E ROCCIA@"
	db "SPECIALI@"
	db "RARI@"

.GrassMenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 15, TEXTBOX_Y - 1
	dw .GrassMenuData
	db 1

.GrassMenuData:
	db STATICMENU_CURSOR
	db 5
	db "BULBASAUR@"
	db "ODDISH@"
	db "PARAS@"
	db "DIGLETT@"
	db "WEEDLE@"

.WaterMenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 15, TEXTBOX_Y - 1
	dw .WaterMenuData
	db 1

.WaterMenuData:
	db STATICMENU_CURSOR
	db 5
	db "SQUIRTLE@"
	db "POLIWAG@"
	db "MAGIKARP@"
	db "SHELLDER@"
	db "TENTACOOL@"

.GroundMenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 15, TEXTBOX_Y - 1
	dw .GroundMenuData
	db 1

.GroundMenuData:
	db STATICMENU_CURSOR
	db 5
	db "GEODUDE@"
	db "GROWLITHE@"
	db "MACHOP@"
	db "VOLTORB@"
	db "EKANS@"

.SpecialMenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 15, TEXTBOX_Y - 1
	dw .SpecialMenuData
	db 1

.SpecialMenuData:
	db STATICMENU_CURSOR
	db 5
	db "CHARMANDER@"
	db "TOGEPI@"
	db "GRIMER@"
	db "ZUBAT@"
	db "TAUROS@"

.RareMenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 0, 4, 15, TEXTBOX_Y - 1
	dw .RareMenuData
	db 1

.RareMenuData:
	db STATICMENU_CURSOR
	db 3
	db "UNOWN@"
	db "LAPRAS@"
	db "SNORLAX@"

VillaggioIniziale_GrandpaApproachMovement:
	step DOWN
	step DOWN
	step_end

VillaggioIniziale_Youngster:
	opentext
	writetext VillaggioIniziale_YoungsterText
	waitbutton
	closetext
	end

VillaggioIniziale_Lass:
	opentext
	writetext VillaggioIniziale_LassText
	waitbutton
	closetext
	end

VillaggioIniziale_Teacher:
	opentext
	writetext VillaggioIniziale_TeacherText
	waitbutton
	closetext
	end

VillaggioIniziale_Pokefanf:
	opentext
	writetext VillaggioIniziale_PokefanfText
	waitbutton
	closetext
	end

VillaggioIniziale_Fisher:
	opentext
	writetext VillaggioIniziale_FisherText
	waitbutton
	closetext
	end

VillaggioIniziale_FruitTree1:
	fruittree FRUITTREE_VILLAGGIO_1

VillaggioIniziale_FruitTree2:
	fruittree FRUITTREE_VILLAGGIO_2

VillaggioIniziale_FruitTree3:
	fruittree FRUITTREE_VILLAGGIO_3

VillaggioIniziale_FruitTree4:
	fruittree FRUITTREE_VILLAGGIO_4

VillaggioIniziale_FruitTree5:
	fruittree FRUITTREE_VILLAGGIO_5

VillaggioIniziale_HiddenPotion:
	hiddenitem POTION, EVENT_VILLAGGIO_INIZIALE_HIDDEN_POTION

VillaggioIniziale_HiddenEscapeRope:
	hiddenitem ESCAPE_ROPE, EVENT_VILLAGGIO_INIZIALE_HIDDEN_ESCAPE_ROPE

VillaggioIniziale_TaurosText:
	text "TAUROS: Mooo!"
	done

VillaggioIniziale_ProtagonistText:
	text "Un giorno anche tu"
	line "partirai da qui."
	done

VillaggioIniziale_GrandpaText:
	text "Il nonno osserva"
	line "il villaggio in"
	cont "silenzio."
	done

VillaggioIniziale_WoodpileText:
	text "Una catasta di"
	line "legna ben"
	cont "accatastata."
	done

VillaggioIniziale_WoundedPokemonText:
	text "Un Pokemon ferito"
	line "si nasconde qui"
	cont "dietro la legna..."
	done

VillaggioIniziale_GrandpaApproachText:
	text "NONNO: Finalmente"
	line "hai trovato il tuo"
	cont "compagno."
	para "Ora andiamo, e'"
	line "ora di tornare a"
	cont "casa insieme."
	done

VillaggioIniziale_YoungsterText:
	text "Questo villaggio"
	line "e' piccolo, ma e'"
	cont "casa mia."
	done

VillaggioIniziale_LassText:
	text "Hai visto quanta"
	line "erba alta c'e' qui"
	cont "intorno?"
	done

VillaggioIniziale_TeacherText:
	text "Studia bene prima"
	line "di partire per il"
	cont "tuo viaggio."
	done

VillaggioIniziale_PokefanfText:
	text "Adoro i Tauros"
	line "del nostro"
	cont "villaggio!"
	done

VillaggioIniziale_FisherText:
	text "Qui non c'e' un"
	line "fiume, ma un giorno"
	cont "lo trovero'."
	done

VillaggioIniziale_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 31, 10, ROUTE_39, 3
	warp_event 31, 11, ROUTE_39, 4

	def_coord_events

	def_bg_events
	bg_event 19, 20, BGEVENT_ITEM, VillaggioIniziale_HiddenPotion
	bg_event 21, 20, BGEVENT_ITEM, VillaggioIniziale_HiddenEscapeRope

	def_object_events
	object_event  5,  7, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VillaggioIniziale_Tauros, -1
	object_event  4,  9, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VillaggioIniziale_Tauros, -1
	object_event 10,  8, SPRITE_WOODPILE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VillaggioIniziale_Woodpile, -1
	object_event 10,  7, SPRITE_VILLAGGIO_STARTER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VillaggioIniziale_WoundedPokemon, EVENT_VILLAGGIO_INIZIALE_GOT_STARTER
	object_event 16, 12, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VillaggioIniziale_Grandpa, -1
	object_event  8, 20, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VillaggioIniziale_FruitTree1, -1
	object_event 10, 20, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VillaggioIniziale_FruitTree2, -1
	object_event 12, 20, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VillaggioIniziale_FruitTree3, -1
	object_event 14, 20, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VillaggioIniziale_FruitTree4, -1
	object_event 16, 20, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VillaggioIniziale_FruitTree5, -1
	object_event  9, 21, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VillaggioIniziale_Youngster, -1
	object_event 11, 21, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VillaggioIniziale_Lass, -1
	object_event 13, 21, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VillaggioIniziale_Teacher, -1
	object_event 15, 21, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VillaggioIniziale_Pokefanf, -1
	object_event 17, 21, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VillaggioIniziale_Fisher, -1
