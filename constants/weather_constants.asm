; wCurWeather values (overworld weather, see engine/events/weather.asm)
	const_def
	const OW_WEATHER_NONE
	const OW_WEATHER_RAIN
	const OW_WEATHER_THUNDERSTORM
	const OW_WEATHER_SANDSTORM
	const OW_WEATHER_SUNLIGHT
	const OW_WEATHER_SNOW ; overworld-only: no in-battle hail effect exists in Gen 2
DEF NUM_OW_WEATHERS EQU const_value - 1

DEF NUM_WEATHER_PARTICLES EQU 3

; reserved overworld sprite tile ids for weather particle graphics
; (see the reservation in engine/overworld/overworld.asm's ArrangeUsedSprites)
DEF WEATHER_TILE_1 EQU $fe
DEF WEATHER_TILE_2 EQU $ff

; wOverworldWeatherTimer bit 0: run particles every other frame (~30fps)

; generic scaffolding for a per-day random weather roll (see
; RandomWeatherMapList in weather.asm). Placeholder distribution -- Matteo
; wants to tune odds per map later, this just proves the day-reroll works.
DEF NUM_RANDOM_WEATHER_MAPS EQU 2

