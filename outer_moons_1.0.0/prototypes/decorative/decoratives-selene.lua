local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require ("__base__.prototypes.entity.sounds")
local decorative_trigger_effects = require("__base__.prototypes.decorative.decorative-trigger-effects")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

local base_decorative_sprite_priority = "extra-high"
local decal_tile_layer = 255

local function combine_tint(table_1, table_2)
  local t1 = table_1[1]-(1-table_2[1])
  local t2 = table_1[2]-(1-table_2[2])
  local t3 = table_1[3]-(1-table_2[3])
  return {t1,t2,t3}
end

local selene_base_tint = {1,1,1}

local tintable_rock_tint = {0.5, 0.5, 0.5}
local aluminum_rock_tint = {0.52, 0.36, 0.3} 
local titanium_rock_tint = {0.63, 0.49, 0.48}

tintable_rock_tint = combine_tint(selene_base_tint, tintable_rock_tint)
aluminum_rock_tint = combine_tint(selene_base_tint, aluminum_rock_tint)
titanium_rock_tint = combine_tint(selene_base_tint, titanium_rock_tint)

data:extend{
  {
    type = "noise-function",
    name = "uneven_select_range",
    parameters = {"input", "from", "from_slope", "to", "to_slope"},
    expression = "min(0, (input - from) / from_slope, (to - input) / to_slope)"
  },

  ---- ICE
  {
    type = "noise-expression",
    name = "selene_small_chlorine_rock",
    expression = "min(0.4, min(0.5, 3 * (selene_chlorine_region_patchy + 0.1)) - 0.7 + 0.6 * selene_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "selene_chlorine_rock_cluster",
    expression = "min(0.1, min(0.5, 3 * (selene_chlorine_region_patchy)) - 0.6 + 0.6 * selene_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "selene_chlorine_rock_tiny",
    expression = "min(0.5, min(0.5, 3 * (selene_chlorine_region_patchy + 0.2)) - 0.4 + 0.6 * selene_decorative_knockout)"
  },

  ---- ROCKS
  -- reduce density in craters
  {
    type = "noise-expression",
    name = "selene_rock_huge",
    expression = "min(0.05 * (1 - 0.75 * selene_craters_biome), - 1.2 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + selene_rock_noise + 0.5 * selene_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "selene_rock_big",
    expression = "min(0.1 * (1 - 0.5 * selene_craters_biome), - 1.0 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + selene_rock_noise + 0.5 * selene_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "selene_rock_medium",
    expression = "min(0.5 * (1 - 0.5 * selene_craters_biome), - 0.8 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + selene_rock_noise + 0.5 * selene_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "selene_rock_small",
    expression = "min(0.6 * (1 - 0.5 * selene_craters_biome), - 0.6 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + selene_rock_noise + 0.5 * selene_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "selene_rock_tiny",
    expression = "min(0.75 * (1 - 0.5 * selene_craters_biome), - 0.5 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + selene_rock_noise + 0.5 * selene_decorative_knockout)"
  },

  ---- DECALS
  {
    type = "noise-expression",
    name = "selene_crack_decal_large",
    expression = "min(0.2, range_select_base(selene_elev, 20, 50, 1, -10, 1) - 0.1 - 0.25 * aux + 0.25 * (moisture - 0.6) + 0.5 * selene_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "selene_crack_decal",
    expression = "min(0.2, range_select_base(selene_elev, 50, 90, 1, -10, 1) - 0.1 - 0.25 * aux + 0.25 * (moisture - 0.6) + 0.5 * selene_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "selene_crack_decal_huge_warm",
    expression = "selene_lowlands_biome * min(0.3, range_select_base(selene_elev, 0, 10, 1, -10, 1) - 0.1 - 0.25 * aux + 0.25 * (moisture - 0.6) + 0.5 * selene_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "selene_crack_decal_warm",
    expression = "selene_lowlands_biome * min(0.2, range_select_base(selene_elev, 10, 30, 1, -10, 1) - 0.1 - 0.25 * aux + 0.25 * (moisture - 0.6) + 0.5 * selene_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "selene_rock_decal_large",
    expression = "min(0.1, range_select_base(selene_elev, 20, 50, 1, -10, 1) - 0.6 + 0.25 * aux + 0.25 * (moisture - 0.6) + 0.5 * selene_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "waves_decal", -- everywhere sand
    expression = "(1 - aux - moisture) * 0.05 * place_every_n(5.7,5.7,1,1) * selene_highlands_biome"
  },

  {
    type = "noise-expression",
    name = "selene_sand_decal",
    expression = "(1 - aux - moisture) * 0.05 * selene_lowlands_biome"
  },
  {
    type = "noise-expression",
    name = "selene_dune_decal",
    expression = "(1 - aux - moisture) * 0.05 * selene_highlands_biome"
  },

  {
    type = "noise-expression",
    name = "crater_small",
    expression = "min(0.25, 0.35 - selene_rock_noise - aux) * place_every_n(2,2,0,0))"
  },
  {
    type = "noise-expression",
    name = "crater_medium",
    expression = "min(0.2, (0.25 - selene_rock_noise - aux) * place_every_n(4,4,0,0))"
  },
  {
    type = "noise-expression",
    name = "crater_large",
    expression = "min(0.02, (0.03 - selene_rock_noise - aux) * place_every_n(72,72,0,0))"
  },
  {
    type = "noise-expression",
    name = "crater_very_large",
    expression = "min(0.02, (0.04 - selene_rock_noise - aux) * place_every_n(84,84,0,0))"
  },
  {
    type = "noise-expression",
    name = "crater_huge",
    expression = "min(0.02, (0.04 - selene_rock_noise - aux) * place_every_n(96,96,0,0))"
  },
  {
    type = "noise-expression",
    name = "selene-crater_cliff",
    expression = "0.1 * (-selene_rock_noise - 0.5 * aux + 0.5) * (1 - max(selene_lowlands_biome, selene_highlands_biome)) * place_every_n(8,8,0,0)"
  },
  
  ---ROCKY DECALS
  {
    name = "selene-rock-decal-large",
    type = "optimized-decorative",
    order = "a[selene]-b[decorative]-b[sand]",
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {layers={water_tile=true, doodad=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -1,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-f[cracked-rock]-b[cold]",
      probability_expression = "selene_rock_decal_large"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-rock-decal/vulcanus-rock-decal-", "large-", 256, 5)
  },
  --- CRACK DECALS
  {
    name = "selene-crack-decal",
    type = "optimized-decorative",
    order = "a[selene]-b[decorative]-b[sand]",
    collision_box = {{-1, -1}, {1, 1}},
    collision_mask = {layers={water_tile=true, doodad=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = decal_tile_layer -5,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-g[cracks]-b[cold]-b[small]",
      probability_expression = "selene_crack_decal"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-cracks-cold/vulcanus-cracks-cold-", "large-", 128, 20)
  },
  --- LARGE CRACK DECALS
  {
    name = "selene-crack-decal-large",
    type = "optimized-decorative",
    order = "a[selene]-b[decorative]-b[sand]",
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -4,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-g[cracks]-b[cold]-a[large]",
      probability_expression = "selene_crack_decal_large"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-cracks-cold/vulcanus-cracks-cold-", "huge-", 256, 20)
  },
  --- HUGE WARM CRACK DECALS
  {
    name = "selene-crack-decal-huge-warm",
    type = "optimized-decorative",
    order = "a[selene]-b[decorative]-b[sand]",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -3,
    walking_sound = sounds.pebble,
    autoplace =
    {
      order = "d[ground-surface]-g[cracks]-a[warm]-a[large]",
      probability_expression = "selene_crack_decal_huge_warm"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-cracks/vulcanus-cracks-hot-", "huge-", 256, 20)
  },
  --- WARM CRACK DECALS
  {
    name = "selene-crack-decal-warm",
    type = "optimized-decorative",
    order = "a[selene]-b[decorative]-b[sand]",
    collision_box = {{-.8, -.8}, {.8, .8}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -3,
    walking_sound = sounds.pebble,
    autoplace =
    {
      order = "d[ground-surface]-g[cracks]-a[warm]-b[small]",
      probability_expression = "selene_crack_decal_warm"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-cracks/vulcanus-cracks-hot-", "large-", 128, 18)
  },
  --- SMALL CRATERS
  {
    name = "crater-selene-small",
    type = "optimized-decorative",
    order = "a[selene]-b[decorative]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-e[crater]-b[small]",
      probability_expression = "crater_small"
    },
    pictures = get_decal_pictures("__outer_moons__/graphics/decorative/selene-crater/selene-crater-small-", "", 128, 1)
  },
  --- MEDIUM CRATERS
  {
    name = "crater-selene-medium",
    type = "optimized-decorative",
    order = "a[selene]-b[decorative]",
    collision_box = {{-1, -1}, {1, 1}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-e[crater]-a[medium]",
      probability_expression = "crater_medium"
    },
    pictures = get_decal_pictures("__outer_moons__/graphics/decorative/selene-crater/selene-crater-medium-", "", 192, 1)
  },
  --- LARGE CRATERS
  {
    name = "crater-selene-large",
    type = "optimized-decorative",
    order = "a[selene]-b[decorative]",
    collision_box = {{-3, -3}, {3, 3}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-e[crater]-b[large]",
      probability_expression = "crater_large"
    },
    pictures = get_decal_pictures("__outer_moons__/graphics/decorative/selene-crater/selene-crater-large-", "", 512, 4)
  },
   --- VERY LARGE CRATER
  {
    name = "crater-selene-very-large",
    type = "optimized-decorative",
    order = "a[selene]-b[decorative]",
    collision_box = {{-4, -4}, {4, 4}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-e[crater]-b[large]",
      probability_expression = "crater_very_large"
    },
    pictures = get_decal_pictures("__outer_moons__/graphics/decorative/selene-crater/selene-crater-very-large-", "", 640, 1)
  },
  --- HUGE CRATER
   {
    name = "crater-selene-huge",
    type = "optimized-decorative",
    order = "a[selene]-b[decorative]",
    collision_box = {{-8, -8}, {8, 8}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-e[crater]-a[huge]",
      probability_expression = "crater_huge"
    },
    pictures = get_decal_pictures("__outer_moons__/graphics/decorative/selene-crater/selene-crater-huge-", "", 1280, 1)
  },
  --- SAND DUNES
  {
    name = "selene-sand-decal",
    type = "optimized-decorative",
    order = "a[selene]-b[decorative]-b[sand]",
    collision_box = {{-1, -1}, {1, 1}},
    collision_mask = {layers={water_tile=true, doodad=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    walking_sound = sounds.sand,
    autoplace = {
      order = "d[ground-surface]-h[dune]-b[patch]",
      probability_expression = "selene_dune_decal"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-dune-decal/vulcanus-dune-decal-", "", 512, 20)
  },
  {
    name = "selene-dune-decal",
    type = "optimized-decorative",
    order = "a[fulgora]-b[decorative]",
    collision_box = {{-5, -5}, {5, 5}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = 220,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-h[dune]-a[relief]",
      probability_expression = "selene_sand_decal"
    },
    pictures = get_decal_pictures("__outer_moons__/graphics/decorative/selene-dune-decal/selene-dune-decal-", "", 512, 30)
  },
  --- TINTABLE ROCKS
  --- BIG ROCKS
  {
    name = "huge-selene-rock",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__space-age__/graphics/icons/huge-volcanic-rock.png",
    subgroup = "grass",
    order = "b[decorative]-l[rock]-f[huge-selene-rock]",
    collision_box = {{-1.5, -1.1}, {1.5, 1.1}},
    selection_box = {{-1.7, -1.3}, {1.7, 1.3}},
    damaged_trigger_effect = hit_effects.rock(),
    dying_trigger_effect = decorative_trigger_effects.huge_rock(),
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 3,
      results =
      {
        {type = "item", name = "stone", amount_min = 6, amount_max = 18},
        {type = "item", name = "iron-ore", amount_min = 8, amount_max = 24},
        {type = "item", name = "copper-ore", amount_min = 3, amount_max = 9},
        {type = "item", name = "carbon", amount_min = 5, amount_max = 15},
        {type = "item", name = "aluminum-ore", amount_min = 2, amount_max = 6}
      },
    },
    map_color = {129, 105, 78},
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    impact_category = "stone",
    render_layer = "object",
    max_health = 2000,
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    autoplace = {
      order = "a[landscape]-c[rock]-a[huge]",
      probability_expression = "selene_rock_huge"
    },
    pictures =
    {
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-05.png",
        width = 201,
        height = 179,
        scale = 0.5,
        shift = {0.25, 0.0625},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-06.png",
        width = 233,
        height = 171,
        scale = 0.5,
        shift = {0.429688, 0.046875},
        tint = tintable_rock_tint,
        tint_as_overlay = true,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-07.png",
        width = 240,
        height = 192,
        scale = 0.5,
        shift = {0.398438, 0.03125},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-08.png",
        width = 219,
        height = 175,
        scale = 0.5,
        shift = {0.148438, 0.132812},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-09.png",
        width = 240,
        height = 208,
        scale = 0.5,
        shift = {0.3125, 0.0625},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-10.png",
        width = 243,
        height = 190,
        scale = 0.5,
        shift = {0.1875, 0.046875},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-11.png",
        width = 249,
        height = 185,
        scale = 0.5,
        shift = {0.398438, 0.0546875},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-12.png",
        width = 273,
        height = 163,
        scale = 0.5,
        shift = {0.34375, 0.0390625},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-13.png",
        width = 275,
        height = 175,
        scale = 0.5,
        shift = {0.273438, 0.0234375},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-14.png",
        width = 241,
        height = 215,
        scale = 0.5,
        shift = {0.195312, 0.0390625},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-15.png",
        width = 318,
        height = 181,
        scale = 0.5,
        shift = {0.523438, 0.03125},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-16.png",
        width = 217,
        height = 224,
        scale = 0.5,
        shift = {0.0546875, 0.0234375},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-17.png",
        width = 332,
        height = 228,
        scale = 0.5,
        shift = {0.226562, 0.046875},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-18.png",
        width = 290,
        height = 243,
        scale = 0.5,
        shift = {0.195312, 0.0390625},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-19.png",
        width = 349,
        height = 225,
        scale = 0.5,
        shift = {0.609375, 0.0234375},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-20.png",
        width = 287,
        height = 250,
        scale = 0.5,
        shift = {0.132812, 0.03125},
        tint = tintable_rock_tint,
        tint_as_overlay = true
      }
    }
  },
  {
    name = "big-selene-rock",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__space-age__/graphics/icons/big-volcanic-rock.png",
    subgroup = "grass",
    order = "b[decorative]-l[rock]-f[big-selene-rock]",
    collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
    selection_box = {{-1.0, -1.0}, {1.0, 0.75}},
    damaged_trigger_effect = hit_effects.rock(),
    render_layer = "object",
    max_health = 500,
    autoplace = {
      order = "a[landscape]-c[rock]-b[big]",
      probability_expression = "selene_rock_big"
    },
    dying_trigger_effect = decorative_trigger_effects.big_rock(),
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 2,
      results =
      {
        {type = "item", name = "stone", amount_min = 4, amount_max = 8},
        {type = "item", name = "iron-ore", amount_min = 5, amount_max = 10},
        {type = "item", name = "copper-ore", amount_min = 3, amount_max = 6},
        {type = "item", name = "carbon", amount_min = 2, amount_max = 4},
        {type = "item", name = "aluminum-ore", amount_min = 1, amount_max = 2}
      }
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    map_color = {129, 105, 78},
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    impact_category = "stone",
    pictures =
    {
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-01.png",
        width =  188 ,
        height =  127 ,
        shift = {0.304688, -0.4},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-02.png",
        width =  195 ,
        height =  135 ,
        shift = {0.0, 0.0390625},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-03.png",
        width =  205 ,
        height =  132 ,
        shift = {0.151562, 0.0},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-04.png",
        width =  144 ,
        height =  142 ,
        shift = {0.151562, 0.0},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-05.png",
        width =  130 ,
        height =  107 ,
        shift = {0.390625, 0.0},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-06.png",
        width =  165 ,
        height =  109 ,
        shift = {0.328125, 0.0703125},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-07.png",
        width =  150 ,
        height =  133 ,
        shift = {0.16875, -0.1},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-08.png",
        width =  156 ,
        height =  111 ,
        shift = {0.3, -0.2},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-09.png",
        width =  187 ,
        height =  120 ,
        shift = {0.0, 0.0},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-10.png",
        width =  225 ,
        height =  128 ,
        shift = {0.1, 0.0},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-11.png",
        width =  183 ,
        height =  144 ,
        shift = {0.325, -0.1},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-12.png",
        width =  158 ,
        height =  138 ,
        shift = {0.453125, 0.0},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-13.png",
        width =  188 ,
        height =  150 ,
        shift = {0.539062, -0.015625},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-14.png",
        width =  186 ,
        height =  160 ,
        shift = {0.0703125, 0.179688},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-15.png",
        width =  181 ,
        height =  174 ,
        shift = {0.160938, 0.0},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-16.png",
        width =  212 ,
        height =  150 ,
        shift = {0.242188, -0.195312},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-17.png",
        width =  155 ,
        height =  117 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-18.png",
        width =  141 ,
        height =  128 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-19.png",
        width =  176 ,
        height =  114 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-20.png",
        width =  120 ,
        height =  125 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = tintable_rock_tint,
        tint_as_overlay = true
      }
    }
  },
  --- MEDIUM selene ROCKS
  {
    name = "medium-selene-rock",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-c[medium]",
    collision_box = {{-1.1, -1.1}, {1.1, 1.1}},
    render_layer = "decorative",
    autoplace = {
      order = "d[ground-surface]-i[rock]-a[medium]",
      probability_expression = "selene_rock_medium"
    },
    trigger_effect = decorative_trigger_effects.medium_rock(),
    pictures =
    {
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-01.png",
        priority = base_decorative_sprite_priority,
        width = 89,
        height = 63,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.078125, 0.109375}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-02.png",
        priority = base_decorative_sprite_priority,
        width = 77,
        height = 66,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.015625, 0.132812}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-03.png",
        priority = base_decorative_sprite_priority,
        width = 92,
        height = 63,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.148438, 0.179688}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-04.png",
        priority = base_decorative_sprite_priority,
        width = 91,
        height = 59,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {-0.0078125, 0.1875}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-05.png",
        priority = base_decorative_sprite_priority,
        width = 104,
        height = 72,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.203125, 0.179688}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-06.png",
        priority = base_decorative_sprite_priority,
        width = 83,
        height = 82,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.015625, 0.21875}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-07.png",
        priority = base_decorative_sprite_priority,
        width = 111,
        height = 65,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0625, 0.3125}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-08.png",
        priority = base_decorative_sprite_priority,
        width = 79,
        height = 81,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.109375, 0.148438}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-09.png",
        priority = base_decorative_sprite_priority,
        width = 98,
        height = 56,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.015625, 0.140625}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-10.png",
        priority = base_decorative_sprite_priority,
        width = 91,
        height = 68,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0, 0.132812}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-11.png",
        priority = base_decorative_sprite_priority,
        width = 105,
        height = 71,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {-0.0234375, 0.125}
      },
      {
        filename = "__space-age__/graphics/decorative/medium-volcanic-rock/medium-volcanic-rock-12.png",
        priority = base_decorative_sprite_priority,
        width = 78,
        height = 80,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.078125, -0.015625}
      }
    }
  },
  --- SMALL BLACK ROCKS
  {
    name = "small-selene-rock",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-d[small]",
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    render_layer = "decorative",
    walking_sound = sounds.pebble,
    autoplace =
    {
      order = "d[ground-surface]-i[rock]-b[small]",
      probability_expression = "selene_rock_small"
    },
    trigger_effect = decorative_trigger_effects.small_rock(),
    pictures =
    {
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-01.png",
          priority = base_decorative_sprite_priority,
          width = 51,
          height = 37,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.0546875, 0.117188}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-02.png",
          priority = base_decorative_sprite_priority,
          width = 52,
          height = 35,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.0390625, 0.078125}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-03.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 42,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {-0.0078125, 0.148438}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-04.png",
          priority = base_decorative_sprite_priority,
          width = 53,
          height = 33,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.0234375, 0.15625}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-05.png",
          priority = base_decorative_sprite_priority,
          width = 47,
          height = 46,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.0390625, 0.140625}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-06.png",
          priority = base_decorative_sprite_priority,
          width = 62,
          height = 41,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {-0.03125, 0.09375}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-07.png",
          priority = base_decorative_sprite_priority,
          width = 64,
          height = 36,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {-0.015625, 0.0703125}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-08.png",
          priority = base_decorative_sprite_priority,
          width = 65,
          height = 31,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {-0.71875, -0.164062}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-09.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 34,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {-0.0859375, 0.101562}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-10.png",
          priority = base_decorative_sprite_priority,
          width = 48,
          height = 34,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.0078125, 0.125}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-11.png",
          priority = base_decorative_sprite_priority,
          width = 51,
          height = 33,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {-0.0859375, 0.078125}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-12.png",
          priority = base_decorative_sprite_priority,
          width = 47,
          height = 39,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.078125, 0.117188}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-13.png",
          priority = base_decorative_sprite_priority,
          width = 43,
          height = 33,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0, 0.09375}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-14.png",
          priority = base_decorative_sprite_priority,
          width = 43,
          height = 30,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.046875, 0.140625}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-15.png",
          priority = base_decorative_sprite_priority,
          width = 41,
          height = 37,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0, 0.140625}
        },
        {
          filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-16.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 33,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.0234375, 0.125}
        }
    }
  },
  --- TINY TINTABLE ROCKS
  {
    name = "tiny-selene-rock",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-d[small]",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    render_layer = "decorative",
    walking_sound = sounds.pebble,
    autoplace =
    {
      order = "d[ground-surface]-i[rock]-d[tiny]",
      placement_density = 5,
      probability_expression = "selene_rock_tiny"
    },
    trigger_effect = decorative_trigger_effects.small_rock(),
    pictures =
    {
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-01.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  21,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-02.png",
        priority = base_decorative_sprite_priority,
        width =  30,
        height =  19,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-03.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  24,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-04.png",
        priority = base_decorative_sprite_priority,
        width =  32,
        height =  20,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-05.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  25,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-06.png",
        priority = base_decorative_sprite_priority,
        width =  36,
        height =  24,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-07.png",
        priority = base_decorative_sprite_priority,
        width =  78,
        height =  34,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-08.png",
        priority = base_decorative_sprite_priority,
        width =  35,
        height =  19,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-09.png",
        priority = base_decorative_sprite_priority,
        width =  28,
        height =  20,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-10.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  20,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-11.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  20,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-12.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  22,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-13.png",
        priority = base_decorative_sprite_priority,
        width =  27,
        height =  19,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-14.png",
        priority = base_decorative_sprite_priority,
        width =  27,
        height =  19,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-15.png",
        priority = base_decorative_sprite_priority,
        width =  26,
        height =  22,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-16.png",
        priority = base_decorative_sprite_priority,
        width =  27,
        height =  20,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      }
    }
  },
  --- ICE ROCKS
  --- SMALL ROCKS
  {
    name = "small-chlorine-rock",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-d[small]",
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    render_layer = "decorative",
    walking_sound = sounds.pebble,
    autoplace =
    {
      order = "d[ground-surface]-b[chlorine-rock]-a[small]",
      placement_density = 2,
      probability_expression = "selene_small_chlorine_rock"
    },
    trigger_effect = decorative_trigger_effects.small_rock(),
    pictures =
    {
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-01.png",
        priority = base_decorative_sprite_priority,
        width = 51,
        height = 37,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.0546875, 0.117188}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-02.png",
        priority = base_decorative_sprite_priority,
        width = 52,
        height = 35,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.0390625, 0.078125}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-03.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 42,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {-0.0078125, 0.148438}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-04.png",
        priority = base_decorative_sprite_priority,
        width = 53,
        height = 33,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.0234375, 0.15625}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-05.png",
        priority = base_decorative_sprite_priority,
        width = 47,
        height = 46,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.0390625, 0.140625}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-06.png",
        priority = base_decorative_sprite_priority,
        width = 62,
        height = 41,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {-0.03125, 0.09375}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-07.png",
        priority = base_decorative_sprite_priority,
        width = 64,
        height = 36,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {-0.015625, 0.0703125}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-08.png",
        priority = base_decorative_sprite_priority,
        width = 65,
        height = 31,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {-0.71875, -0.164062}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-09.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 34,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {-0.0859375, 0.101562}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-10.png",
        priority = base_decorative_sprite_priority,
        width = 48,
        height = 34,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.0078125, 0.125}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-11.png",
        priority = base_decorative_sprite_priority,
        width = 51,
        height = 33,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {-0.0859375, 0.078125}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-12.png",
        priority = base_decorative_sprite_priority,
        width = 47,
        height = 39,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.078125, 0.117188}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-13.png",
        priority = base_decorative_sprite_priority,
        width = 43,
        height = 33,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0, 0.09375}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-14.png",
        priority = base_decorative_sprite_priority,
        width = 43,
        height = 30,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.046875, 0.140625}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-15.png",
        priority = base_decorative_sprite_priority,
        width = 41,
        height = 37,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0, 0.140625}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-16.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 33,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.0234375, 0.125}
      }
    }
  },
  --- TINY ROCKS
  {
    name = "tiny-chlorine-rock",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-d[small]",
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
    render_layer = "decorative",
    walking_sound = sounds.pebble,
    autoplace =
    {
      order = "d[ground-surface]-b[chlorine-rock]-c[tiny]",
      placement_density = 5,
      probability_expression = "selene_chlorine_rock_tiny"
    },
    trigger_effect = decorative_trigger_effects.small_rock(),
    pictures =
    {
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-01.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  21,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-02.png",
        priority = base_decorative_sprite_priority,
        width =  30,
        height =  19,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-03.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  24,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-04.png",
        priority = base_decorative_sprite_priority,
        width =  32,
        height =  20,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-05.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  25,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-06.png",
        priority = base_decorative_sprite_priority,
        width =  36,
        height =  24,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-07.png",
        priority = base_decorative_sprite_priority,
        width =  78,
        height =  34,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-08.png",
        priority = base_decorative_sprite_priority,
        width =  35,
        height =  19,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-09.png",
        priority = base_decorative_sprite_priority,
        width =  28,
        height =  20,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-10.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  20,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-11.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  20,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-12.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  22,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-13.png",
        priority = base_decorative_sprite_priority,
        width =  27,
        height =  19,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-14.png",
        priority = base_decorative_sprite_priority,
        width =  27,
        height =  19,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-15.png",
        priority = base_decorative_sprite_priority,
        width =  26,
        height =  22,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-16.png",
        priority = base_decorative_sprite_priority,
        width =  27,
        height =  20,
        tint_as_overlay = true,
        tint = chlorine_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      }
    }
  },
  --- ROCK CLUSTERS
  {
    name = "chlorine-rock-cluster",
    type = "optimized-decorative",
    order = "a[selene]-b[decorative]-b[sand]",
    collision_box = {{-1, -1}, {1, 1}},
    collision_mask = {layers={water_tile=true, doodad=true}, colliding_with_tiles_only=true},
    render_layer = "decorative",
    walking_sound = sounds.sand,
    autoplace =
    {
      order = "d[ground-surface]-b[chlorine-rock]-b[cluster]",
      placement_density = 2,
      probability_expression = "selene_chlorine_rock_cluster"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/tiny-volcanic-rock-cluster/tiny-volcanic-rock-cluster-", "", 128, 8,chlorine_rock_tint,true)
  },
  scaled_cliff_crater(
  {
    mod_name = "__space-age__",
    name = "selene-crater-cliff",
    icon = "__space-age__/graphics/icons/crater-cliff.png",
    map_color = {r=144, g=119, b=87},
    subfolder = "vulcanus",
    prefix = "vulcanus-crater-section",
    scale = 1.0,
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true}},
    has_lower_layer = true,
    sprite_size_multiplier = 2,
    flags = { "placeable-off-grid", "placeable-neutral" },
    factoriopedia_simulation = simulations.factoriopedia_crater_cliff,

    crater_radius = 7, --3.5,
    crater_edge_thickness = 5,
    crater_segment_orientation_offset = 0, --1 / 16,
    --segment_probability = 1,
    autoplace =
    {
      order = "a[landscape]-a[cliff]-b[crater]",
      probability_expression = "crater_cliff"
    }
  })
}
