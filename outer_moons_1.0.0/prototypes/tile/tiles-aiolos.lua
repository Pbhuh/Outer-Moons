local tile_trigger_effects = require("__space-age__/prototypes/tile/tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local tile_lightening = 19
aiolos_tile_offset = 40
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

--define ranges for all tilesets. Having these as thier own expressions helps with debugging and also modifying things like decorative placement
data:extend
{
  
  {
    type = "noise-expression",
    name = "aiolos_beryllium_tile",
    expression = "max(0, aiolos_beryllium_probability)"
  },

  ---- lowlands
  -- aux controls rocky outcrop pounts.
  -- high-medium aux is cracks
  -- low aux is smooth
  -- hotter is lower elevation
  {
    type = "noise-expression",
    name ="peak_cracks_hot_range",
    expression = "aiolos_lowlands_biome * range_select_base(aiolos_elev, 0, 8, 1, 0, 20)"
  },
  {
    type = "noise-expression",
    name ="peak_cracks_warm_range",
    expression = "aiolos_lowlands_biome * range_select_base(aiolos_elev, 8, 22, 1, 0, 5)\z
                  + (aux - 0.05)\z
                  + aiolos_beryllium_tile"
  },
  {
    type = "noise-expression",
    name = "peak_cracks_cold_range",
    expression = "(0.5 - aiolos_highlands_biome) * range_select_base(aiolos_elev, 20, 100, 1, 0, 1)\z
                  + (aux - 0.3)"
  },
  {
    type = "noise-expression",
    name = "peak_smooth_stone_warm_range",
    expression = "aiolos_lowlands_biome * range_select_base(aiolos_elev, 8, 20, 1, 0, 5)\z
                  - (aux - 0.05)\z
                  + aiolos_beryllium_tile"
  },
  {
    type = "noise-expression",
    name = "peak_smooth_stone_range",
    expression = "(0.5 - aiolos_highlands_biome) * range_select_base(aiolos_elev, 20, 100, 1, 0, 1)\z
                  - (aux - 0.3)"
  },

  -- peakS
  -- lumps (jagged/cold folded) are on high aux.
  -- depression channels (hot folded, soil) are low aux.
  -- folded is higher up the peak.
  -- hot folded is closest to the center.
  -- jagged ground identifies rocky peacks and resource patches.
  -- flat folded ix between extremes
  {
    type = "noise-expression",
    name = "peak_folds_flat_range",
    expression = "2 * (aiolos_peaks_biome - 0.5) - 0.15 * peak_top_spots"
  },
  {
    type = "noise-expression",
    name = "peak_folds_range",
    expression = "2 * (aiolos_peaks_biome - 0.5) + (aux - 0.5) + 0.5 * (peak_top_spots - 0.1)"

  },
  {
    type = "noise-expression",
    name = "peak_folds_warm_range",
    expression = "2 * (aiolos_peaks_biome - 0.5) + 3 * (peak_top_spots - 0.85) - 2 * (aux - 0.5)"
  },
  {
    type = "noise-expression",
    name ="peak_jagged_ground_range",
    -- volcano peak circle is expected to be 1020 to 1030, The cliff is at 1020
    expression = "5 * min(10, max(aiolos_peaks_biome + 0.2,\z
                                  range_select_base(aiolos_elev, 1010, 2000, 2, -10, 1) + 3 * (aux - 0.5)))"
  },
  {
    type = "noise-expression",
    name ="peak_soil_light_range_peaks",
    expression = "min(0.8, 4 * (aiolos_peaks_biome - 0.25)) - 0.35 * peak_top_spots - 3 * (aux - 0.2)"
  },
  {
    type = "noise-expression",
    name ="peak_soil_dark_range_peaks",
    expression = "min(0.8, 4 * (aiolos_peaks_biome - 0.25)) - 0.35 * peak_top_spots - 1 * (aux - 0.5)"
  },

  -- highlands
  -- Low aux low moisture is ash
  -- Low aux high moisture is trees & grass.
  -- High aux low moisture is chimneys and rocks.
  -- High aux high moisture is rocks with pita
  {
    type = "noise-expression",
    name = "peak_highlands_range",
    expression = "2 * (aiolos_highlands_biome - 0.5)\z
                  - 1.5 * (aux - 0.25)\z
                  - 1.5 * (moisture - 0.6)"
  },
  {
    type = "noise-expression",
    name = "peak_highlands_light_range",
    expression = "2 * (aiolos_highlands_biome - 0.5)\z
                  - 1.5 * (moisture - 0.6)"
  },
  {
    type = "noise-expression",
    name = "peak_highlands_dark_range",
    expression = "min(1, 4 * (aiolos_highlands_biome - 0.25))\z
                  + max(-1.5 * (aux - 0.25),\z
                        0.01 - 1.5 * abs(aux - 0.5) - 1.5 * (moisture - 0.66))"
    -- the last part is an axtra line blending ash cracks to light ash
  },
  {
    type = "noise-expression",
    name = "peak_pumice_stones_range",
    expression = "2 * (aiolos_highlands_biome - 0.5)\z
                  + 1.5 * (aux - 0.5)\z
                  + 1.5 * (moisture - 0.66)"
  },
  {
    type = "noise-expression",
    name = "peak_ash_cracks_range",
    expression = "min(1, 4 * (aiolos_highlands_biome - 0.25))\z
                  + 1.5 * (aux - 0.5)\z
                  - 1.5 * (moisture - 0.66)"
  },
  {
    type = "noise-expression",
    name = "peak_ash_soil_range",
    expression = "2 * (aiolos_highlands_biome - 0.5)"
  },
  {
    type = "noise-expression",
    name = "peak_soil_light_range_highlands",
    expression = "2 * (aiolos_highlands_biome - 0.5)\z
                  + 1.5 * (moisture - 0.8)"
  },
  {
    type = "noise-expression",
    name = "peak_soil_dark_range_highlands",
    expression = "2 * (aiolos_highlands_biome - 0.5)\z
                  - 1.5 * (aux - 0.25)\z
                  + 1.5 * (moisture - 0.8)"
  },

  -- COMBINE SHARED
  {
    type = "noise-expression",
    name = "peak_soil_light_range",
    expression = "max(peak_soil_light_range_peaks, peak_soil_light_range_highlands)"
  },
  {
    type = "noise-expression",
    name = "peak_soil_dark_range",
    expression = "max(peak_soil_dark_range_peaks, peak_soil_dark_range_highlands)"
  },
  ----------- CLIFF TILE
  
  ----------- GREY DIRT
  {
		name = "aiolos-dust-1",
		type = "tile",
		order = "b[natural]-a[dust]",
		subgroup = "aiolos-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
		  probability_expression = "peak_soil_light_range"
		},
		layer = 5,
		map_color={80, 80, 80},
		vehicle_friction_modifier = 4,
		
		variants = tile_variations_template_with_transitions(
		  "__outer_moons__/graphics/terrain/mineral-tan-sand.png",
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
		name = "aiolos-dust-2",
		type = "tile",
		order = "b[natural]-b[dust]",
		subgroup = "aiolos-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
		  probability_expression = "peak_soil_dark_range"
		},
		layer = 6,
		map_color={100, 100, 100},
		vehicle_friction_modifier = 4,
		variants =
		{
		  transition = transition_masks(),
		  material_background =
		  {
			picture = "__outer_moons__/graphics/terrain/aiolos-rock.png",
			line_length = 8,
			count = 16,
			scale = 0.5
		  },
		  material_texture_width_in_tiles = 8,
		  material_texture_height_in_tiles = 8
		},
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
		name = "aiolos-dust-3",
		type = "tile",
		order = "b[natural]-c[dust]",
		subgroup = "aiolos-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
		  probability_expression = "peak_folds_range"
		},
		layer = 6,
		map_color={110, 110, 110},
		vehicle_friction_modifier = 4,
		variants = tile_variations_template_with_transitions(
		  "__outer_moons__/graphics/terrain/mineral-tan-dirt.png",
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
		name = "aiolos-dust-4",
		type = "tile",
		order = "b[natural]-d[dust]",
		subgroup = "aiolos-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
		  probability_expression = "peak_folds_warm_range"
		},
		layer = 7,
		map_color={100, 100, 100},
		vehicle_friction_modifier = 4,
		variants =
		{
		  transition = transition_masks(),
		  material_background =
		  {
			picture = "__outer_moons__/graphics/terrain/aiolos-dunes.png",
			line_length = 4,
			count = 16,
			scale = 0.5
		  },
		  material_texture_width_in_tiles = 10,
		  material_texture_height_in_tiles = 7
		},
		transitions = lava_stone_transitions,
		transitions_between_transitions = lava_stone_transitions_between_transitions,
		walking_sound = sound_variations("__space-age__/sound/walking/soft-sand", 9, 0.6, volume_multiplier("main-menu", 2.9)),
		landing_steps_sound = tile_sounds.landing.sand,
		driving_sound = sand_driving_sound,
		ambient_sounds = sand_ambient_sound,
		scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
		-- trigger_effect = tile_trigger_effects.sand_trigger_effect()
	},
	----- cloud cover
	{
		name = "shallow-hydrocarbon-sea",
		type = "tile",
		order = "a[oil]-b[shallow]",
		subgroup = "aiolos-tiles",
		collision_mask = tile_collision_masks.oil_ocean_shallow(),
		autoplace = {probability_expression = "peak_ash_cracks_range"}, -- target coast at cliff elevation
		layer = 4,
		layer_group = "water",
		map_color = { 74, 42, 43},
		vehicle_friction_modifier = 4,
		walking_speed_modifier = 0.8,
		default_cover_tile = "foundation",
		absorptions_per_second = tile_pollution.fulgora,
		destroys_dropped_items = true,
		fluid = "aliphatic-solution",
		effect = "cloud-effect",
		effect_color = { 19, 19, 19, 255 },
		effect_color_secondary = { 19, 19, 19, 255 },
		particle_tints = tile_graphics.fulgora_oil_ocean_particle_tints,
		sprite_usage_surface = "space",
		variants =
		  {
			main =
			{
			  {
				picture = "__outer_moons__/graphics/terrain/aiolos-deep-clouds.png",
				count = 1,
				scale = 0.0625,
				size = 1
			  }
			},
		  empty_transitions=true,
		},
		transitions = {lava_to_out_of_map_transition},
		transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
		walking_sound = sound_variations("__base__/sound/walking/resources/oil", 7, 1, volume_multiplier("main-menu", 1.5)),
		landing_steps_sound = sound_variations("__base__/sound/walking/resources/oil", 7, 1, volume_multiplier("main-menu", 2.9)),
		driving_sound = oil_driving_sound,
		scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
		trigger_effect = tile_trigger_effects.sand_trigger_effect()
	},

	  ----- Deep Oil
	{
		name = "hydrocarbon-sea",
		type = "tile",
		order = "a[oil]-b[deep]",
		subgroup = "aiolos-tiles",
		collision_mask = tile_collision_masks.oil_ocean_deep(),
		autoplace = {probability_expression = "max(peak_cracks_hot_range, peak_smooth_stone_warm_range)"},
		layer = 3,
		layer_group = "water",
		map_color = { 49*1.15, 31*1.15, 35*1.15},
		walking_speed_modifier = 0.5,
		vehicle_friction_modifier = 10,
		default_cover_tile = "foundation",
		absorptions_per_second = tile_pollution.water,
		destroys_dropped_items = true,
		fluid = "aliphatic-solution",
		effect = "cloud-effect",
		effect_color = { 19, 19, 19 },
		effect_color_secondary = { 19, 19, 19 },
		particle_tints = tile_graphics.fulgora_oil_ocean_particle_tints,
		sprite_usage_surface = "space",
		variants =
		  {
			main =
			{
			  {
				picture = "__outer_moons__/graphics/terrain/aiolos-deep-clouds.png",
				count = 1,
				scale = 0.0625,
				size = 1
			  }
			},
		  empty_transitions=true,
		},
		
		transitions = {lava_to_out_of_map_transition},
		transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
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
	{
		type = "tile-effect",
		name = "cloud-effect",
		shader = "water",
		water =
		{
		  shader_variation = "lava",
		  textures =
		  {
			{
			  filename = "__outer_moons__/graphics/terrain/clouds-noise.png",
			  width = 2048,
			  height = 2048,
			 -- scale = 0.0625
			},
			{
			  filename = "__outer_moons__/graphics/terrain/aiolos-deep-clouds.png",
			  width = 512 * 4,
			  height = 512 * 2,
			 -- scale = 0.0625
			},
			
		  },
		  animation_speed = 1.5,
		  animation_scale = { 0.05, 0.05 },
		  tick_scale = 0.25,

		  specular_lightness = { 0.5, 0.5, 0.5 },
		  foam_color = { 1, 1, 1 },
		  foam_color_multiplier = 1,

		  dark_threshold = { 0, 0 },
		  reflection_threshold = { 0.1, 0.1 },
		  specular_threshold = { 0.1, 0.1 },

		  near_zoom = 1 / 16,
		  far_zoom = 1 / 16
		}
	}
}


table.insert(water_tile_type_names, "shallow-hydrocarbon-sea")
table.insert(water_tile_type_names, "hydrocarbon-sea")