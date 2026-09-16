; Overworld weather is purely map-triggered: SetCurrentWeather runs once on
; every real map transition (see data/maps/setup_scripts.asm) and stores the
; result in wCurWeather, which StartAutomaticBattleWeather (engine/battle/core.asm)
; reads to seed the starting battle weather.
;
; The falling-particle overlay reuses 4 of the OAM slots that _UpdateSprites
; (engine/overworld/map_objects.asm) leaves alone whenever
; LAST_12_SPRITE_OAM_STRUCTS_RESERVED_F is set, and 2 sprite tile ids
; (WEATHER_TILE_1/2, see constants/weather_constants.asm) that ArrangeUsedSprites
; (engine/overworld/overworld.asm) is no longer allowed to hand out to NPC/player
; graphics. Both reservations are permanent, not weather-specific, so nothing
; else needs to know about them.

DEF WEATHER_OAM_BASE EQU (OAM_COUNT - 12) * OBJ_SIZE

SetCurrentWeather::
	call RerollWeatherIfNewDay
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a

	ld hl, WeatherMapList
.loop
	ld a, [hli]
	cp -1
	jr z, .try_random
	cp b
	jr nz, .next
	ld a, [hli]
	cp c
	jr nz, .next2
	ld a, [hl]
	jr .got_weather

.next
	inc hl
.next2
	inc hl
	jr .loop

; same GROUP/MAP as above but no fixed weather -- pull today's rolled
; intensity instead (see RerollWeatherIfNewDay)
.try_random
	ld hl, RandomWeatherMapList
	ld de, wWeatherRandomIntensity
.random_loop
	ld a, [hli]
	cp -1
	jr z, .none
	cp b
	jr nz, .random_next
	ld a, [hli]
	cp c
	jr z, .got_random_weather
	inc de
	jr .random_loop

.random_next
	inc hl
	inc de
	jr .random_loop

.got_random_weather
	ld a, [de]
	jr .got_weather

.none
	xor a
.got_weather
	ld [wCurWeather], a
	xor a
	ld [wOverworldWeatherTimer], a
	ld hl, wStateFlags
	ld a, [wCurWeather]
	and a
	jr z, .no_weather

	set LAST_12_SPRITE_OAM_STRUCTS_RESERVED_F, [hl]
	call LoadWeatherGraphics
	call ResetWeatherParticles
	ret

.no_weather
	res LAST_12_SPRITE_OAM_STRUCTS_RESERVED_F, [hl]
	call HideWeatherParticles
	ret

; list of maps with fixed overworld weather (checked first, always the same
; value -- currently unused, kept as the extension point for a future map
; that should never randomize, e.g. an always-rainy cave)
; entries: db GROUP, MAP, OW_WEATHER_*
WeatherMapList:
	db -1 ; end

; list of maps with a generic per-day random weather roll (checked after
; WeatherMapList; see RerollWeatherIfNewDay/RollRandomWeatherIntensity).
; entries: db GROUP, MAP -- parallel index into wWeatherRandomIntensity
RandomWeatherMapList:
	db GROUP_ROUTE_39, MAP_ROUTE_39
	db GROUP_VILLAGGIO_INIZIALE, MAP_VILLAGGIO_INIZIALE
	assert NUM_RANDOM_WEATHER_MAPS == 2
	db -1 ; end

; Rerolls wWeatherRandomIntensity once per in-game day. Placeholder odds
; (50% clear / 30% rain / 20% thunderstorm, same shape Polished Crystal's
; GenerateRandomIntensity uses for its Overcast system) -- Matteo wants to
; tune this per map later, this only proves the day-reroll mechanics work.
RerollWeatherIfNewDay:
	ld a, [wCurDay]
	ld b, a
	ld a, [wWeatherRandomDay]
	cp b
	ret z
	ld a, b
	ld [wWeatherRandomDay], a

	ld hl, wWeatherRandomIntensity
	ld c, NUM_RANDOM_WEATHER_MAPS
