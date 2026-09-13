	db 0 ; species ID placeholder

	db 95,109,105, 56, 75, 85
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GROUND ; type
	db 45 ; catch rate
	db 236 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/torterra/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CUT, DOUBLE_TEAM, EARTHQUAKE, ENDURE, FLASH, FRUSTRATION, GIGA_DRAIN, HIDDEN_POWER, HYPER_BEAM, IRON_TAIL, PROTECT, REST, RETURN, ROAR, ROCK_SMASH, SANDSTORM, SLEEP_TALK, STRENGTH, SUNNY_DAY, SWAGGER, TOXIC
	; end
