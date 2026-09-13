	db 0 ; species ID placeholder

	db 75, 75, 60, 60, 83, 60
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 45 ; catch rate
	db 145 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dewott/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BLIZZARD, CUT, DIG, DOUBLE_TEAM, FRUSTRATION, HIDDEN_POWER, PROTECT, RAIN_DANCE, REST, RETURN, ROCK_SMASH, SURF, SWAGGER, TOXIC, WATERFALL
	; end