.loop
	push hl
	push bc
	call RollRandomWeatherIntensity
	pop bc
	pop hl
	ld [hl], a
	inc hl
	dec c
	jr nz, .loop
	ret

RollRandomWeatherIntensity:
	call Random
	cp 50 percent
	jr c, .sunlight
	cp 90 percent
	jr c, .rain
	ld a, OW_WEATHER_THUNDERSTORM
	ret
.rain
	ld a, OW_WEATHER_RAIN
	ret
.sunlight
	ld a, OW_WEATHER_SUNLIGHT
	ret

LoadWeatherGraphics:
	ld hl, WeatherParticlesGFX
	ld de, vTiles1 + 126 tiles
	ld bc, 2 tiles
	call CopyBytes
	ret

ResetWeatherParticles:
	ld hl, wWeatherParticleY
	ld c, NUM_WEATHER_PARTICLES
	ld a, l ; stagger each particle's starting height so they don't fall in sync
.loop
	ld [hli], a
	add 40
	dec c
	jr nz, .loop
	ret

HideWeatherParticles:
	ld hl, wShadowOAM + WEATHER_OAM_BASE
	ld c, NUM_WEATHER_PARTICLES
.loop
	ld [hl], OAM_YCOORD_HIDDEN
	ld de, OBJ_SIZE
	add hl, de
	dec c
	jr nz, .loop
	ret

DoOverworldWeatherSprites::
; Called from _UpdateSprites (engine/overworld/map_objects.asm), between
; InitSprites and .fill, while wCurWeather may or may not be NONE.
	ld a, [wCurWeather]
	and a
	ret z
	cp OW_WEATHER_SUNLIGHT
	ret z ; harsh sunlight has no overworld particle, only a battle effect

; run at ~30fps
	ld hl, wOverworldWeatherTimer
	inc [hl]
	ld a, [hl]
	and 1
	ret nz

	ld a, [wCurWeather]
	cp OW_WEATHER_SNOW
	jr z, .dot
	cp OW_WEATHER_SANDSTORM
	jr z, .dot
	ld a, WEATHER_TILE_1 ; rain / thunderstorm
	jr .got_tile
.dot
	ld a, WEATHER_TILE_2
.got_tile
	ld [wWeatherParticleTile], a

	ld b, 0
	call .UpdateParticle
	ld b, 1
	call .UpdateParticle
	ld b, 2
	jp .UpdateParticle

.UpdateParticle:
; in: b = particle index (0-3), untouched throughout
	ld d, 0
	ld e, b

; BaseX[b] -> wWeatherScratchX
	ld hl, .BaseX
	add hl, de
	ld a, [hl]
	ld [wWeatherScratchX], a

; advance this particle's fall height, wrapping past the bottom of the screen
	ld hl, wWeatherParticleY
	add hl, de
	ld a, [hl]
	add 3
	cp 176 ; screen height (144) + 16px OAM y offset + 16px margin
	jr c, .no_wrap
	sub 176
.no_wrap
	ld [hl], a
	ld c, a ; c = this frame's y

; x = BaseX[b] + y/8, a gentle diagonal drift as the particle falls
	srl a
	srl a
	srl a
	ld hl, wWeatherScratchX
	add [hl]
	ld [wWeatherScratchX], a

; write the OAM entry at wShadowOAM + WEATHER_OAM_BASE + b * OBJ_SIZE
	ld a, b
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, wShadowOAM + WEATHER_OAM_BASE
	add hl, de

	ld a, c
	ld [hli], a ; y
	ld a, [wWeatherScratchX]
	ld [hli], a ; x
	ld a, [wWeatherParticleTile]
	ld [hli], a ; tile
	xor a
	ld [hl], a ; attributes
	ret

.BaseX:
	db 32, 80, 128

WeatherParticlesGFX:
	INCBIN "gfx/weather/weather_particles.2bpp"
