local tile_trigger_effects = require("__space-age__/prototypes/tile/tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local tile_lightening = 19
selene_tile_offset = 40
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

--define ranges for all tilesets. Having these as thier own expressions helps with debugging and also modifying things like decorative placement
data:extend
{
  {
    type = "noise-expression",
    name = "selene_titanium_tile",
    expression = "max(0, selene_titanium_ore_probability)"
  },
  
  {
    type = "noise-expression",
    name = "selene_ice_tile",
    expression = "max(0, selene_ice_probability)"
  },

  ---- lowlands
  -- aux controls rocky outcrop pounts.
  -- high-medium aux is cracks
  -- low aux is smooth
  -- hotter is lower elevation
  {
    type = "noise-expression",
    name ="crater_cracks_hot_range",
    expression = "selene_lowlands_biome * range_select_base(selene_elev, 0, 8, 1, 0, 20)"
  },
  {
    type = "noise-expression",
    name ="crater_cracks_warm_range",
    expression = "selene_lowlands_biome * range_select_base(selene_elev, 8, 22, 1, 0, 5)\z
                  + (aux - 0.05)\z
                  + selene_titanium_tile * selene_ice_tile"
  },
  {
    type = "noise-expression",
    name = "crater_cracks_cold_range",
    expression = "(0.5 - selene_highlands_biome) * range_select_base(selene_elev, 20, 100, 1, 0, 1)\z
                  + (aux - 0.3)"
  },
  {
    type = "noise-expression",
    name = "crater_smooth_stone_warm_range",
    expression = "selene_lowlands_biome * range_select_base(selene_elev, 8, 20, 1, 0, 5)\z
                  - (aux - 0.05)\z
                  + selene_titanium_tile * selene_ice_tile"
  },
  {
    type = "noise-expression",
    name = "crater_smooth_stone_range",
    expression = "(0.5 - selene_highlands_biome) * range_select_base(selene_elev, 20, 100, 1, 0, 1)\z
                  - (aux - 0.3)"
  },

  -- craterS
  -- lumps (jagged/cold folded) are on high aux.
  -- depression channels (hot folded, soil) are low aux.
  -- folded is higher up the crater.
  -- hot folded is closest to the center.
  -- jagged ground identifies rocky peacks and resource patches.
  -- flat folded ix between extremes
  {
    type = "noise-expression",
    name = "crater_folds_flat_range",
    expression = "2 * (selene_craters_biome - 0.5) - 0.15 * crater_bottom_spots"
  },
  {
    type = "noise-expression",
    name = "crater_folds_range",
    expression = "2 * (selene_craters_biome - 0.5) + (aux - 0.5) + 0.5 * (crater_bottom_spots - 0.1)"

  },
  {
    type = "noise-expression",
    name = "crater_folds_warm_range",
    expression = "2 * (selene_craters_biome - 0.5) + 3 * (crater_bottom_spots - 0.85) - 2 * (aux - 0.5)"
  },
  {
    type = "noise-expression",
    name ="crater_jagged_ground_range",
    -- volcano peak circle is expected to be 1020 to 1030, The cliff is at 1020
    expression = "5 * min(10, max(selene_craters_biome + 0.2,\z
                                  range_select_base(selene_elev, 1010, 2000, 2, -10, 1) + 3 * (aux - 0.5)))"
  },
  {
    type = "noise-expression",
    name ="crater_soil_light_range_craters",
    expression = "min(0.8, 4 * (selene_craters_biome - 0.25)) - 0.35 * crater_bottom_spots - 3 * (aux - 0.2)"
  },
  {
    type = "noise-expression",
    name ="crater_soil_dark_range_craters",
    expression = "min(0.8, 4 * (selene_craters_biome - 0.25)) - 0.35 * crater_bottom_spots - 1 * (aux - 0.5)"
  },

  -- highlands
  -- Low aux low moisture is ash
  -- Low aux high moisture is trees & grass.
  -- High aux low moisture is chimneys and rocks.
  -- High aux high moisture is rocks with pita
  {
    type = "noise-expression",
    name = "crater_highlands_range",
    expression = "2 * (selene_highlands_biome - 0.5)\z
                  - 1.5 * (aux - 0.25)\z
                  - 1.5 * (moisture - 0.6)"
  },
  {
    type = "noise-expression",
    name = "crater_highlands_light_range",
    expression = "2 * (selene_highlands_biome - 0.5)\z
                  - 1.5 * (moisture - 0.6)"
  },
  {
    type = "noise-expression",
    name = "crater_highlands_dark_range",
    expression = "min(1, 4 * (selene_highlands_biome - 0.25))\z
                  + max(-1.5 * (aux - 0.25),\z
                        0.01 - 1.5 * abs(aux - 0.5) - 1.5 * (moisture - 0.66))"
    -- the last part is an axtra line blending ash cracks to light ash
  },
  {
    type = "noise-expression",
    name = "crater_pumice_stones_range",
    expression = "2 * (selene_highlands_biome - 0.5)\z
                  + 1.5 * (aux - 0.5)\z
                  + 1.5 * (moisture - 0.66)"
  },
  {
    type = "noise-expression",
    name = "crater_ash_cracks_range",
    expression = "min(1, 4 * (selene_highlands_biome - 0.25))\z
                  + 1.5 * (aux - 0.5)\z
                  - 1.5 * (moisture - 0.66)"
  },
  {
    type = "noise-expression",
    name = "crater_ash_soil_range",
    expression = "2 * (selene_highlands_biome - 0.5)"
  },
  {
    type = "noise-expression",
    name = "crater_soil_light_range_highlands",
    expression = "2 * (selene_highlands_biome - 0.5)\z
                  + 1.5 * (moisture - 0.8)"
  },
  {
    type = "noise-expression",
    name = "crater_soil_dark_range_highlands",
    expression = "2 * (selene_highlands_biome - 0.5)\z
                  - 1.5 * (aux - 0.25)\z
                  + 1.5 * (moisture - 0.8)"
  },

  -- COMBINE SHARED
  {
    type = "noise-expression",
    name = "crater_soil_light_range",
    expression = "max(crater_soil_light_range_craters, crater_soil_light_range_highlands, 10 * (selene_saline_region_patchy + 0.2))"
  },
  {
    type = "noise-expression",
    name = "crater_soil_dark_range",
    expression = "max(crater_soil_dark_range_craters, crater_soil_dark_range_highlands)"
  },
  ----------- CLIFF TILE
  
  ----------- GREY DIRT
  {
		name = "selene-dust-1",
		type = "tile",
		order = "b[natural]-a[dust]",
		subgroup = "selene-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
		  probability_expression = "crater_soil_light_range"
		},
		layer = 5,
		map_color={80, 80, 80},
		vehicle_friction_modifier = 4,
		
		variants = tile_variations_template_with_transitions(
		  "__outer_moons__/graphics/terrain/mineral-grey-dirt-1.png",
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
		name = "selene-dust-2",
		type = "tile",
		order = "b[natural]-b[dust]",
		subgroup = "selene-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
		  probability_expression = "crater_soil_dark_range"
		},
		layer = 6,
		map_color={100, 100, 100},
		vehicle_friction_modifier = 4,
		
		variants = tile_variations_template_with_transitions(
		  "__outer_moons__/graphics/terrain/mineral-grey-dirt-2.png",
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
		name = "selene-dust-3",
		type = "tile",
		order = "b[natural]-c[dust]",
		subgroup = "selene-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
		  probability_expression = "crater_folds_range"
		},
		layer = 6,
		map_color={110, 110, 110},
		vehicle_friction_modifier = 4,
		
		variants = tile_variations_template_with_transitions(
		  "__outer_moons__/graphics/terrain/mineral-grey-dirt-3.png",
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
		name = "selene-dust-4",
		type = "tile",
		order = "b[natural]-d[dust]",
		subgroup = "selene-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
		  probability_expression = "crater_folds_warm_range"
		},
		layer = 7,
		map_color={100, 100, 100},
		vehicle_friction_modifier = 4,
		
		variants = tile_variations_template_with_transitions(
		  "__outer_moons__/graphics/terrain/mineral-grey-dirt-4.png",
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
		name = "selene-dust-5",
		type = "tile",
		order = "b[natural]-e[dust]",
		subgroup = "selene-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
		  probability_expression = "crater_ash_cracks_range"
		},
		layer = 8,
		map_color={90, 90, 90},
		vehicle_friction_modifier = 4,
		
		variants = tile_variations_template_with_transitions(
		  "__outer_moons__/graphics/terrain/mineral-grey-dirt-5.png",
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
		name = "selene-dust-6",
		type = "tile",
		order = "b[natural]-f[dust]",
		subgroup = "selene-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
		  probability_expression = "crater_smooth_stone_warm_range"
		},
		layer = 9,
		map_color={130, 130, 130},
		vehicle_friction_modifier = 4,
		
		variants = tile_variations_template_with_transitions(
		  "__outer_moons__/graphics/terrain/mineral-grey-dirt-6.png",
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
		name = "selene-sand-1",
		type = "tile",
		order = "c[natural]-a[sand]",
		subgroup = "selene-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
		  probability_expression = "crater_cracks_hot_range"
		},
		layer = 10,
		map_color={110, 110, 110},
		vehicle_friction_modifier = 4,
		
		variants = tile_variations_template_with_transitions(
		  "__outer_moons__/graphics/terrain/mineral-grey-sand-1.png",
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
		name = "selene-sand-2",
		type = "tile",
		order = "c[natural]-b[sand]",
		subgroup = "selene-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
		  probability_expression = "crater_cracks_warm_range"
		},
		layer = 11,
		map_color={120, 120, 120},
		vehicle_friction_modifier = 4,
		
		variants = tile_variations_template_with_transitions(
		  "__outer_moons__/graphics/terrain/mineral-grey-sand-1.png",
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
		name = "selene-sand-3",
		type = "tile",
		order = "c[natural]-c[sand]",
		subgroup = "selene-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = {
		  probability_expression = "crater_cracks_cold_range"
		},
		layer = 12,
		map_color={100, 100, 100},
		vehicle_friction_modifier = 4,
		
		variants = tile_variations_template_with_transitions(
		  "__outer_moons__/graphics/terrain/mineral-grey-sand-1.png",
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