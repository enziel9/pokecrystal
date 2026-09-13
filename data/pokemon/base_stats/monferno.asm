	db 0 ; species ID placeholder

	db 64, 78, 52, 81, 78, 52
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIGHTING ; type
	db 45 ; catch rate
	db 142 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/monferno/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CUT, DIG, DOUBLE_TEAM, ENDURE, FIRE_BLAST, FRUSTRATION, HIDDEN_POWER, IRON_TAIL, PROTECT, REST, RETURN, ROCK_SMASH, SLEEP_TALK, STRENGTH, SUNNY_DAY, SWAGGER, TOXIC
	; end
