	db 0 ; species ID placeholder

	db  45,  45,  55,  63,  45,  55
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 45 ; catch rate
	db 62 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/snivy/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CUT, DOUBLE_TEAM, ENDURE, FLASH, FRUSTRATION, GIGA_DRAIN, HIDDEN_POWER, IRON_TAIL, PROTECT, REST, RETURN, SLEEP_TALK, SNORE, SOLARBEAM, SUNNY_DAY, SWAGGER, SWIFT, TOXIC
	; end
