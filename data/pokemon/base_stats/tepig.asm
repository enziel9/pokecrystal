	db 0 ; species ID placeholder

	db  65,  63,  45,  45,  45,  45
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 62 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/tepig/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, CURSE, DIG, DOUBLE_TEAM, ENDURE, FIRE_BLAST, FIRE_PUNCH, FLAMETHROWER, FRUSTRATION, HIDDEN_POWER, IRON_TAIL, MUD_SLAP, PROTECT, REST, RETURN, ROAR, ROCK_SMASH, SLEEP_TALK, SNORE, SOLARBEAM, STRENGTH, SUNNY_DAY, SWAGGER, TOXIC
	; end
