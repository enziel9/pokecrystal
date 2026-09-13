	db 0 ; species ID placeholder

	db 90, 93, 55, 55, 70, 55
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIGHTING ; type
	db 45 ; catch rate
	db 146 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/pignite/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, DOUBLE_TEAM, FIRE_BLAST, FRUSTRATION, HIDDEN_POWER, PROTECT, REST, RETURN, ROAR, ROCK_SMASH, STRENGTH, SUNNY_DAY, SWAGGER, TOXIC
	; end
