	db 0 ; species ID placeholder

	db  55,  55,  45,  45,  63,  45
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 45 ; catch rate
	db 62 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/oshawott/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, BLIZZARD, CUT, DIG, DOUBLE_TEAM, ENDURE, FRUSTRATION, HIDDEN_POWER, ICE_BEAM, ICY_WIND, IRON_TAIL, PROTECT, RAIN_DANCE, REST, RETURN, ROCK_SMASH, SLEEP_TALK, SNORE, SURF, SWAGGER, SWIFT, THIEF, TOXIC, WATERFALL, WHIRLPOOL
	; end
