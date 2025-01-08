local tile_trigger_effects = require("__space-age__/prototypes/tile/tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local tile_lightening = 28
mefitis_tile_offset = 40
--- max tile layer on nauvis is 33(nuclear_ground), this should generally be above that. Conctrete starts at 100, which this should not be above

local rugged_stone_sound = sound_variations("__space-age__/sound/walking/rugged-stone", 10, 0.8)
local rocky_stone_sound = sound_variations("__space-age__/sound/walking/rocky-stone", 10, 0.8)
local soft_sand_sound = sound_variations("__space-age__/sound/walking/soft-sand", 10, 1)
local warm_stone_sound = sound_variations("__space-age__/sound/walking/warm-stone", 10, 1)
local stone_driving_sound =
{
  sound =
  {
    filename = "__base__/sound/driving/vehicle-surface-stone.ogg", volume = 0.8,
    advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0 }}}}
  },
  fade_ticks = 6
}
local sand_driving_sound =
{
  sound =
  {
    filename = "__base__/sound/driving/vehicle-surface-sand.ogg", volume = 0.8,
    advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0 }}}}
  },
  fade_ticks = 6
}

local lava_patch =
{
  filename = "__space-age__/graphics/terrain/water-transitions/lava-patch.png",
  scale = 0.5,
  width = 64,
  height = 64
}

local lava_stone_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-cold.png",
    layout = tile_spritesheet_layout.transition_16_16_16_4_4,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 2,
      o_transition_count = 1
    }
  },
  {
    to_tiles = lava_tile_type_names,
    transition_group = lava_transition_group_id,
    spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone.png",
    lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-lightmap.png" },
     -- this added the lightmap spritesheet
    layout = tile_spritesheet_layout.transition_16_16_16_4_4,
    lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-lightmap.png" },
     -- this added the lightmap spritesheet
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 2,
      o_transition_count = 1
    }
  },
  {
    to_tiles = {"out-of-map","empty-space","oil-ocean-shallow"},
    transition_group = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/volcanic-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_4_4_8_1_1,
    overlay_enabled = false
  }
}

local lava_stone_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-cold-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
      o_transition_count = 0
    },
    water_patch = lava_patch
  },

  {
    transition_group1 = water_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/lava-stone-cold-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
      o_transition_count = 0
    }
  },

  {
    transition_group1 = default_transition_group_id,
    transition_group2 = lava_transition_group_id,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
      o_transition_count = 0
    },
    water_patch = lava_patch
  },

  {
    transition_group1 = lava_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/lava-stone-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
      o_transition_count = 0
    }
  },
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/volcanic-out-of-map-transition-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    overlay_enabled = false
  }
}

local lava_to_out_of_map_transition =
{
  to_tiles = out_of_map_tile_type_names,
  transition_group = out_of_map_transition_group_id,

  overlay_layer_group = "zero",
  apply_effect_color_to_overlay = true,
  background_layer_offset = 1,
  background_layer_group = "zero",
  offset_background_layer_by_tile_layer = true,

  spritesheet = "__base__/graphics/terrain/out-of-map-transition/water-out-of-map-transition-tintable.png",
  layout = tile_spritesheet_layout.transition_4_4_8_1_1,
  background_enabled = false,

  apply_waving_effect_on_masks = true,
  waving_effect_time_scale = 0.005,
  mask_layout =
  {
    spritesheet = "__base__/graphics/terrain/masks/water-edge-transition.png",
    count = 1,
    double_side_count = 0,
    scale = 0.5,
    outer_corner_x = 64,
    side_x = 128,
    u_transition_x = 192,
    o_transition_x = 256,
    y = 0
  }
}

local destroyed_item_trigger =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    source_effects =
    {
      type = "create-trivial-smoke",
      smoke_name = "smoke",
      offset_deviation = {{-0.1, -0.1}, {0.1, 0.1}},
      starting_frame_deviation = 5
    }
  }
}

space_age_tiles_util.lava_to_out_of_map_transition = lava_to_out_of_map_transition
space_age_tiles_util.lava_stone_transitions_between_transitions = lava_stone_transitions_between_transitions

