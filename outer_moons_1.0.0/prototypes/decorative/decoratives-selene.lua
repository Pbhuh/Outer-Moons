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

local tintable_rock_tint = {0.2588, 0.2588, 0.2588}
local chlorine_rock_tint = {0.55, 0.7, 0.45} 
local titanium_rock_tint = {.7,.7,.7}

tintable_rock_tint = combine_tint(selene_base_tint, tintable_rock_tint)
titanium_rock_tint = combine_tint(selene_base_tint, titanium_rock_tint)

function chimney_sulfuric_stateless_visualisation(position)
  return
  {
    -- expanded 2 animation layers into 2 visualisations to demo multiple visualisations
    {
      count = 1,
      render_layer = "smoke",
      offset_x = position[1],
      offset_y = position[2],
      animation =
      {
        filename = "__outer_moons__/graphics/entity/chlorine-geyser/chlorine-geyser-gas-outer.png",
        frame_count = 47,
        line_length = 16,
        width = 90,
        height = 188,
        animation_speed = 0.3,
        shift = util.by_pixel(-6, -89),
        scale = 1,
        tint = util.multiply_color({r=0.8, g=0.9, b=0.8}, 0.08)
      }
    },
    {
      count = 1,
      render_layer = "smoke",
      offset_x = position[1],
      offset_y = position[2],
      animation =
      {
         filename = "__outer_moons__/graphics/entity/chlorine-geyser/chlorine-geyser-gas-inner.png",
         frame_count = 47,
         line_length = 16,
         width = 40,
         height = 84,
         animation_speed = 0.4,
         shift = util.by_pixel(-4, -30),
         scale = 1,
         tint = util.multiply_color({r=0.8, g=0.8, b=0.8}, 0.05)
      }
    }
  }
end

function chimney_sulfuric_stateless_visualisation_tinted(position)
  return
  {
    -- expanded 2 animation layers into 2 visualisations to demo multiple visualisations
    {
      count = 1,
      render_layer = "smoke",
      offset_x = position[1],
      offset_y = position[2],
      animation =
      {
        filename = "__outer_moons__/graphics/entity/chlorine-geyser/chlorine-geyser-gas-outer.png",
        frame_count = 47,
        line_length = 16,
        width = 90,
        height = 188,
        animation_speed = 0.3,
        shift = util.by_pixel(-6, -89),
        scale = 1,
        tint = util.multiply_color({r=0.43, g=0.8, b=0.43}, 0.15)
      }
    },
    {
      count = 1,
      render_layer = "smoke",
      offset_x = position[1],
      offset_y = position[2],
      animation =
      {
         filename = "__outer_moons__/graphics/entity/chlorine-geyser/chlorine-geyser-gas-inner.png",
         frame_count = 47,
         line_length = 16,
         width = 40,
         height = 84,
         animation_speed = 0.4,
         shift = util.by_pixel(-4, -30),
         scale = 1,
         tint = util.multiply_color({r=0.5, g=0.85, b=0.5}, 0.1)
      }
    }
  }
end

function chimney_sulfuric_stateless_visualisation_faded(position)
  return
  {
    -- expanded 2 animation layers into 2 visualisations to demo multiple visualisations
    {
      count = 1,
      render_layer = "smoke",
      offset_x = position[1],
      offset_y = position[2],
      animation =
      {
        filename = "__outer_moons__/graphics/entity/chlorine-geyser/chlorine-geyser-gas-outer.png",
        frame_count = 47,
        line_length = 16,
        width = 90,
        height = 188,
        animation_speed = 0.3,
        shift = util.by_pixel(-6, -89),
        scale = 1,
        tint = util.multiply_color({r=0.43, g=0.79, b=0.43}, 0.08)
      }
    },
    {
      count = 1,
      render_layer = "smoke",
      offset_x = position[1],
      offset_y = position[2],
      animation =
      {
         filename = "__outer_moons__/graphics/entity/chlorine-geyser/chlorine-geyser-gas-inner.png",
         frame_count = 47,
         line_length = 16,
         width = 40,
         height = 84,
         animation_speed = 0.4,
         shift = util.by_pixel(-4, -30),
         scale = 1,
         tint = util.multiply_color({r=0.43, g=0.84, b=0.43}, 0.1)


      }
    }
  }
