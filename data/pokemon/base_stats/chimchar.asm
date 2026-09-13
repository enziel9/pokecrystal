	db 0 ; species ID placeholder

	db  44,  58,  44,  61,  58,  44
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 62 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/chimchar/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CUT, DIG, DOUBLE_TEAM, ENDURE, FIRE_BLAST, FIRE_PUNCH, FLAMETHROWER, FRUSTRATION, HEADBUTT, HIDDEN_POWER, IRON_TAIL, MUD_SLAP, PROTECT, PSYCH_UP, REST, RETURN, ROCK_SMASH, ROLLOUT, SLEEP_TALK, SNORE, STRENGTH, SUNNY_DAY, SWAGGER, SWIFT, THIEF, THUNDERPUNCH, TOXIC
	; end