local function transition_masks()
  return {
    mask_spritesheet = "__base__/graphics/terrain/masks/transition-1.png",
    mask_layout =
    {
      scale = 0.5,
      inner_corner =
      {
        count = 8,
      },
      outer_corner =
      {
        count = 8,
        x = 64*9
      },
      side =
      {
        count = 8,
        x = 64*9*2
      },
      u_transition =
      {
        count = 1,
        x = 64*9*3
      },
      o_transition =
      {
        count = 1,
        x = 64*9*4
      }
    }
  }
end

--define ranges for all tilesets. Having these as thier own expressions helps with debugging and also modifying things like decorative placement
data:extend
{
  {
    type = "noise-expression",
    name = "mefitis_metal_tile",
    expression = "max(0, mefitis_iridium_ore_probability)"
  },
  ---- LAVA
  {
    type = "noise-expression",
    name ="lava_spawn_excluder",
    expression = "distance > 10"
  },
  {
    type = "noise-expression",
    name ="mefitis_basalts_range",
    expression = "100 * min(mefitis_basalts_biome * lava_spawn_excluder\z
                            * range_select_base(mefitis_elev, -5000, 0, 1, -1000, 1),\z
                            100 * (1 - mefitis_metal_tile))"
  },
  {
    type = "noise-expression",
    name ="lava_mountains_range",
    expression = "600 * range_select_base(mountain_lava_spots, 0.15, 10, 1, 0, 1)"
  },
  {
    type = "noise-expression",
    name ="lava_hot_mountains_range",
    expression = "500 * range_select_base(mountain_lava_spots, 0.05, 0.3, 1, 0, 1)"
  },

  ---- BASALTS
  -- aux controls rocky outcrop pounts.
  -- high-medium aux is cracks
  -- low aux is smooth
  -- hotter is lower elevation
  {
    type = "noise-expression",
    name ="volcanic_cracks_hot_range",
    expression = "mefitis_basalts_biome * range_select_base(mefitis_elev, 0, 8, 1, 0, 20)"
  },
  {
    type = "noise-expression",
    name ="volcanic_cracks_warm_range",
    expression = "mefitis_basalts_biome * range_select_base(mefitis_elev, 8, 22, 1, 0, 5)\z
                  + (aux - 0.05)\z
                  + 50000 * mefitis_metal_tile"
  },
  {
    type = "noise-expression",
    name = "volcanic_cracks_cold_range",
    expression = "(0.5 - mefitis_ashlands_biome) * range_select_base(mefitis_elev, 20, 100, 1, 0, 1)\z
                  + (aux - 0.3)"
  },
  {
    type = "noise-expression",
    name = "volcanic_smooth_stone_warm_range",
    expression = "mefitis_basalts_biome * range_select_base(mefitis_elev, 8, 20, 1, 0, 5)\z
                  - (aux - 0.05)\z
                  + 50000 * mefitis_metal_tile"
  },
  {
    type = "noise-expression",
    name = "volcanic_smooth_stone_range",
    expression = "(0.5 - mefitis_ashlands_biome) * range_select_base(mefitis_elev, 20, 100, 1, 0, 1)\z
                  - (aux - 0.3)"
  },

  -- MOUNTAINS
  -- lumps (jagged/cold folded) are on high aux.
  -- depression channels (hot folded, soil) are low aux.
  -- folded is higher up the mountain.
  -- hot folded is closest to the center.
  -- jagged ground identifies rocky peacks and resource patches.
  -- flat folded ix between extremes
  {
    type = "noise-expression",
    name = "volcanic_folds_flat_range",
    expression = "2 * (mefitis_mountains_biome - 0.5) - 0.15 * mountain_volcano_spots"
  },
  {
    type = "noise-expression",
    name = "volcanic_folds_range",
    expression = "2 * (mefitis_mountains_biome - 0.5) + (aux - 0.5) + 0.5 * (mountain_volcano_spots - 0.1)"

  },
  {
    type = "noise-expression",
    name = "volcanic_folds_warm_range",
    expression = "2 * (mefitis_mountains_biome - 0.5) + 3 * (mountain_volcano_spots - 0.85) - 2 * (aux - 0.5)"
  },
  {
    type = "noise-expression",
    name ="volcanic_jagged_ground_range",
    -- volcano peak circle is expected to be 1020 to 1030, The cliff is at 1020
    expression = "5 * min(10, max(mefitis_mountains_biome + 0.2,\z
                                  range_select_base(mefitis_elev, 1010, 2000, 2, -10, 1) + 3 * (aux - 0.5)))"
  },
  {
    type = "noise-expression",
    name ="volcanic_soil_light_range_mountains",
    expression = "min(0.8, 4 * (mefitis_mountains_biome - 0.25)) - 0.35 * mountain_volcano_spots - 3 * (aux - 0.2)"
  },
  {
    type = "noise-expression",
    name ="volcanic_soil_dark_range_mountains",
    expression = "min(0.8, 4 * (mefitis_mountains_biome - 0.25)) - 0.35 * mountain_volcano_spots - 1 * (aux - 0.5)"
  },

  -- Ashlands
  -- Low aux low moisture is ash
  -- Low aux high moisture is trees & grass.
  -- High aux low moisture is chimneys and rocks.
  -- High aux high moisture is rocks with pita
  {
    type = "noise-expression",
    name = "volcanic_ash_flats_range",
    expression = "2 * (mefitis_ashlands_biome - 0.5)\z
                  - 1.5 * (aux - 0.25)\z
                  - 1.5 * (moisture - 0.6)"
  },
  {
    type = "noise-expression",
    name = "volcanic_ash_light_range",
    expression = "2 * (mefitis_ashlands_biome - 0.5)\z
                  - 1.5 * (moisture - 0.6)"
  },
  {
    type = "noise-expression",
    name = "volcanic_ash_dark_range",
    expression = "min(1, 4 * (mefitis_ashlands_biome - 0.25))\z
                  + max(-1.5 * (aux - 0.25),\z
                        0.01 - 1.5 * abs(aux - 0.5) - 1.5 * (moisture - 0.66))"
    -- the last part is an axtra line blending ash cracks to light ash
  },
  {
    type = "noise-expression",
    name = "volcanic_pumice_stones_range",
    expression = "2 * (mefitis_ashlands_biome - 0.5)\z
                  + 1.5 * (aux - 0.5)\z
                  + 1.5 * (moisture - 0.66)"
  },
  {
    type = "noise-expression",
    name = "volcanic_ash_cracks_range",
    expression = "min(1, 4 * (mefitis_ashlands_biome - 0.25))\z
                  + 1.5 * (aux - 0.5)\z
                  - 1.5 * (moisture - 0.66)"
  },
  {
    type = "noise-expression",
    name = "volcanic_ash_soil_range",
    expression = "2 * (mefitis_ashlands_biome - 0.5)"
  },
  {
    type = "noise-expression",
    name = "volcanic_soil_light_range_ashlands",
    expression = "2 * (mefitis_ashlands_biome - 0.5)\z
                  + 1.5 * (moisture - 0.8)"
  },
  {
    type = "noise-expression",
    name = "volcanic_soil_dark_range_ashlands",
    expression = "2 * (mefitis_ashlands_biome - 0.5)\z
                  - 1.5 * (aux - 0.25)\z
                  + 1.5 * (moisture - 0.8)"
  },

  -- COMBINE SHARED
  {
    type = "noise-expression",
    name = "volcanic_soil_light_range",
    expression = "max(volcanic_soil_light_range_mountains, volcanic_soil_light_range_ashlands, 10 * (mefitis_chlorine_region_patchy + 0.2))"
  },
  {
    type = "noise-expression",
    name = "volcanic_soil_dark_range",
    expression = "max(volcanic_soil_dark_range_mountains, volcanic_soil_dark_range_ashlands)"
  },
  ----------- CLIFF TILE
  
  ----------- "SHALLOW" LAVA
  {
    type = "tile",
    name = "lava-caldera",
    subgroup = "mefitis-tiles",
    order = "e-b",
    collision_mask = tile_collision_masks.lava(),
    autoplace =
    {
      probability_expression = "lava_mountains_range"
    },
    effect = "cryolava-2",
    fluid = "lava",
    effect_color = { 255, 179, 50 },
    effect_color_secondary = { 181, 85, 41 },
    particle_tints = tile_graphics.lava_particle_tints,
    destroys_dropped_items = true,
    default_destroyed_dropped_item_trigger = destroyed_item_trigger,
    layer = 6,
    layer_group = "water-overlay",
    sprite_usage_surface = "space",
    variants = tile_variations_template(
      "__outer_moons__/graphics/terrain/lava-caldera.png",
      "__base__/graphics/terrain/masks/transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    allowed_neighbors={"lava-caldera-hot"},
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = data.raw.tile["water"].walking_sound,
    map_color = {r = 150, g = 49, b = 30},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
    trigger_effect = tile_trigger_effects.hot_lava_trigger_effect(),
    default_cover_tile = "foundation",
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/tiles/lava", 10, 0.5 ),
        advanced_volume_control =
        {
          fades = { fade_in = { curve_type = "cosine", from = { control = 0.5, volume_percentage = 0.0 }, to = { 1.5, 100.0 } } }
        }
      },
      radius = 7.5,
      min_entity_count = 10,
      max_entity_count = 30,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 3
    }
  },
  ----------- "DEEP" LAVA
  {
    type = "tile",
    name = "lava-caldera-hot",
    order = "e-a",
    subgroup = "mefitis-tiles",
    collision_mask = tile_collision_masks.lava(),
    autoplace =
    {
      probability_expression = "lava_hot_mountains_range"
    },
    effect = "cryolava",
    fluid = "lava",
    effect_color = { 255, 179, 50 },
    effect_color_secondary = { 181, 85, 41 },
    particle_tints = tile_graphics.lava_particle_tints,
    destroys_dropped_items = true,
    default_destroyed_dropped_item_trigger = destroyed_item_trigger,
    layer = 5,
    layer_group = "water",
    sprite_usage_surface = "space",
    variants =
      {
        main =
        {
          {
            picture = "__outer_moons__/graphics/terrain/lava-caldera-hot.png",
            count = 1,
            scale = 0.5,
            size = 1
          }
        },
      empty_transitions=true,
    },
    allowed_neighbors={"lava-caldera"},
    transitions = {lava_to_out_of_map_transition},
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = data.raw.tile["water"].walking_sound,
    map_color = {r = 255, g = 138, b = 57},
    absorptions_per_second = tile_pollution.lava,
    default_cover_tile = "foundation",
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/tiles/magma", 10, 0.7 ),
        advanced_volume_control =
        {
          fades = { fade_in = { curve_type = "cosine", from = { control = 0.5, volume_percentage = 0.0 }, to = { 1.5, 100.0 } } }
        }
      },
      radius = 7.5,
      min_entity_count = 10,
      max_entity_count = 30,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 3
    }
  },
  
  ----------- SULFUR OCEAN
  {
    name = "sulfur_ocean",
    type = "tile",
    order = "f-a",
    subgroup = "mefitis-tiles",
    collision_mask = tile_collision_masks.lava(),
    autoplace = {probability_expression = "max(mefitis_basalts_range, volcanic_cracks_hot_range) + max(volcanic_cracks_warm_range, volcanic_cracks_cold_range) + max(0, volcanic_smooth_stone_warm_range)"},
    layer = 20,
    layer_group = "water",
    map_color = { 217, 160, 40},
    walking_speed_modifier = 0.5,
    vehicle_friction_modifier = 10,
    default_cover_tile = "foundation",
    absorptions_per_second = tile_pollution.water,
    fluid = "arsenic-solution",
    effect = "sulfur_ocean",
    effect_color = { 254, 216, 106 },
    effect_color_secondary = { 240, 171, 134 },
    particle_tints = tile_graphics.fulgora_oil_ocean_particle_tints,
    sprite_usage_surface = "space",
    variants = tile_variations_template_with_transitions(
      "__outer_moons__/graphics/terrain/sulfur-ocean.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
	transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    --transitions = table.deepcopy(data.raw.tile["water-shallow"].transitions),
    --transitions_between_transitions = table.deepcopy(data.raw.tile["water-shallow"].transitions_between_transitions),
    walking_sound = sound_variations("__space-age__/sound/walking/oil-deep", 10, 0.35, volume_multiplier("main-menu", 2.9)),
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/tiles/oil-gloop", 10, 0.15),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "S-curve", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 10,
      max_entity_count = 30,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 15
    },
    landing_steps_sound = sound_variations("__base__/sound/walking/resources/oil", 7, 1, volume_multiplier("main-menu", 2.9)),
    trigger_effect = tile_trigger_effects.water_trigger_effect(),
  },
  ----- ocean effect
  {
    type = "tile-effect",
    name = "sulfur_ocean",
    shader = "water",
    water =
    {
      shader_variation = "oil",
      textures =
      {
        {
          filename = "__space-age__/graphics/terrain/oilNoise.png",
          width = 512,
          height = 512
        },
        {
          filename = "__space-age__/graphics/terrain/oil-ocean-deep-shader.png",
          width = 512 * 4,
          height = 512 * 2
        },
        --gradient map for thin film effect
        {
          filename = "__space-age__/graphics/terrain/oilGradient.png",
          width = 512,
          height = 32
        },
        --specular highligts
        {
          filename = "__space-age__/graphics/terrain/oil-ocean-deep-spec.png",
          width = 512 * 4,
          height = 512 * 2
        },
      },
      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 4,
      secondary_texture_variations_rows = 2,

      specular_lightness = { 3, 3, 3 },
      foam_color = {185,145,100}, -- #4e3838ff,
      foam_color_multiplier = 0.1,

      animation_speed = 1.500,
      animation_scale = {3, 3},

      dark_threshold = {1.000, 1.000},
      reflection_threshold = {5.00, 5.00},
      specular_threshold = {0.000, 0.000},
      tick_scale = 1.000,

      near_zoom = 0.063,
      far_zoom = 0.063,
    }
  },
  {
    type = "tile-effect",
    name = "cryolava",
    shader = "water",
    water =
    {
      shader_variation = "lava",
      textures =
      {
        {
          filename = "__space-age__/graphics/terrain/vulcanus/lava-textures/lava-noise-texture.png",
          width = 512,
          height = 512
        },
        {
          filename = "__outer_moons__/graphics/terrain/cryolava.png",
          width = 512 * 4,
          height = 512 * 2
        }
      },
      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 4,
      secondary_texture_variations_rows = 2,

      animation_speed = 1.5,
      animation_scale = { 0.7, 0.7 },
      tick_scale = 1,

      specular_lightness = { 22, 51, 17},
      foam_color = { 59, 30, 9},
      foam_color_multiplier = 1.3,

      dark_threshold = { 0.755, 0.755 },
      reflection_threshold = { 1, 1 },
      specular_threshold = { 0.889, 0.291 },

      near_zoom = 1 / 16,
      far_zoom = 1 / 16
    }
  },
  {
    type = "tile-effect",
    name = "cryolava-2",
    shader = "water",
    water =
    {
      shader_variation = "lava",
      textures =
      {
        {
          filename = "__space-age__/graphics/terrain/vulcanus/lava-textures/lava-noise-texture.png",
          width = 512,
          height = 512
        },
        {
          filename = "__outer_moons__/graphics/terrain/coastal-cryolava.png",
          width = 512 * 4,
          height = 512 * 2
        }
      },
      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 4,
      secondary_texture_variations_rows = 2,

      animation_speed = 1.5,
      animation_scale = { 0.75, 0.75 },
      tick_scale = 1,

      specular_lightness = { 30, 48, 22 },
      foam_color = { 73, 5, 5 },
      foam_color_multiplier = 1,

      dark_threshold = { 0.755, 0.755 },
      reflection_threshold = { 1, 1 },
      specular_threshold = { 0.889, 0.291 },

      near_zoom = 1 / 16,
      far_zoom = 1 / 16
    }
  },
  
  ----------- RED DIRT
  {
		name = "mefitis-dust-1",
		type = "tile",
		order = "b[natural]-a[dust]",
		subgroup = "mefitis-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
		  probability_expression = "volcanic_smooth_stone_warm_range"
		},
		layer = 5,
		map_color={120, 120, 120},
		vehicle_friction_modifier = 4,
		sprite_usage_surface = "space",
		variants = tile_variations_template_with_transitions(
		  "__outer_moons__/graphics/terrain/mineral-red-dirt-1.png",
		  {
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		  }
		),
		transitions = lava_stone_transitions,
		transitions_between_transitions = lava_stone_transitions_between_transitions,
		walking_sound = sound_variations("__space-age__/sound/walking/soft-sand", 9, 0.6, volume_multiplier("main-menu", 2.9)),
		landing_steps_sound = tile_sounds.landing.sand,
		driving_sound = sand_driving_sound,
		ambient_sounds = sand_ambient_sound,
		scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
		-- trigger_effect = tile_trigger_effects.sand_trigger_effect()
	},
	{
		name = "mefitis-dust-2",
		type = "tile",
		order = "b[natural]-b[dust]",
		subgroup = "mefitis-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
		  probability_expression = "volcanic_ash_cracks_range"
		},
		layer = 6,
		map_color={130, 130, 130},
		vehicle_friction_modifier = 4,
		sprite_usage_surface = "space",
		variants = tile_variations_template_with_transitions(
		  "__outer_moons__/graphics/terrain/mineral-red-dirt-2.png",
		  {
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		  }
		),
		transitions = lava_stone_transitions,
		transitions_between_transitions = lava_stone_transitions_between_transitions,
		walking_sound = sound_variations("__space-age__/sound/walking/soft-sand", 9, 0.6, volume_multiplier("main-menu", 2.9)),
		landing_steps_sound = tile_sounds.landing.sand,
		driving_sound = sand_driving_sound,
		ambient_sounds = sand_ambient_sound,
		scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
		-- trigger_effect = tile_trigger_effects.sand_trigger_effect()
	},
	{
		name = "mefitis-dust-3",
		type = "tile",
		order = "b[natural]-c[dust]",
		subgroup = "mefitis-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
		  probability_expression = "volcanic_folds_range"
		},
		layer = 6,
		map_color={110, 110, 110},
		vehicle_friction_modifier = 4,
		sprite_usage_surface = "space",
		variants = tile_variations_template_with_transitions(
		  "__outer_moons__/graphics/terrain/mineral-red-dirt-3.png",
		  {
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		  }
		),
		transitions = lava_stone_transitions,
		transitions_between_transitions = lava_stone_transitions_between_transitions,
		walking_sound = sound_variations("__space-age__/sound/walking/soft-sand", 9, 0.6, volume_multiplier("main-menu", 2.9)),
		landing_steps_sound = tile_sounds.landing.sand,
		driving_sound = sand_driving_sound,
		ambient_sounds = sand_ambient_sound,
		scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
		-- trigger_effect = tile_trigger_effects.sand_trigger_effect()
	},
	{
		name = "mefitis-dust-4",
		type = "tile",
		order = "b[natural]-d[dust]",
		subgroup = "mefitis-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
		  probability_expression = "volcanic_folds_warm_range"
		},
		layer = 7,
		map_color={100, 100, 100},
		vehicle_friction_modifier = 4,
		sprite_usage_surface = "space",
		variants = tile_variations_template_with_transitions(
		  "__outer_moons__/graphics/terrain/mineral-red-dirt-4.png",
		  {
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		  }
		),
		transitions = lava_stone_transitions,
		transitions_between_transitions = lava_stone_transitions_between_transitions,
		walking_sound = sound_variations("__space-age__/sound/walking/soft-sand", 9, 0.6, volume_multiplier("main-menu", 2.9)),
		landing_steps_sound = tile_sounds.landing.sand,
		driving_sound = sand_driving_sound,
		ambient_sounds = sand_ambient_sound,
		scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
		-- trigger_effect = tile_trigger_effects.sand_trigger_effect()
	},
	{
		name = "mefitis-dust-5",
		type = "tile",
		order = "b[natural]-e[dust]",
		subgroup = "mefitis-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
		  probability_expression = "volcanic_soil_dark_range"
		},
		layer = 8,
		map_color={90, 90, 90},
		vehicle_friction_modifier = 4,
		sprite_usage_surface = "space",
		variants = tile_variations_template_with_transitions(
		  "__outer_moons__/graphics/terrain/mineral-red-dirt-5.png",
		  {
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		  }
		),
		transitions = lava_stone_transitions,
		transitions_between_transitions = lava_stone_transitions_between_transitions,
		walking_sound = sound_variations("__space-age__/sound/walking/soft-sand", 9, 0.6, volume_multiplier("main-menu", 2.9)),
		landing_steps_sound = tile_sounds.landing.sand,
		driving_sound = sand_driving_sound,
		ambient_sounds = sand_ambient_sound,
		scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
		-- trigger_effect = tile_trigger_effects.sand_trigger_effect()
	},
	{
		name = "mefitis-dust-6",
		type = "tile",
		order = "b[natural]-f[dust]",
		subgroup = "mefitis-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
		  probability_expression = "volcanic_soil_light_range"
		},
		layer = 9,
		map_color={150, 150, 150},
		vehicle_friction_modifier = 4,
		sprite_usage_surface = "space",
		variants = tile_variations_template_with_transitions(
		  "__outer_moons__/graphics/terrain/mineral-red-dirt-6.png",
		  {
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		  }
		),
		transitions = lava_stone_transitions,
		transitions_between_transitions = lava_stone_transitions_between_transitions,
		walking_sound = sound_variations("__space-age__/sound/walking/soft-sand", 9, 0.6, volume_multiplier("main-menu", 2.9)),
		landing_steps_sound = tile_sounds.landing.sand,
		driving_sound = sand_driving_sound,
		ambient_sounds = sand_ambient_sound,
		scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
		-- trigger_effect = tile_trigger_effects.sand_trigger_effect()
	},
	{
		name = "mefitis-sand-1",
		type = "tile",
		order = "b[natural]-a[sand]",
		subgroup = "mefitis-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
		  probability_expression = "volcanic_cracks_hot_range"
		},
		layer = 10,
		map_color={60, 60, 60},
		vehicle_friction_modifier = 4,
		sprite_usage_surface = "space",
		variants = tile_variations_template_with_transitions(
		  "__outer_moons__/graphics/terrain/mineral-red-sand-1.png",
		  {
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		  }
		),
		transitions = lava_stone_transitions,
		transitions_between_transitions = lava_stone_transitions_between_transitions,
		walking_sound = sound_variations("__space-age__/sound/walking/soft-sand", 9, 0.6, volume_multiplier("main-menu", 2.9)),
		landing_steps_sound = tile_sounds.landing.sand,
		driving_sound = sand_driving_sound,
		ambient_sounds = sand_ambient_sound,
		scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
		-- trigger_effect = tile_trigger_effects.sand_trigger_effect()
	},
	{
		name = "mefitis-sand-2",
		type = "tile",
		order = "b[natural]-b[sand]",
		subgroup = "mefitis-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
		  probability_expression = "volcanic_cracks_warm_range"
		},
		layer = 11,
		map_color={80, 80, 80},
		vehicle_friction_modifier = 4,
		sprite_usage_surface = "space",
		variants = tile_variations_template_with_transitions(
		  "__outer_moons__/graphics/terrain/mineral-red-sand-2.png",
		  {
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		  }
		),
		transitions = lava_stone_transitions,
		transitions_between_transitions = lava_stone_transitions_between_transitions,
		walking_sound = sound_variations("__space-age__/sound/walking/soft-sand", 9, 0.6, volume_multiplier("main-menu", 2.9)),
		landing_steps_sound = tile_sounds.landing.sand,
		driving_sound = sand_driving_sound,
		ambient_sounds = sand_ambient_sound,
		scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
		-- trigger_effect = tile_trigger_effects.sand_trigger_effect()
	},
	{
		name = "mefitis-sand-3",
		type = "tile",
		order = "b[natural]-c[sand]",
		subgroup = "mefitis-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
		  probability_expression = "volcanic_cracks_cold_range"
		},
		layer = 12,
		map_color={160, 160, 160},
		vehicle_friction_modifier = 4,
		sprite_usage_surface = "space",
		variants = tile_variations_template_with_transitions(
		  "__outer_moons__/graphics/terrain/mineral-red-sand-3.png",
		  {
			max_size = 4,
			[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
			[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		  }
		),
		transitions = lava_stone_transitions,
		transitions_between_transitions = lava_stone_transitions_between_transitions,
		walking_sound = sound_variations("__space-age__/sound/walking/soft-sand", 9, 0.6, volume_multiplier("main-menu", 2.9)),
		landing_steps_sound = tile_sounds.landing.sand,
		driving_sound = sand_driving_sound,
		ambient_sounds = sand_ambient_sound,
		scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
		-- trigger_effect = tile_trigger_effects.sand_trigger_effect()
	},
}
-- add sulfur & caldera tiles to water tiles
table.insert(water_tile_type_names, "sulfur_ocean")
table.insert(water_tile_type_names, "lava-caldera-hot")
table.insert(water_tile_type_names, "lava-caldera")

-- add caldera tiles to lava tiles 
table.insert(lava_tile_type_names, "lava-caldera-hot")
table.insert(lava_tile_type_names, "lava-caldera")