end
data:extend{
  {
    type = "noise-function",
    name = "uneven_select_range",
    parameters = {"input", "from", "from_slope", "to", "to_slope"},
    expression = "min(0, (input - from) / from_slope, (to - input) / to_slope)"
  },

  ---- CHLORINE
  {
    type = "noise-expression",
    name = "selene_chlorine_puddle",
    expression = "min(0.2, min(0.5, 3 * (selene_chlorine_region_patchy + 0.1)) - 0.6 - 0.6 * selene_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "selene_chlorine_puddle_small",
    expression = "min(0.25, min(0.5, 3 * (selene_chlorine_region_patchy + 0.15)) - 0.6 - 0.6 * selene_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "selene_chlorine_stain",
    expression = "min(0.2, min(0.5, 3 * (selene_chlorine_region_patchy + 0.1)) - 0.8 - 0.6 * selene_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "selene_chlorine_stain_small",
    expression = "max(min(0.1, selene_chlorine_region_patchy),\z
                      min(0.2, min(0.5, 3 * (selene_chlorine_region_patchy + 0.2)) - 0.4 + 0.6 * selene_decorative_knockout))"
  },
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
  -- reduce density in ashlands
  {
    type = "noise-expression",
    name = "selene_rock_huge",
    expression = "min(0.2 * (1 - 0.75 * selene_ashlands_biome), - 1.2 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + selene_rock_noise + 0.5 * selene_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "selene_rock_big",
    expression = "min(0.2 * (1 - 0.5 * selene_ashlands_biome), - 1.0 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + selene_rock_noise + 0.5 * selene_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "selene_rock_medium",
    expression = "min(0.5 * (1 - 0.5 * selene_ashlands_biome), - 0.8 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + selene_rock_noise + 0.5 * selene_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "selene_rock_cluster",
    expression = "min(0.2 * (1 - 0.5 * selene_ashlands_biome), - 0.7 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + selene_rock_noise + 0.5 * selene_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "selene_rock_small",
    expression = "min(0.6 * (1 - 0.5 * selene_ashlands_biome), - 0.6 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + selene_rock_noise + 0.5 * selene_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "selene_rock_tiny",
    expression = "min(0.75 * (1 - 0.5 * selene_ashlands_biome), - 0.5 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + selene_rock_noise + 0.5 * selene_decorative_knockout)"
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
    expression = "selene_basalts_biome * min(0.3, range_select_base(selene_elev, 0, 10, 1, -10, 1) - 0.1 - 0.25 * aux + 0.25 * (moisture - 0.6) + 0.5 * selene_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "selene_crack_decal_warm",
    expression = "selene_basalts_biome * min(0.2, range_select_base(selene_elev, 10, 30, 1, -10, 1) - 0.1 - 0.25 * aux + 0.25 * (moisture - 0.6) + 0.5 * selene_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "selene_rock_decal_large",
    expression = "min(0.1, range_select_base(selene_elev, 20, 50, 1, -10, 1) - 0.6 + 0.25 * aux + 0.25 * (moisture - 0.6) + 0.5 * selene_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "pumice_relief_decal", -- everywhere non-sand
    expression = "(aux + moisture - 1) * 0.01"
  },
  {
    type = "noise-expression",
    name = "waves_decal", -- everywhere sand
    expression = "(1 - aux - moisture) * 0.05 * place_every_n(5.7,5.7,1,1) * selene_ashlands_biome"
  },

  {
    type = "noise-expression",
    name = "selene_sand_decal",
    expression = "(1 - aux - moisture) * 0.05 * selene_basalts_biome"
  },
  {
    type = "noise-expression",
    name = "selene_dune_decal",
    expression = "(1 - aux - moisture) * 0.05 * selene_ashlands_biome"
  },

  {
    type = "noise-expression",
    name = "crater_small",
    expression = "min(0.1, 0.3 - selene_rock_noise - aux)"
  },
  {
    type = "noise-expression",
    name = "crater_large",
    expression = "min(0.15, (0.2 - selene_rock_noise - aux) * place_every_n(3,3,0,0))"
  },
  {
    type = "noise-expression",
    name = "crater_cliff",
    expression = "0.5 * (selene_rock_noise + 0.5 * aux - 0.5 * moisture) * (1 - max(selene_basalts_biome,selene_ashlands_biome)) * place_every_n(21,21,0,0)"
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
  --- Chlorine STAINS
  {
    name = "chlorine-stain",
    type = "optimized-decorative",
    order = "a[selene]-b[decorative]",
    collision_box = {{-3, -3}, {3, 3}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -6,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-c[stain]-b[calcite]-a[large]",
      probability_expression = "selene_chlorine_stain"
    },
    pictures = get_decal_pictures("__outer_moons__/graphics/decorative/chlorine-stain/chlorine-stain-", "", 512,13)
  },
  --- SPOTTY chlorine STAINS
  {
    name = "chlorine-stain-small",
    type = "optimized-decorative",
    order = "a[selene]-b[decorative]",
    collision_box = {{-3, -3}, {3, 3}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -6,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-c[stain]-a[sulfur]-b[small]",
      probability_expression = "selene_chlorine_stain_small"
    },
    pictures = get_decal_pictures("__outer_moons__/graphics/decorative/chlorine-stain/chlorine-stain-spotty-", "", 512, 21)
  },
  --- chlorine-PUDDLE
  {
    name = "chlorine-puddle",
    type = "optimized-decorative",
    order = "a[selene]-b[decorative]",
    collision_box = {{-2, -2}, {2, 2}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = 254,
    walking_sound = sounds.oil,
    autoplace =
    {
      order = "d[ground-surface]-a[puddle]-a[large]",
      placement_density = 2,
      probability_expression = "selene_chlorine_puddle"
    },
    pictures = get_decal_pictures("__outer_moons__/graphics/decorative/chlorine-puddle/chlorine-puddle-", "", 384, 8)
  },
  --- chlorine-PUDDLE-SMALL
  {
    name = "chlorine-puddle-small",
    type = "optimized-decorative",
    order = "a[selene]-b[decorative]",
    collision_box = {{-1, -1}, {1, 1}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = 254,
    walking_sound = sounds.oil,
    autoplace =
    {
      order = "d[ground-surface]-a[puddle]-b[small]",
      placement_density = 2,
      probability_expression = "selene_chlorine_puddle_small"
    },
    pictures = get_decal_pictures("__outer_moons__/graphics/decorative/chlorine-puddle/chlorine-puddle-small-", "", 192, 4)
  },
  --- SMALL CRATERS
  {
    name = "crater-small",
    type = "optimized-decorative",
    order = "a[selene]-b[decorative]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-e[crater]-a[small]",
      probability_expression = "crater_small"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-crater/vulcanus-crater-", "", 128, 20)
  },
  --- LARGE CRATERS
  {
    name = "crater-large",
    type = "optimized-decorative",
    order = "a[selene]-b[decorative]",
    collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-e[crater]-a[large]",
      probability_expression = "crater_large"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-crater/vulcanus-crater-", "huge-", 512, 14)
  },
  --- ROCKY DETAIL
  {
    name = "pumice-relief-decal",
    type = "optimized-decorative",
    order = "a[selene]-b[decorative]",
    collision_box = {{-5, -5}, {5, 5}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = 220,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-d[relief]-b[rocky]",
      probability_expression = "pumice_relief_decal"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-relief-decal/vulcanus-pumice-relief-", "", 1024, 19)
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
      probability_expression = "selene_sand_decal"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-sand-decal/vulcanus-sand-decal-", "", 256, 23)
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
      probability_expression = "selene_dune_decal"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-dune-decal/vulcanus-dune-decal-", "", 512, 20)
  },
  --- WAVES
  {
    name = "waves-decal",
    type = "optimized-decorative",
    order = "a[selene]-b[decorative]",
    collision_box = {{-8, -8}, {8, 8}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = 220,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-d[relief]-a[waves]",
      probability_expression = "waves_decal"
    },
    pictures = {
      {
        filename =  "__space-age__/graphics/decorative/waves-relief/waves-01.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      },
      {
        filename =  "__space-age__/graphics/decorative/waves-relief/waves-02.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      },
      {
        filename =  "__space-age__/graphics/decorative/waves-relief/waves-03.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      },
      {
        filename =  "__space-age__/graphics/decorative/waves-relief/waves-04.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      },
      {
        filename =  "__space-age__/graphics/decorative/waves-relief/waves-05.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      },
      {
        filename =  "__space-age__/graphics/decorative/waves-relief/waves-06.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      },
      {
        filename =  "__space-age__/graphics/decorative/waves-relief/waves-07.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      },
      {
        filename =  "__space-age__/graphics/decorative/waves-relief/waves-08.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      }
    }
  },
  --- TINTABLE ROCKS
  --- BIG ROCKS
  {
    name = "huge-volcanic-rock",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__space-age__/graphics/icons/huge-volcanic-rock.png",
    subgroup = "grass",
    order = "b[decorative]-l[rock]-f[huge-volcanic-rock]",
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
        {type = "item", name = "iron-ore", amount_min = 9, amount_max = 27},
        {type = "item", name = "copper-ore", amount_min = 6, amount_max = 18},
        {type = "item", name = "titanium-ore", amount_min = 3, amount_max = 15}
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
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-06.png",
        width = 233,
        height = 171,
        scale = 0.5,
        shift = {0.429688, 0.046875},
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-07.png",
        width = 240,
        height = 192,
        scale = 0.5,
        shift = {0.398438, 0.03125},
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-08.png",
        width = 219,
        height = 175,
        scale = 0.5,
        shift = {0.148438, 0.132812},
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-09.png",
        width = 240,
        height = 208,
        scale = 0.5,
        shift = {0.3125, 0.0625},
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-10.png",
        width = 243,
        height = 190,
        scale = 0.5,
        shift = {0.1875, 0.046875},
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-11.png",
        width = 249,
        height = 185,
        scale = 0.5,
        shift = {0.398438, 0.0546875},
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-12.png",
        width = 273,
        height = 163,
        scale = 0.5,
        shift = {0.34375, 0.0390625},
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-13.png",
        width = 275,
        height = 175,
        scale = 0.5,
        shift = {0.273438, 0.0234375},
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-14.png",
        width = 241,
        height = 215,
        scale = 0.5,
        shift = {0.195312, 0.0390625},
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-15.png",
        width = 318,
        height = 181,
        scale = 0.5,
        shift = {0.523438, 0.03125},
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-16.png",
        width = 217,
        height = 224,
        scale = 0.5,
        shift = {0.0546875, 0.0234375},
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-17.png",
        width = 332,
        height = 228,
        scale = 0.5,
        shift = {0.226562, 0.046875},
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-18.png",
        width = 290,
        height = 243,
        scale = 0.5,
        shift = {0.195312, 0.0390625},
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-19.png",
        width = 349,
        height = 225,
        scale = 0.5,
        shift = {0.609375, 0.0234375},
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-20.png",
        width = 287,
        height = 250,
        scale = 0.5,
        shift = {0.132812, 0.03125},
        tint = titanium_rock_tint
      }
    }
  },
  {
    name = "big-volcanic-rock",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__space-age__/graphics/icons/big-volcanic-rock.png",
    subgroup = "grass",
    order = "b[decorative]-l[rock]-f[big-volcanic-rock]",
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
        {type = "item", name = "stone", amount_min = 2, amount_max = 12},
        {type = "item", name = "iron-ore", amount_min = 5, amount_max = 9},
        {type = "item", name = "copper-ore", amount_min = 3, amount_max = 7},
        {type = "item", name = "titanium-ore", amount_min = 2, amount_max = 8}
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
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-02.png",
        width =  195 ,
        height =  135 ,
        shift = {0.0, 0.0390625},
        scale = 0.5,
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-03.png",
        width =  205 ,
        height =  132 ,
        shift = {0.151562, 0.0},
        scale = 0.5,
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-04.png",
        width =  144 ,
        height =  142 ,
        shift = {0.151562, 0.0},
        scale = 0.5,
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-05.png",
        width =  130 ,
        height =  107 ,
        shift = {0.390625, 0.0},
        scale = 0.5,
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-06.png",
        width =  165 ,
        height =  109 ,
        shift = {0.328125, 0.0703125},
        scale = 0.5,
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-07.png",
        width =  150 ,
        height =  133 ,
        shift = {0.16875, -0.1},
        scale = 0.5,
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-08.png",
        width =  156 ,
        height =  111 ,
        shift = {0.3, -0.2},
        scale = 0.5,
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-09.png",
        width =  187 ,
        height =  120 ,
        shift = {0.0, 0.0},
        scale = 0.5,
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-10.png",
        width =  225 ,
        height =  128 ,
        shift = {0.1, 0.0},
        scale = 0.5,
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-11.png",
        width =  183 ,
        height =  144 ,
        shift = {0.325, -0.1},
        scale = 0.5,
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-12.png",
        width =  158 ,
        height =  138 ,
        shift = {0.453125, 0.0},
        scale = 0.5,
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-13.png",
        width =  188 ,
        height =  150 ,
        shift = {0.539062, -0.015625},
        scale = 0.5,
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-14.png",
        width =  186 ,
        height =  160 ,
        shift = {0.0703125, 0.179688},
        scale = 0.5,
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-15.png",
        width =  181 ,
        height =  174 ,
        shift = {0.160938, 0.0},
        scale = 0.5,
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-16.png",
        width =  212 ,
        height =  150 ,
        shift = {0.242188, -0.195312},
        scale = 0.5,
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-17.png",
        width =  155 ,
        height =  117 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-18.png",
        width =  141 ,
        height =  128 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-19.png",
        width =  176 ,
        height =  114 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = titanium_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/big-volcanic-rock/big-volcanic-rock-20.png",
        width =  120 ,
        height =  125 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = titanium_rock_tint
      }
    }
  },
  --- MEDIUM BLACK ROCKS
  {
    name = "medium-volcanic-rock",
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
    name = "small-volcanic-rock",
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
    name = "tiny-volcanic-rock",
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
  --- ROCK CLUSTERS
  {
    name = "tiny-rock-cluster",
    type = "optimized-decorative",
    order = "a[selene]-b[decorative]-b[sand]",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    collision_mask = {layers={water_tile=true, doodad=true}, colliding_with_tiles_only=true},
    render_layer = "decorative",
    walking_sound = sounds.sand,
    autoplace =
    {
      order = "d[ground-surface]-i[rock]-c[cluster]",
      placement_density = 2,
      probability_expression = "selene_rock_cluster"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/tiny-volcanic-rock-cluster/tiny-volcanic-rock-cluster-", "", 128, 8,tintable_rock_tint,true)
  },
  --- SULFUR ROCKS
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
  {
    type = "optimized-decorative",
    name = "selene-lava-fire",
    order = "b[effect]-l[fire]-h[selene-lava-fire]",
    collision_box = {{-1, -1}, {1, 1}},
    collision_mask = {layers={ground_tile=true}, colliding_with_tiles_only=true},
    autoplace =
    {
      order = "d[ground-surface]-k[lava]",
      probability_expression = "0.1 * (selene_elev <= 0) * (selene_elev > 2)\z
                                + 0.005 * min(1, max(lava_mountains_range, lava_hot_mountains_range))"
    },
    pictures =
    {
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-01.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  21,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.0,
        shift = {0.0, 0.0}
      }
    },
    stateless_visualisation =
    {
      min_count = 1,
      max_count = 1,
      offset_x = { -0.05, 0.05 }, -- will be random from range -0.05 to 0.05
      offset_y = { -0.05, 0.05 },
      render_layer = "object",
      adjust_animation_speed_by_base_scale = false,
      scale = { 0.6, 1 },
      animation =
      {
        {
          filename = "__base__/graphics/entity/fire-flame/fire-flame-04.png",
          line_length = 10,
          width = 84,
          height = 94,
          frame_count = 90,
          animation_speed = 0.2,
          scale = 0.75,
          tint = {r=0.9,g=0.9,b=0.9,a=0.5},
          shift = { 0, -0.25 },
          draw_as_glow = true
        }
      },
      nested_visualisations =
      {
        {
          count = 10,
          period = 120,
          particle_tick_offset = 120 / 30, -- offsets start of the simulation interval from the previous particle for each particle
          probability = 0.5,
          scale = { 0.5, 1 },
          begin_scale = 0.5,
          end_scale = 1.5,

          offset_x = { -0.2, 0.2 },
          offset_y = { -0.2, 0.2 },

          speed_x = { -1 / 240, 1 / 240 },
          speed_y = { -1 / 240, 0 / 240 },
          speed_z = 8 / 240,

          movement_slowdown_factor_z = 0.985,

          render_layer = "smoke",
          affected_by_wind = true,

          fade_in_progress_duration = 0.2 / 3,
          fade_out_progress_duration = 0.8 / 3,

          animation =
          {
            width = 253,
            height = 210,
            line_length = 8,
            frame_count = 60,
            scale = 0.25,
            tint = {r = 0.1, g = 0.08, b = 0.06, a = 0.1}, --util.premul_color{0.3, 0.3, 0.3, 0.1},
            priority = "high",
            flags = { "smoke" },
            animation_speed = 0.1,
            filename = "__base__/graphics/entity/fire-smoke/fire-smoke.png",
          }
        },
      }
    }
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
