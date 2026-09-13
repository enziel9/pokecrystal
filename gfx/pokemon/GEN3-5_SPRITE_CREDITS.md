# Gen3-5 sprite credits

Front/back battle sprites, shiny palettes and footprints for species beyond
the native 251 are reused from community GBC-style conversions, not drawn
for this project. Kept per the same credit convention those projects
themselves use (none of them ship a formal license).

- **Hoenn (Gen3) starters** - Treecko, Torchic, Mudkip: from
  [monhacks/ancientruby](https://github.com/monhacks/ancientruby)
  ("Pokémon Ancient Ruby & Sapphire"), itself built on the COMBOY GBC-style
  sprite collection.
- **Sinnoh (Gen4) starters** - Turtwig, Chimchar, Piplup: from
  [monhacks/dp.gbc](https://github.com/monhacks/dp.gbc) ("Pokémon Diamond /
  Pearl GBC"). Gen4 sprites by **ver2ion**
  ([DeviantArt gallery](https://www.deviantart.com/ver2ion/gallery/90563200/pokemon-gbc-sprites-gen-4-sinnoh)).
  Their footprint files kept the original slot's old name (that repo
  reassigns Bulbasaur/Charmander/Squirtle's slots to Turtwig/Chimchar/
  Piplup rather than adding new ones) - renamed here to match the real
  species.
- **Unova (Gen5) starters** - Snivy, Tepig, Oshawott: from
  [AzureKeys/BW3G](https://github.com/AzureKeys/BW3G) ("Black and White 3:
  Genesis"). Its own README credits: "All Gen 3-5 Pokemon sprites from the
  **COMBOY** collection, plus one sprite from **JaceDeane**." Same slot-reuse
  situation as dp.gbc for footprints.

## Known gaps

- No `anim.asm`/`anim_idle.asm` (idle wobble animation) for Snivy/Tepig/
  Oshawott - BW3G doesn't customize these per species for its added mons,
  so none exist upstream to copy. Falls back to whatever default the engine
  uses when unset; not yet wired up either way.
- Bitmask data (`gfx/pokemon/bitmasks.asm`) not yet ported: in all three
  source repos, the vast majority of species (including these 9) share one
  collapsed "no special bitmask" block - same as vanilla pokecrystal's own
  default for most Pokémon. Should just point at pokecrystal-mod's existing
  equivalent default rather than needing new data, but not yet wired.
- Frame-pointer table entries (which of the per-species `anim.asm` frame
  indices map to which pixel data) not yet written into this project's own
  `gfx/pokemon/anim_pointers.asm`/`bitmask_pointers.asm`/`pic_pointers.asm` -
  the raw assets above are extracted and verified (valid GBC format, 4
  colors, correct dimensions) but not yet referenced by any table.
