	db 0 ; species ID placeholder

	db 110,123, 65, 65,100, 65
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIGHTING ; type
	db 45 ; catch rate
	db 238 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/emboar/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ATTRACT, DOUBLE_TEAM, EARTHQUAKE, FIRE_BLAST, FRUSTRATION, HIDDEN_POWER, HYPER_BEAM, PROTECT, REST, RETURN, ROAR, ROCK_SMASH, STRENGTH, SUNNY_DAY, SWAGGER, TOXIC
	; end
