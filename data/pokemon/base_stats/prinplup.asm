	db 0 ; species ID placeholder

	db 64, 66, 68, 50, 81, 76
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 45 ; catch rate
	db 142 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/prinplup/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BLIZZARD, CUT, DIG, DOUBLE_TEAM, ENDURE, FRUSTRATION, HIDDEN_POWER, PROTECT, RAIN_DANCE, REST, RETURN, ROCK_SMASH, SLEEP_TALK, STRENGTH, SURF, SWAGGER, TOXIC, WATERFALL
	; end
