require ("sound-util")
require ("circuit-connector-sprites")
require ("util")
require ("__space-age__.prototypes.entity.circuit-network")
require ("__space-age__.prototypes.entity.space-platform-hub-cockpit")


local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require ("__space-age__.prototypes.entity.sounds")
local meld = require("meld")
local simulations = require("__outer_moons__.prototypes.factoriopedia-simulations")
local procession_graphic_catalogue_types = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

standard_status_colors = function()
  return
  {
    -- If no_power, idle, no_minable_resources, disabled, insufficient_input or full_output is used, always_draw of corresponding layer must be set to true to draw it in those states.

    no_power = {0, 0, 0, 0},                  -- If no_power is not specified or is nil, it defaults to clear color {0,0,0,0}

    idle = {1, 0, 0, 1},                      -- If idle is not specified or is nil, it defaults to white.
    no_minable_resources = {1, 0, 0, 1},      -- If no_minable_resources, disabled, insufficient_input or full_output are not specified or are nil, they default to idle color.
    insufficient_input = {1, 0, 0, 1},
    full_output = {1, 1, 0, 1},
    disabled = {1, 1, 0, 1},

    working = {0, 1, 0, 1},                   -- If working is not specified or is nil, it defaults to white.
    low_power = {1, 1, 0, 1},                 -- If low_power is not specified or is nil, it defaults to working color.
  }
end

shadowlesspipecoverspictures = function()
  return
  {
    north =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5
        },
      }
    },
    east =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5
        },
      }
    },
    south =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5
        },
      }
    },
    west =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5
        },
      }
    }
  }
end


data:extend({
  {
    type = "trivial-smoke",
    name = "aiolos-wind",
    duration = 30,
    fade_in_duration = 10,
    fade_away_duration = 10,
    spread_duration = 30,
    start_scale = 1,
    end_scale = 0.8,
    --color = {0.8, 1, 0.9},
    cyclic = true,
    affected_by_wind = false,
    --movement_slow_down_factor = 0,
    --vertical_speed_slowdown = 0,
    animation =
    {
      width = 512,
      height = 512,
      line_length = 1,
      frame_count = 1,
      priority = "high",
      animation_speed = 0.0001,
      --scale = 0.5,
      filename = "__outer_moons__/graphics/entity/aiolos-wind/aiolos-wind.png",
      flags = { "smoke" }
    }
  },
  scaled_cliff(
    {
      mod_name = "__outer_moons__",
      name = "cliff-selene",
      map_color = {65, 65, 65},
      suffix = "selene",
      subfolder = "selene",
      scale = 1.0,
      has_lower_layer = true,
      sprite_size_multiplier = 2,
      factoriopedia_simulation = simulations.factoriopedia_cliff_selene
    }
  ),
  scaled_cliff(
    {
      mod_name = "__outer_moons__",
      name = "cliff-mefitis",
      map_color = {65, 65, 65},
      suffix = "mefitis",
      subfolder = "mefitis",
      scale = 1.0,
      has_lower_layer = true,
      sprite_size_multiplier = 2,
      factoriopedia_simulation = simulations.factoriopedia_cliff_selene
    }
  ),
  scaled_cliff(
    {
      mod_name = "__outer_moons__",
      name = "cliff-aiolos",
      map_color = {65, 65, 65},
      suffix = "aiolos",
      subfolder = "aiolos",
      scale = 1.0,
      has_lower_layer = true,
      sprite_size_multiplier = 2,
      factoriopedia_simulation = simulations.factoriopedia_cliff_aiolos
    }
  ),
  
  {
    type = "assembling-machine",
    name = "convector",
    icon = "__outer_moons__/graphics/icons/convector.png",
	--icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "convector"},
	--order = "g[convector]",
	fast_replaceable_group = "convector",
	module_slots = 2,
    max_health = 350,
	corpse = "big-remnants",
    dying_explosion = "massive-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    icon_draw_specification = {shift = {0, -0.3}},
	--surface_conditions =
    --{
     -- {
      --  property = "pressure",
     --   min = 100,
     --   max = 100
     -- }
    --},
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal",
	working_sound =
    {
	  sound = { filename = "__base__/sound/assembling-machine-t3-1.ogg", volume = 0.45 },
      sound =
      {
        filename = "__base__/sound/electric-furnace.ogg",
        volume = 0.85,
      },
      max_sounds_per_type = 4,
      audible_distance_modifier = 0.7,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    drawing_box = {{-1.5, -1.8}, {1.5, 1.6}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.2,
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__outer_moons__/graphics/entity/convector/convector-hr-shadow.png",
                    priority = "high",
                    width = 600,
                    height = 500,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 80,
                    animation_speed = 1,
                    draw_as_shadow = true,
                    scale = 0.27,
                },
                {
                    priority = "high",
                    width = 360,
                    height = 350,
                    frame_count = 80,
                    animation_speed = 1,
                    scale = 0.27,
                    stripes = {
                        {
                            filename = "__outer_moons__/graphics/entity/convector/convector-hr-animation-1.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                        {
                            filename = "__outer_moons__/graphics/entity/convector/convector-hr-animation-2.png",
                            width_in_frames = 8,
                            height_in_frames = 2,
                        },
                    },
                },
            },
        },
        working_visualisations = {
            {
                fadeout = true,
                secondary_draw_order = 1,
                animation = {
                    priority = "high",
                    size = { 360, 350 },
                    frame_count = 80,
                    draw_as_glow = true,
                    scale = 0.27,
                    animation_speed = 1,
                    blend_mode = "additive",
                    stripes = {
                        {
                            filename = "__outer_moons__/graphics/entity/convector/convector-hr-animation-emission-1.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                        {
                            filename = "__outer_moons__/graphics/entity/convector/convector-hr-animation-emission-2.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                    },
                },
            }
        },
        reset_animation_when_frozen = true,
		frozen_patch = { 
			--tint = {0.5, 0.5, 0.8},
			--tint_as_overlay = true,
			priority = "extra-high",
			filename = "__outer_moons__/graphics/entity/convector/convector-frozen.png",
			scale = 0.45,
			width = 360,
			height = 350,
			--shift = util.by_pixel( 0, 0),
		}
    },	
    source_inventory_size = 1,
    crafting_categories = {"convecting", "electronics-or-convecting"},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 2 }
    },
    energy_usage = "500kW",
	heating_energy = "100kW",
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"}
  },
  
  {
    type = "assembling-machine",
    name = "adv-assembling-machine",
    icon = "__outer_moons__/graphics/icons/adv-assembler.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "adv-assembling-machine"},
	--order = "d[adv-assembling-machine]",
	effect_receiver = { base_effect = { productivity = 0.5 }},
    max_health = 350,
	corpse = "big-remnants",
    dying_explosion = "massive-explosion",
    icon_draw_specification = {shift = {0, -0.3}},
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    alert_icon_shift = util.by_pixel(0, -12),
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
		volume = 100,
		pipe_connections = { { direction = defines.direction.north, flow_direction = "input", position = { 0, -2 } } },
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
		volume = 100,
		pipe_connections = { { direction = defines.direction.south, flow_direction = "output", position = { 0, 2 } } },
        secondary_draw_orders = { north = -1 }
      },
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
	collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
	selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    drawing_box = {{-2.5, -2.8}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "assembling-machine",
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__outer_moons__/graphics/entity/adv-assembler/adv-assembler-hr-shadow.png",
                    priority = "high",
                    width = 520,
                    height = 500,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 99,
                    animation_speed = 0.5,
                    shift = util.by_pixel_hr(0, -16),
                    draw_as_shadow = true,
                    scale = 0.5,
                },
                {
                    priority = "high",
                    width = 320,
                    height = 320,
                    frame_count = 99,
                    shift = util.by_pixel_hr(0, -16),
                    animation_speed = 0.5,
                    scale = 0.5,
                    stripes = {
                        {
                            filename = "__outer_moons__/graphics/entity/adv-assembler/adv-assembler-hr-animation-1.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                        {
                            filename = "__outer_moons__/graphics/entity/adv-assembler/adv-assembler-hr-animation-2.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                    },
                },
            },
        },
        working_visualisations = {
            {
                fadeout = true,
                secondary_draw_order = 1,
                animation = {
                    priority = "high",
                    size = { 320, 320 },
                    shift = util.by_pixel_hr(0, -16),
                    frame_count = 99,
                    draw_as_glow = true,
                    scale = 0.5,
                    animation_speed = 0.5,
                    blend_mode = "additive",
                    stripes = {
                        {
                            filename = "__outer_moons__/graphics/entity/adv-assembler/adv-assembler-hr-animation-emission-1.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                        {
                            filename = "__outer_moons__/graphics/entity/adv-assembler/adv-assembler-hr-animation-emission-2.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                    },
                },
            }
        },
        reset_animation_when_frozen = true,
		frozen_patch = { 
			--tint = {0.5, 0.5, 0.8},
			--tint_as_overlay = true,
			priority = "extra-high",
			filename = "__outer_moons__/graphics/entity/adv-assembler/adv-assembler-frozen.png",
			scale = 0.5,
			width = 320,
			height = 320,
			--shift = util.by_pixel( 0, 0),
		}
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal",
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t3-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t3-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    crafting_categories = {"robotics"},

    crafting_speed = 1.5,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 1 }
    },
    energy_usage = "750kW",
	heating_energy = "100kW",
    module_slots = 5,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"}
  },
  {
    type = "assembling-machine",
    name = "megafoundry",
    icon = "__outer_moons__/graphics/icons/megafoundry.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 0.2, result = "megafoundry"},
    fast_replaceable_group = "megafoundry",
    max_health = 500,
    corpse = "big-remnants",
    dying_explosion = "massive-explosion",
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["foundry"],
    fluid_boxes_off_when_no_fluid_recipe = true,
    collision_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
    selection_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
    heating_energy = "500kW",
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 1.5,
    effect_receiver = { base_effect = { productivity = 0.5 }},
    module_slots = 8,
    icon_draw_specification = {scale = 2, shift = {0, -0.3}},
    icons_positioning =
    {
      {inventory_index = defines.inventory.assembling_machine_modules, shift = {0, 1.25}}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    crafting_categories = {"metallurgy", "pressing", "crafting-with-fluid-or-metallurgy", "metallurgy-or-assembling", "adv-metallurgy", "metallurgy-or-adv-metallurgy"},
    crafting_speed = 4,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 6 }
    },
    energy_usage = "5000kW",
    perceived_performance = { minimum = 0.25, performance_to_activity_rate = 2.0, maximum = 20 },
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__outer_moons__/graphics/entity/megafoundry/megafoundry-hr-shadow.png",
                    priority = "high",
                    width = 900,
                    height = 800,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 120,
                    animation_speed = 0.5,
                    shift = util.by_pixel_hr(0, -16),
                    draw_as_shadow = true,
                    scale = 0.43,
                },
                {
                    priority = "high",
                    width = 530,
                    height = 530,
                    frame_count = 120,
                    shift = util.by_pixel_hr(0, -16),
                    animation_speed = 0.5,
                    scale = 0.4375,
                    stripes = {
                        {
                            filename = "__outer_moons__/graphics/entity/megafoundry/megafoundry-hr-animation-1.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                        {
                            filename = "__outer_moons__/graphics/entity/megafoundry/megafoundry-hr-animation-2.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                    },
                },
            },
        },
        working_visualisations = {
			
			{
				always_draw = true,
				name = "output-pipe",
				enabled_by_name = true,
				north_animation = {
				  filename = "__outer_moons__/graphics/entity/megafoundry/megafoundry-pipe-connections-north.png",
				  width = 384,
				  height = 160,
				  shift = util.by_pixel( 0, -87),
				  line_length = 1,
				  repeat_count = 120,
				  scale = 0.5
				},
				north_secondary_draw_order = -10, -- behind main animation
				east_animation = {
				  filename = "__outer_moons__/graphics/entity/megafoundry/megafoundry-pipe-connections-east.png",
				  width = 64,
				  height = 384,
				  shift = util.by_pixel( 98, 0),
				  line_length = 1,
				  repeat_count = 120,
				  scale = 0.5
				},
				south_animation = {
				  filename = "__outer_moons__/graphics/entity/megafoundry/megafoundry-pipe-connections-south.png",
				  width = 384,
				  height = 172,
				  shift = util.by_pixel( 0, 94.5),
				  line_length = 1,
				  repeat_count = 120,
				  scale = 0.5
				},
				west_animation = {
				  filename = "__outer_moons__/graphics/entity/megafoundry/megafoundry-pipe-connections-west.png",
				  width = 64,
				  height = 384,
				  shift = util.by_pixel( -98, 0),
				  line_length = 1,
				  repeat_count = 120,
				  scale = 0.5
				},
			},
			{
				always_draw = true,
				name = "input-pipe",
				enabled_by_name = true,
				north_animation = {
				  filename = "__outer_moons__/graphics/entity/megafoundry/megafoundry-pipe-connections-south.png",
				  width = 384,
				  height = 172,
				  shift = util.by_pixel( 0, 94.5),
				  line_length = 1,
				  repeat_count = 120,
				  scale = 0.5
				},
				east_animation = {
				  filename = "__outer_moons__/graphics/entity/megafoundry/megafoundry-pipe-connections-west.png",
				  width = 64,
				  height = 384,
				  shift = util.by_pixel( -98, 0),
				  line_length = 1,
				  repeat_count = 120,
				  scale = 0.5
				},
				south_animation = {
				  filename = "__outer_moons__/graphics/entity/megafoundry/megafoundry-pipe-connections-north.png",
				  width = 384,
				  height = 160,
				  shift = util.by_pixel( 0, -87),
				  line_length = 1,
				  repeat_count = 120,
				  scale = 0.5
				},
				south_secondary_draw_order = -10, -- behind main animation
				west_animation = {
				  filename = "__outer_moons__/graphics/entity/megafoundry/megafoundry-pipe-connections-east.png",
				  width = 64,
				  height = 384,
				  shift = util.by_pixel( 98, 0),
				  line_length = 1,
				  repeat_count = 120,
				  scale = 0.5
				},
			},
            {
                fadeout = true,
                secondary_draw_order = 1,
                animation = {
                    priority = "high",
                    size = { 530, 530 },
                    shift = util.by_pixel_hr(0, -16),
                    frame_count = 120,
                    draw_as_glow = true,
                    scale = 0.4375,
                    animation_speed = 0.5,
                    blend_mode = "additive",
                    stripes = {
                        {
                            filename = "__outer_moons__/graphics/entity/megafoundry/megafoundry-hr-emission-1.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                        {
                            filename = "__outer_moons__/graphics/entity/megafoundry/megafoundry-hr-emission-2.png",
                            width_in_frames = 8,
                            height_in_frames = 8,
                        },
                    },
                },
            },
        },

        reset_animation_when_frozen = true,
		frozen_patch = { 
			--tint = {0.5, 0.5, 0.8},
			--tint_as_overlay = true,
			priority = "extra-high",
			filename = "__outer_moons__/graphics/entity/megafoundry/megafoundry-frozen.png",
			scale = 0.4375,
			width = 900,
			height = 800,
			--shift = util.by_pixel( 0, 0),
		}
    },
    open_sound = sounds.metal_large_open,
    close_sound = sounds.metal_large_close,
    working_sound =
    {
      sound =
      {
        filename = "__space-age__/sound/entity/foundry/foundry.ogg", volume = 0.5
      },
      --idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.3 },
      fade_in_ticks = 4,
      fade_out_ticks = 20,
      sound_accents =
      {
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-pipe-out.ogg", volume = 0.9 }, frame = 2, audible_distance_modifier = 0.4 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-slide-close.ogg", volume = 0.65 }, frame = 18, audible_distance_modifier = 0.3 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-clamp.ogg", volume = 0.45 }, frame = 39, audible_distance_modifier = 0.3 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-slide-stop.ogg", volume = 0.7 }, frame = 43, audible_distance_modifier = 0.4 },
        { sound = { variations = sound_variations("__space-age__/sound/entity/foundry/foundry-fire-whoosh", 3, 0.8 )}, frame = 64, audible_distance_modifier = 0.3 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-metal-clunk.ogg", volume = 0.65 }, frame = 64, audible_distance_modifier = 0.4 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-slide-open.ogg", volume = 0.65 }, frame = 74, audible_distance_modifier = 0.3 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-pipe-in.ogg", volume = 0.75 }, frame = 106, audible_distance_modifier = 0.4 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-smoke-puff.ogg", volume = 0.8 }, frame = 106, audible_distance_modifier = 0.3 },
        { sound = { variations = sound_variations("__space-age__/sound/entity/foundry/foundry-pour", 2, 0.7 )}, frame = 110 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-rocks.ogg", volume = 0.65 }, frame = 120, audible_distance_modifier = 0.3 },
        { sound = { filename = "__space-age__/sound/entity/foundry/foundry-blade.ogg", volume = 0.7 }, frame = 126 },
      },
      audible_distance_modifier = 0.6,
      max_sounds_per_type = 2
    },
	fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        --pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        enable_working_visualisations = { "input-pipe" },
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {-2, 3} }}
      },
	  {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        --pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        enable_working_visualisations = { "input-pipe" },
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {0, 3} }}
      },
	  {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        --pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        enable_working_visualisations = { "input-pipe" },
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {2, 3} }}
      },
      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        --pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        enable_working_visualisations = { "output-pipe" },
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {-2, -3} }}
      },
	  {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        --pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        enable_working_visualisations = { "output-pipe" },
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {0, -3} }}
      },
	  {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        --pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        enable_working_visualisations = { "output-pipe" },
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {2, -3} }}
      }
    },
  },
  {
    type = "boiler",
    name = "electric-boiler",
    icon = "__outer_moons__/graphics/icons/electric-boiler.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.2, result = "electric-boiler"},
    fast_replaceable_group = "boiler",
    max_health = 200,
    corpse = "boiler-remnants",
    dying_explosion = "boiler-explosion",
    impact_category = "metal-large",
    mode = "output-to-separate-pipe",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "explosion",
        percent = 30
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-1.29, -0.79}, {1.29, 0.79}},
    selection_box = {{-1.5, -1}, {1.5, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    target_temperature = 165,
    fluid_box =
    {
      volume = 200,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {flow_direction = "input-output", direction = defines.direction.west, position = {-1, 0.5}},
        {flow_direction = "input-output", direction = defines.direction.east, position = {1, 0.5}}
      },
      production_type = "input",
      filter = "water"
    },
    output_fluid_box =
    {
      volume = 200,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {flow_direction = "output", direction = defines.direction.north, position = {0, -0.5}}
      },
      production_type = "output",
      filter = "steam"
    },
	energy_source = {
      emissions_per_minute = { pollution = 1.5 },
      type = "electric",
      usage_priority = "secondary-input",
    },
    energy_consumption = "200kW",
    working_sound =
    {
      sound = { filename = "__base__/sound/boiler.ogg", volume = 0.7 },
      audible_distance_modifier = 0.3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    open_sound = sounds.steam_open,
    close_sound = sounds.steam_close,

    pictures =
    {
      north =
      {
        structure =
        {
          layers =
          {
            {
			  filename = "__outer_moons__/graphics/entity/electric-boiler/electric-boiler-n.png",
			  priority = "extra-high",
			  width = 268,
			  height = 220,
			  shift = util.by_pixel(-1.25, 5.25),				  
			  scale = 0.5
			},
			{
			  filename = "__outer_moons__/graphics/entity/electric-boiler/electric-boiler-n-shadow.png",
			  priority = "extra-high",
			  width = 274,
			  height = 164,
			  shift = util.by_pixel(20.5, 9),
			  draw_as_shadow = true,
			  scale = 0.5
			}
          }
        },
        fire_glow =
        {
		  filename = "__outer_moons__/graphics/entity/electric-boiler/electric-boiler-n-light.png",
		  priority = "extra-high",
		  width = 268,
		  height = 220,
		  shift = util.by_pixel(-1.25, 5.25),
		  blend_mode = "additive",
		  draw_as_glow = true,
		  scale = 0.5
		},
      },
      east =
      {
        structure =
        {
          layers =
          {
            {
			  filename = "__outer_moons__/graphics/entity/electric-boiler/electric-boiler-e.png",
			  priority = "extra-high",
			  width = 210,
			  height = 300,
              shift = util.by_pixel(-1.75, 1.25),
			  scale = 0.5
			},
			{
			  filename = "__outer_moons__/graphics/entity/electric-boiler/electric-boiler-e-shadow.png",
			  priority = "extra-high",
			  width = 184,
			  height = 194,
			  shift = util.by_pixel(30, 9.5),
			  draw_as_shadow = true,
			  scale = 0.5
			}
          }
        },
        fire_glow =
        {
		  filename = "__outer_moons__/graphics/entity/electric-boiler/electric-boiler-e-light.png",
		  priority = "extra-high",
		  width = 210,
		  height = 300,
		  shift = util.by_pixel(-1.75, 1.25),
		  blend_mode = "additive",
		  draw_as_glow = true,
		  scale = 0.5
		},
      },
      south =
      {
        structure =
        {
          layers =
          {
            {
			  filename = "__outer_moons__/graphics/entity/electric-boiler/electric-boiler-s.png",
			  priority = "extra-high",
			  width = 260,
			  height = 200,
			  shift = util.by_pixel(4, 10.75),
			  scale = 0.5
			},
			{
			  filename = "__outer_moons__/graphics/entity/electric-boiler/electric-boiler-s-shadow.png",
			  priority = "extra-high",
			  width = 310,
			  height = 130,
			  shift = util.by_pixel(29.75, 15.75),
			  draw_as_shadow = true,
			  scale = 0.5
			}
          },
        },
        fire_glow =
        {
		  filename = "__outer_moons__/graphics/entity/electric-boiler/electric-boiler-s-light.png",
		  priority = "extra-high",
		  width = 260,
		  height = 200,
		  shift = util.by_pixel(4, 10.75),
		  blend_mode = "additive",
		  draw_as_glow = true,
		  scale = 0.5
		},
      },
      west =
      {
        structure =
        {
          layers =
          {
            {
			  filename = "__outer_moons__/graphics/entity/electric-boiler/electric-boiler-w.png",
			  priority = "extra-high",
			  width = 196,
			  height = 272,
			  shift = util.by_pixel(1.5, 7.75),
			  scale = 0.5
			},
			{
			  filename = "__outer_moons__/graphics/entity/electric-boiler/electric-boiler-w-shadow.png",
			  priority = "extra-high",
			  width = 206,
			  height = 218,
			  shift = util.by_pixel(19.5, 6.5),
			  draw_as_shadow = true,
			  scale = 0.5
			}
          },
        },
        fire_glow =
        {
		  filename = "__outer_moons__/graphics/entity/electric-boiler/electric-boiler-w-light.png",
		  priority = "extra-high",
		  width = 196,
		  height = 272,
		  shift = util.by_pixel(1.5, 7.75),
		  blend_mode = "additive",
		  draw_as_glow = true,
		  scale = 0.5
		},
      }
    },

    fire_flicker_enabled = true,
    fire_glow_flicker_enabled = true,
    burning_cooldown = 20,
    water_reflection = boiler_reflection()
  },
  {
    type = "assembling-machine",
    name = "purification-plant",
	hidden = true,
    icon = "__outer_moons__/graphics/icons/purification-plant.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "purification-plant"},
    fast_replaceable_group = "purification-plant",
    max_health = 300,
    corpse = "chemical-plant-remnants",
    dying_explosion = "chemical-plant-explosion",
    icon_draw_specification = {shift = {0, -0.3}},
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["chemical-plant"],
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.4,
    module_slots = 3,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},

    graphics_set =
    {
      animation = { 
		north = {
			layers =
			{
				{
				  filename = "__outer_moons__/graphics/entity/purification-plant/purification-plant.png",
				  width = 244,
				  height = 268,
				  frame_count = 1,
				  x = 0,
				  shift = util.by_pixel(-5, -4.5),
				  scale = 0.5
				},
				{
				  filename = "__outer_moons__/graphics/entity/purification-plant/purification-plant-shadow.png",
				  width = 350,
				  height = 219,
				  x = 0,
				  frame_count = 1,
				  shift = util.by_pixel(31.5, 11),
				  draw_as_shadow = true,
				  scale = 0.5
				}
			}
		},
		east = {
			layers =
			{
				{
				  filename = "__outer_moons__/graphics/entity/purification-plant/purification-plant.png",
				  width = 244,
				  height = 268,
				  frame_count = 1,
				  x = 244,
				  shift = util.by_pixel(-5, -4.5),
				  scale = 0.5
				},
				{
				  filename = "__outer_moons__/graphics/entity/purification-plant/purification-plant-shadow.png",
				  width = 350,
				  height = 219,
				  x = 350, 
				  frame_count = 1,
				  shift = util.by_pixel(31.5, 11),
				  draw_as_shadow = true,
				  scale = 0.5
				}
			}
		},
		south = {
			layers =
			{
				{
				  filename = "__outer_moons__/graphics/entity/purification-plant/purification-plant.png",
				  width = 244,
				  height = 268,
				  frame_count = 1,
				  x = 488,
				  shift = util.by_pixel(-5, -4.5),
				  scale = 0.5
				},
				{
				  filename = "__outer_moons__/graphics/entity/purification-plant/purification-plant-shadow.png",
				  width = 350,
				  height = 219,
				  frame_count = 1,
				  x = 700,
				  shift = util.by_pixel(31.5, 11),
				  draw_as_shadow = true,
				  scale = 0.5
				}
			}
		},
		west = {
			layers =
			{
				{
				  filename = "__outer_moons__/graphics/entity/purification-plant/purification-plant.png",
				  width = 244,
				  height = 268,
				  frame_count = 1,
				  x = 732,
				  shift = util.by_pixel(-5, -4.5),
				  scale = 0.5
				},
				{
				  filename = "__outer_moons__/graphics/entity/purification-plant/purification-plant-shadow.png",
				  width = 350,
				  height = 219,
				  frame_count = 1,
				  x = 1050,
				  shift = util.by_pixel(31.5, 11),
				  draw_as_shadow = true,
				  scale = 0.5
				}
			}
		}
	  },
      working_visualisations =
      {
        {
		  north_position = util.by_pixel(30, -24),
		  east_position = util.by_pixel(-11, -1),
		  south_position = util.by_pixel(-30, -48),
		  west_position = util.by_pixel(1, -49.5),
          apply_recipe_tint = "primary",
          animation = {
			filename = "__outer_moons__/graphics/entity/purification-plant/boiling-patch.png",
			frame_count = 32,
			width = 30,
			height = 20,
			animation_speed = 0.5,
			scale = 0.5
		  }
        },
        {
          north_position = util.by_pixel(30, -24),
		  east_position = util.by_pixel(-11, -1),
		  south_position = util.by_pixel(-30, -48),
		  west_position = util.by_pixel(1, -49.5),
          apply_recipe_tint = "secondary",
          animation = {
			filename = "__outer_moons__/graphics/entity/purification-plant/boiling-patch-mask.png",
			frame_count = 32,
			width = 30,
			height = 20,
			animation_speed = 0.5,
			scale = 0.5
		  }
        },
        {
		  north_position = util.by_pixel(0, 0),
		  east_position = util.by_pixel(0, 0),
		  south_position = util.by_pixel(0, 0),
		  west_position = util.by_pixel(0, 0),
          apply_recipe_tint = "tertiary",
          north_animation =
          {
            filename = "__outer_moons__/graphics/entity/purification-plant/boiling-window-patch.png",
            frame_count = 1,
            width = 174,
            height = 119,
			x = 0,
            animation_speed = 0.5,
            shift = util.by_pixel(0, -5.25),
            scale = 0.5
          },
		  east_animation =
          {
            filename = "__outer_moons__/graphics/entity/purification-plant/boiling-window-patch.png",
            frame_count = 1,
            width = 174,
            height = 119,
			x = 174,
            animation_speed = 0.5,
            shift = util.by_pixel(0, -5.25),
            scale = 0.5
          },
		  south_animation =
          {
            filename = "__outer_moons__/graphics/entity/purification-plant/boiling-window-patch.png",
            frame_count = 1,
            width = 174,
            height = 119,
			x = 348,
            animation_speed = 0.5,
            shift = util.by_pixel(0, -5.25),
            scale = 0.5
          },
        }
      }
    },
    impact_category = "metal-large",
    open_sound = {filename = "__base__/sound/open-close/fluid-open.ogg", volume = 0.55},
    close_sound = {filename = "__base__/sound/open-close/fluid-close.ogg", volume = 0.54},
    working_sound =
    {
      sound = sound_variations("__base__/sound/chemical-plant", 3, 0.5),
      apparent_volume = 1.5,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 4 }
    },
    energy_usage = "160kW",
    crafting_categories = {"chemistry"},
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
		base_area = 10,
		base_level = -1,
        pipe_connections =
        {
          {
            flow_direction="input",
			direction = defines.direction.north,
            position = {-1, -1}
          }
        }
      },
	  {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
		base_area = 10,
		base_level = -1,
        pipe_connections =
        {
          {
            flow_direction="input",
			direction = defines.direction.north,
            position = {1, -1}
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
		base_level = 1,
        pipe_connections =
        {
          {
            flow_direction = "output",
			direction = defines.direction.south,
            position = {-1, 1}
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
		base_level = 1,
        pipe_connections =
        {
          {
            flow_direction = "output",
			direction = defines.direction.south,
            position = {1, 1}
          }
        }
      }
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/chemical-plant/chemical-plant-reflection.png",
        priority = "extra-high",
        width = 28,
        height = 36,
        shift = util.by_pixel(5, 60),
        variation_count = 4,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = true
    }
  },
  {
    type = "assembling-machine",
    name = "electrolytic-plant",
    icon = "__outer_moons__/graphics/icons/electrolytic-plant.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "electrolytic-plant"},
    fast_replaceable_group = "electrolytic-plant",
    max_health = 300,
    corpse = "chemical-plant-remnants",
    dying_explosion = "chemical-plant-explosion",
    icon_draw_specification = {shift = {0, -0.3}},
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["chemical-plant"],
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.4,
    module_slots = 3,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},

    graphics_set =
    {
      animation = { 
		north = {
			layers =
			{
				{
				  filename = "__outer_moons__/graphics/entity/electrolytic-plant/electrolytic-plant-base.png",
				  width = 272,
				  height = 260,
				  frame_count = 1,
				  x = 0,
				  shift = util.by_pixel(17, 0),
				  scale = 0.5
				},
				{
				  filename = "__outer_moons__/graphics/entity/electrolytic-plant/electrolytic-plant-shadow.png",
				  width = 272,
				  height = 260,
				  x = 0,
				  frame_count = 1,
				  shift = util.by_pixel(17, 0),
				  draw_as_shadow = true,
				  scale = 0.5
				}
			}
		},
		east = {
			layers =
			{
				{
				  filename = "__outer_moons__/graphics/entity/electrolytic-plant/electrolytic-plant-base.png",
				  width = 272,
				  height = 260,
				  frame_count = 1,
				  x = 272,
				  shift = util.by_pixel(17, 0),
				  scale = 0.5
				},
				{
				  filename = "__outer_moons__/graphics/entity/electrolytic-plant/electrolytic-plant-shadow.png",
				  width = 272,
				  height = 260,
				  x = 272,
				  frame_count = 1,
				  shift = util.by_pixel(17, 0),
				  draw_as_shadow = true,
				  scale = 0.5
				}
			}
		},
		south = {
			layers =
			{
				{
				  filename = "__outer_moons__/graphics/entity/electrolytic-plant/electrolytic-plant-base.png",
				  width = 272,
				  height = 260,
				  frame_count = 1,
				  x = 544,
				  shift = util.by_pixel(17, 0),
				  scale = 0.5
				},
				{
				  filename = "__outer_moons__/graphics/entity/electrolytic-plant/electrolytic-plant-shadow.png",
				  width = 272,
				  height = 260,
				  x = 544,
				  frame_count = 1,
				  shift = util.by_pixel(17, 0),
				  draw_as_shadow = true,
				  scale = 0.5
				}
			}
		},
		west = {
			layers =
			{
				{
				  filename = "__outer_moons__/graphics/entity/electrolytic-plant/electrolytic-plant-base.png",
				  width = 272,
				  height = 260,
				  frame_count = 1,
				  x = 816,
				  shift = util.by_pixel(17, 0),
				  scale = 0.5
				},
				{
				  filename = "__outer_moons__/graphics/entity/electrolytic-plant/electrolytic-plant-shadow.png",
				  width = 272,
				  height = 260,
				  x = 816,
				  frame_count = 1,
				  shift = util.by_pixel(17, 0),
				  draw_as_shadow = true,
				  scale = 0.5
				}
			}
		}
      }
    },
    impact_category = "metal-large",
    open_sound = {filename = "__base__/sound/open-close/fluid-open.ogg", volume = 0.55},
    close_sound = {filename = "__base__/sound/open-close/fluid-close.ogg", volume = 0.54},
	working_sound =
    {
      main_sounds =
      {
		{
          sound = {filename = "__base__/sound/chemical-plant.ogg", volume = 0.5, modifiers = volume_multiplier("main-menu", 1.44)},
		  activity_to_volume_modifiers = {offset = 1},
          fade_in_ticks = 4,
          fade_out_ticks = 20
        },
        {
          sound = {filename = "__base__/sound/accumulator-working.ogg", volume = 0.3, modifiers = volume_multiplier("main-menu", 1.44)},
		  activity_to_volume_modifiers = {offset = 1},
          fade_in_ticks = 4,
          fade_out_ticks = 20
        },
        {
          sound = {filename = "__base__/sound/accumulator-discharging.ogg", volume = 0.4, modifiers = volume_multiplier("main-menu", 1.44)},
          activity_to_volume_modifiers = {offset = 1},
          fade_in_ticks = 4,
          fade_out_ticks = 20
        }
      },
      idle_sound = {filename = "__base__/sound/accumulator-idle.ogg", volume = 0.35},
      max_sounds_per_type = 3,
      audible_distance_modifier = 0.5
    },
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 1 }
    },
    energy_usage = "300kW",
    crafting_categories = {"electrolysis"},
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
		base_area = 10,
		base_level = -1,
        pipe_connections =
        {
          {
            flow_direction="input",
			direction = defines.direction.north,
            position = {-1, -1}
          }
        }
      },
	  {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
		base_area = 10,
		base_level = -1,
        pipe_connections =
        {
          {
            flow_direction="input",
			direction = defines.direction.north,
            position = {1, -1}
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
		base_level = 1,
        pipe_connections =
        {
          {
            flow_direction = "output",
			direction = defines.direction.south,
            position = {-1, 1}
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
		base_level = 1,
        pipe_connections =
        {
          {
            flow_direction = "output",
			direction = defines.direction.south,
            position = {1, 1}
          }
        }
      }
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/chemical-plant/chemical-plant-reflection.png",
        priority = "extra-high",
        width = 28,
        height = 36,
        shift = util.by_pixel(5, 60),
        variation_count = 4,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = true
    }
  },
  {
    type = "assembling-machine",
    name = "stone-furnace-new",
    icon = "__base__/graphics/icons/stone-furnace.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "stone-furnace-new"},
    fast_replaceable_group = "furnace",
    next_upgrade = "steel-furnace-new",
    max_health = 200,
    corpse = "stone-furnace-remnants",
    dying_explosion = "stone-furnace-explosion",
    repair_sound = sounds.manual_repair,
    mined_sound = sounds.deconstruct_bricks(0.8),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    allowed_effects = {"speed", "consumption", "pollution"},
    effect_receiver = {uses_module_effects = false, uses_beacon_effects = false, uses_surface_effects = true},
    impact_category = "stone",
    icon_draw_specification = {scale = 0.66, shift = {0, -0.1}},
    working_sound =
    {
      sound = { filename = "__base__/sound/furnace.ogg", volume = 0.6, modifiers = { volume_multiplier("main-menu", 1.5), volume_multiplier("tips-and-tricks", 1.4) } },
      fade_in_ticks = 4,
      fade_out_ticks = 20,
      audible_distance_modifier = 0.4
    },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "explosion",
        percent = 30
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.8, -1}, {0.8, 1}},
    damaged_trigger_effect = hit_effects.rock(),
    crafting_categories = {"smelting", "alloying"},
    result_inventory_size = 1,
    energy_usage = "90kW",
    crafting_speed = 1,
    source_inventory_size = 1,
    energy_source =
    {
      type = "burner",
      fuel_categories = {"chemical"},
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = { pollution = 2 },
      light_flicker =
      {
        color = {0,0,0},
        minimum_intensity = 0.6,
        maximum_intensity = 0.95
      },
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 5,
          position = {0.0, -0.8},
          starting_vertical_speed = 0.08,
          starting_frame_deviation = 60
        }
      }
    },
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/stone-furnace/stone-furnace.png",
            priority = "extra-high",
            width = 151,
            height = 146,
            shift = util.by_pixel(-0.25, 6),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/stone-furnace/stone-furnace-shadow.png",
            priority = "extra-high",
            width = 164,
            height = 74,
            draw_as_shadow = true,
            shift = util.by_pixel(14.5, 13),
            scale = 0.5
          }
        }
      },
      working_visualisations =
      {
        {
          fadeout = true,
          effect = "flicker",
          animation =
          {
            layers =
            {
              {
                filename = "__base__/graphics/entity/stone-furnace/stone-furnace-fire.png",
                priority = "extra-high",
                line_length = 8,
                width = 41,
                height = 100,
                frame_count = 48,
                draw_as_glow = true,
                shift = util.by_pixel(-0.75, 5.5),
                scale = 0.5
              },
              {
                filename = "__base__/graphics/entity/stone-furnace/stone-furnace-light.png",
                blend_mode = "additive",
                width = 106,
                height = 144,
                repeat_count = 48,
                draw_as_glow = true,
                shift = util.by_pixel(0, 5),
                scale = 0.5,
              },
            }
          }
        },
        {
          fadeout = true,
          effect = "flicker",
          animation =
          {
            filename = "__base__/graphics/entity/stone-furnace/stone-furnace-ground-light.png",
            blend_mode = "additive",
            width = 116,
            height = 110,
            repeat_count = 48,
            draw_as_light = true,
            shift = util.by_pixel(-1, 44),
            scale = 0.5,
          },
        },
      },
      water_reflection =
      {
        pictures =
        {
          filename = "__base__/graphics/entity/stone-furnace/stone-furnace-reflection.png",
          priority = "extra-high",
          width = 16,
          height = 16,
          shift = util.by_pixel(0, 35),
          variation_count = 1,
          scale = 5
        },
        rotate = false,
        orientation_to_variation = false
      }
    }
  },
  {
    type = "assembling-machine",
    name = "steel-furnace-new",
    icon = "__base__/graphics/icons/steel-furnace.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "steel-furnace-new"},
    fast_replaceable_group = "furnace",
    max_health = 300,
    corpse = "steel-furnace-remnants",
    dying_explosion = "steel-furnace-explosion",
    impact_category = "metal",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    allowed_effects = {"speed", "consumption", "pollution"},
    effect_receiver = {uses_module_effects = false, uses_beacon_effects = false, uses_surface_effects = true},
    icon_draw_specification = {scale = 0.66, shift = {0, -0.1}},
    working_sound =
    {
      sound = {filename = "__base__/sound/steel-furnace.ogg", volume = 0.32, advanced_volume_control = {attenuation = "exponential"}},
      max_sounds_per_type = 4,
      audible_distance_modifier = 0.5,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.8, -1}, {0.8, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    crafting_categories = {"smelting", "alloying"},
    result_inventory_size = 1,
    energy_usage = "90kW",
    crafting_speed = 2,
    source_inventory_size = 1,
    energy_source =
    {
      type = "burner",
      fuel_categories = {"chemical"},
      effectivity = 1,
      emissions_per_minute = { pollution = 4 },
      fuel_inventory_size = 1,
      light_flicker =
      {
        color = {0,0,0},
        minimum_intensity = 0.6,
        maximum_intensity = 0.95
      },
      smoke =
      {
        {
          name = "smoke",
          frequency = 10,
          position = {0.7, -1.2},
          starting_vertical_speed = 0.08,
          starting_frame_deviation = 60
        }
      }
    },
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace.png",
            priority = "high",
            width = 171,
            height = 174,
            shift = util.by_pixel(-1.25, 2),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace-shadow.png",
            priority = "high",
            width = 277,
            height = 85,
            draw_as_shadow = true,
            shift = util.by_pixel(39.25, 11.25),
            scale = 0.5
          }
        }
      },
      working_visualisations =
      {
        {
          fadeout = true,
          effect = "flicker",
          animation =
          {
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace-fire.png",
            priority = "high",
            line_length = 8,
            width = 57,
            height = 81,
            frame_count = 48,
            draw_as_glow = true,
            shift = util.by_pixel(-0.75, 5.75),
            scale = 0.5
          },
        },
        {
          fadeout = true,
          effect = "flicker",
          animation =
          {
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace-glow.png",
            priority = "high",
            width = 60,
            height = 43,
            draw_as_glow = true,
            shift = {0.03125, 0.640625},
            blend_mode = "additive"
          }
        },
        {
          fadeout = true,
          effect = "flicker",
          animation =
          {
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace-working.png",
            priority = "high",
            line_length = 1,
            width = 128,
            height = 150,
            draw_as_glow = true,
            shift = util.by_pixel(0, -5),
            blend_mode = "additive",
            scale = 0.5,
          }
        },
        {
          fadeout = true,
          effect = "flicker",
          animation =
          {
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace-ground-light.png",
            priority = "high",
            line_length = 1,
            width = 152,
            height = 126,
            draw_as_light = true,
            shift = util.by_pixel(1, 48),
            blend_mode = "additive",
            scale = 0.5,
          },
        },
      },
      water_reflection =
      {
        pictures =
        {
          filename = "__base__/graphics/entity/steel-furnace/steel-furnace-reflection.png",
          priority = "extra-high",
          width = 20,
          height = 24,
          shift = util.by_pixel(0, 45),
          variation_count = 1,
          scale = 5
        },
        rotate = false,
        orientation_to_variation = false
      }
    }
  },
  {
    type = "assembling-machine",
    name = "electric-furnace-new",
    icon = "__base__/graphics/icons/electric-furnace.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "electric-furnace-new"},
    max_health = 350,
    corpse = "electric-furnace-remnants",
    dying_explosion = "electric-furnace-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    module_slots = 2,
    icon_draw_specification = {shift = {0, -0.1}},
    icons_positioning =
    {
      {inventory_index = defines.inventory.furnace_modules, shift = {0, 0.8}}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    crafting_categories = {"smelting", "alloying"},
    result_inventory_size = 1,
    crafting_speed = 2,
    energy_usage = "180kW",
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 1 }
    },
    impact_category = "metal",
    open_sound = sounds.electric_large_open,
    close_sound = sounds.electric_large_close,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/electric-furnace.ogg",
        volume = 0.85,
        modifiers = volume_multiplier("main-menu", 4.2),
        advanced_volume_control = {attenuation = "exponential"}
      },
      max_sounds_per_type = 4,
      audible_distance_modifier = 0.7,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace.png",
            priority = "high",
            width = 239,
            height = 219,
            shift = util.by_pixel(0.75, 5.75),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-shadow.png",
            priority = "high",
            width = 227,
            height = 171,
            draw_as_shadow = true,
            shift = util.by_pixel(11.25, 7.75),
            scale = 0.5
          }
        }
      },
      working_visualisations =
      {
        {
          fadeout = true,
          animation =
          {
            layers =
            {
              {
                filename = "__base__/graphics/entity/electric-furnace/electric-furnace-heater.png",
                priority = "high",
                width = 60,
                height = 56,
                frame_count = 12,
                animation_speed = 0.5,
                draw_as_glow = true,
                shift = util.by_pixel(1.75, 32.75),
                scale = 0.5
              },
              {
                filename = "__base__/graphics/entity/electric-furnace/electric-furnace-light.png",
                blend_mode = "additive",
                width = 202,
                height = 202,
                repeat_count = 12,
                draw_as_glow = true,
                shift = util.by_pixel(1, 0),
                scale = 0.5,
              },
            }
          },
        },
        {
          fadeout = true,
          animation =
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-ground-light.png",
            blend_mode = "additive",
            width = 166,
            height = 124,
            draw_as_light = true,
            shift = util.by_pixel(3, 69),
            scale = 0.5,
          },
        },
        {
          animation =
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-1.png",
            priority = "high",
            width = 37,
            height = 25,
            frame_count = 4,
            animation_speed = 0.5,
            shift = util.by_pixel(-20.5, -18.5),
            scale = 0.5
          }
        },
        {
          animation =
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-2.png",
            priority = "high",
            width = 23,
            height = 15,
            frame_count = 4,
            animation_speed = 0.5,
            shift = util.by_pixel(3.5, -38),
            scale = 0.5
          }
        }
      },
      water_reflection =
      {
        pictures =
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-reflection.png",
          priority = "extra-high",
          width = 24,
          height = 24,
          shift = util.by_pixel(5, 40),
          variation_count = 1,
          scale = 5
        },
        rotate = false,
        orientation_to_variation = false
      }
    }
  },
  {
    type = "assembling-machine",
    name = "industrial-furnace",
    icon = "__outer_moons__/graphics/icons/industrial-furnace.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.3, result = "industrial-furnace"},
	effect_receiver = { base_effect = { productivity = 0.5 }},
    max_health = 1200,
    corpse = "big-remnants",
    alert_icon_shift = util.by_pixel(0, -12),
    collision_box = {{-2.3, -2.3}, {2.3, 2.3}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    drawing_box = {{-2.5, -2.9}, {2.5, 2.5}},
    resistances =
    {
      { type = "impact", percent = 30 },
      { type = "fire", percent = 30 },
    },
    open_sound = sounds.electric_large_open,
    close_sound = sounds.electric_large_close,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound = {
      idle_sound = {
        filename = "__base__/sound/idle1.ogg",
        volume = 0.6
      },
      apparent_volume = 1.5,
      fade_in_ticks = 10,
      fade_out_ticks = 60,
      max_sounds_per_type = 2,
      sound = {
        filename = "__base__/sound/electric-furnace.ogg",
        volume = 0.7
      }
    },
    graphics_set = {
      animation =
      {
        layers =
        {
          {
            filename = "__outer_moons__/graphics/entity/industrial-furnace/industrial-furnace.png",
            priority = "high",
            width = 350,
            height = 370,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, -5),
            animation_speed = 0.125,
            scale = 0.5,
          },
          {
            draw_as_shadow = true,
            filename = "__outer_moons__/graphics/entity/industrial-furnace/industrial-furnace-shadow.png",
            priority = "high",
            width = 370,
            height = 268,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(40, 21),
            animation_speed = 0.125,
            scale = 0.5,
          },
        },
      },
      working_visualisations =
      {
        {
          animation = {
            layers = { -- these are not lights, they need to cover the static propeller
              {
                animation_speed = 0.125,
                filename = "__outer_moons__/graphics/entity/industrial-furnace/industrial-furnace-propeller.png",
                frame_count = 4,
                height = 25,
                priority = "high",
                scale = 0.5,
                shift = util.by_pixel(-1, -64-11),
                width = 38
              },
              {
                animation_speed = 0.125,
                filename = "__outer_moons__/graphics/entity/industrial-furnace/industrial-furnace-propeller.png",
                frame_count = 4,
                height = 25,
                priority = "high",
                scale = 0.5,
                shift = util.by_pixel(-0.5, -32-8),
                width = 38
              },
              {
                animation_speed = 0.125,
                filename = "__outer_moons__/graphics/entity/industrial-furnace/industrial-furnace-propeller.png",
                frame_count = 4,
                height = 25,
                priority = "high",
                scale = 0.5,
                shift = util.by_pixel(0, -6),
                width = 38
              },
            }
          }
        },
        {
          draw_as_light = true,
          fadeout = true,
          animation = {
            layers = {
              {
                animation_speed = 0.125,
                filename = "__outer_moons__/graphics/entity/industrial-furnace/industrial-furnace-heater.png",
                frame_count = 12,
                height = 56,
                priority = "high",
                scale = 0.5,
                shift = util.by_pixel(0, 65),
                width = 60
              },
            }
          }
        },
        {
          draw_as_light = true,
          fadeout = true,
          animation = {
            layers = {
              {
                filename = "__outer_moons__/graphics/entity/industrial-furnace/industrial-furnace-light.png",
                priority = "high",
                width = 350,
                height = 370,
                frame_count = 1,
                line_length = 1,
                shift = util.by_pixel(0, -5),
                animation_speed = 0.125,
                scale = 0.5,
                blend_mode = "additive",
              },
              {
                animation_speed = 0.125,
                filename = "__outer_moons__/graphics/entity/industrial-furnace/industrial-furnace-vents.png",
                frame_count = 1,
                width = 46,
                height = 66,
                priority = "high",
                scale = 0.5,
                shift = util.by_pixel(-32-16-5, -32-16+4),
                blend_mode = "additive",
              },
            }
          }
        },
        {
          draw_as_light = true,
          fadeout = true,
          animation = {
            layers = {
              {
                animation_speed = 0.125,
                filename = "__outer_moons__/graphics/entity/industrial-furnace/industrial-furnace-propeller.png",
                frame_count = 4,
                height = 25,
                priority = "high",
                scale = 0.5,
                shift = util.by_pixel(-1, -64-11),
                width = 38
              },
              {
                animation_speed = 0.125,
                filename = "__outer_moons__/graphics/entity/industrial-furnace/industrial-furnace-propeller.png",
                frame_count = 4,
                height = 25,
                priority = "high",
                scale = 0.5,
                shift = util.by_pixel(-0.5, -32-8),
                width = 38
              },
              {
                animation_speed = 0.125,
                filename = "__outer_moons__/graphics/entity/industrial-furnace/industrial-furnace-propeller.png",
                frame_count = 4,
                height = 25,
                priority = "high",
                scale = 0.5,
                shift = util.by_pixel(0, -6),
                width = 38
              },
            }
          }
        },
        {
          fadeout = true,
          animation =
          {
            filename = "__outer_moons__/graphics/entity/industrial-furnace/industrial-furnace-ground-light.png",
            blend_mode = "additive",
            width = 166,
            height = 124,
            shift = util.by_pixel(3, 69+32),
            scale = 0.5,
            draw_as_light = true,
          },
        },
        {
          effect = "uranium-glow", -- changes alpha based on energy source light intensity
          light = {intensity = 0.1, size = 18, shift = {0.0, 1}, color = {r = 1, g = 0.4, b = 0.1}}
        },
      },
    },
    crafting_categories = {
      "smelting", "alloying"
    },
    crafting_speed = 4,
    damaged_trigger_effect = {
      entity_name = "spark-explosion",
      offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
      offsets = { { 0, 1 } },
      type = "create-entity"
    },
    dying_explosion = "electric-furnace-explosion",
    energy_source = {
      emissions_per_minute = { pollution = 1.5 },
      type = "electric",
      usage_priority = "secondary-input",
      light_flicker =
      {
        minimum_light_size = 5,
        color = {1,0.3,0},
        minimum_intensity = 0.6,
        maximum_intensity = 0.95
      },
    },
    energy_usage = "500kW",
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = {
			filename = "__outer_moons__/graphics/entity/industrial-furnace/industrial-furnace-pipe-n.png",
			width = 128,
			height = 128,
			scale = 0.5,
			shift = util.by_pixel(0, 24),
		},
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections = {{ flow_direction ="input", position = {-1, -2}, direction=defines.direction.north }},
        secondary_draw_orders = { north = -1, east = -1, west = -1 }
      },
      {
        production_type = "input",
        pipe_picture = {
			filename = "__outer_moons__/graphics/entity/industrial-furnace/industrial-furnace-pipe-n.png",
			width = 128,
			height = 128,
			scale = 0.5,
			shift = util.by_pixel(0, 24),
		},
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections = {{ flow_direction ="input", position = {1, -2}, direction=defines.direction.north }},
        secondary_draw_orders = { north = -1, east = -1, west = -1 }
      },
      {
        production_type = "input",
        pipe_picture = {
			filename = "__outer_moons__/graphics/entity/industrial-furnace/industrial-furnace-pipe-h.png",
			width = 128,
			height = 128,
			scale = 0.5,
			shift = {1,0}
		},
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections = {{ flow_direction ="input", position = {-2, -1}, direction=defines.direction.west }},
        secondary_draw_orders = { north = -1, east = -1, west = -1 }
      },
      {
        production_type = "input",
        pipe_picture = {
			filename = "__outer_moons__/graphics/entity/industrial-furnace/industrial-furnace-pipe-h.png",
			width = 128,
			height = 128,
			scale = 0.5,
			shift = {-1,0}			
		},
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections = {{ flow_direction ="input", position = {2, -1}, direction=defines.direction.east }},
        secondary_draw_orders = { north = -1, east = -1, west = -1 }
      },
      {
        production_type = "output",
        pipe_picture = {
			filename = "__outer_moons__/graphics/entity/industrial-furnace/industrial-furnace-pipe-s.png",
			width = 64,
			height = 32,
			scale = 0.5,
			shift = util.by_pixel(0, -24),
		},
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections = {{ flow_direction ="output", position = {-1, 2}, direction=defines.direction.south }},
        secondary_draw_orders = { north = -1, east = -1, west = -1 }
      },
      {
        production_type = "output",
        pipe_picture = {
			filename = "__outer_moons__/graphics/entity/industrial-furnace/industrial-furnace-pipe-s.png",
			width = 64,
			height = 32,
			scale = 0.5,
			shift = util.by_pixel(0, -24),
		},
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections = {{ flow_direction ="output", position = {1, 2}, direction=defines.direction.south }},
        secondary_draw_orders = { north = -1, east = -1, west = -1 }
      },
      {
        production_type = "output",
        pipe_picture = {
			filename = "__outer_moons__/graphics/entity/industrial-furnace/industrial-furnace-pipe-h.png",
			width = 128,
			height = 128,
			scale = 0.5,
			shift = {-1,0}			
		},
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections = {{ flow_direction ="output", position = {2, 1}, direction=defines.direction.east }},
        secondary_draw_orders = { north = -1, east = -1, west = -1 }
      },
      {
        production_type = "output",
        pipe_picture = {
			filename = "__outer_moons__/graphics/entity/industrial-furnace/industrial-furnace-pipe-h.png",
			width = 128,
			height = 128,
			scale = 0.5,
			shift = {-1,0}			
		},
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections = {{ flow_direction ="output", position = {-2, 1}, direction=defines.direction.east }}, -- west south
        secondary_draw_orders = { north = -1, east = -1, west = -1 }
      },
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    ingredient_count = 12,
    module_slots = 5,
    allowed_effects = {"consumption", "speed",  "pollution", "productivity", "quality"}, -- not "productivity",
    
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/electric-furnace/electric-furnace-reflection.png",
        priority = "extra-high",
        width = 24,
        height = 24,
        shift = util.by_pixel(5, 40),
        variation_count = 1,
        scale = 7
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  {
    type = "furnace",
    name = "gas-vent",
    icon = "__outer_moons__/graphics/icons/gas-vent.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "gas-vent"},
    fast_replaceable_group = "pipe",
    max_health = 150,
    corpse = "pipe-to-ground-remnants",
    dying_explosion = "pipe-to-ground-explosion",
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    crafting_categories = {"venting"},
    crafting_speed = 0.5,
	surface_conditions =
	{
	  {
		property = "pressure",
		min = 150,
		max = 5000
	  }
	},
    resistances =
    {
      {
        type = "fire",
        percent = 80
      },
      {
        type = "impact",
        percent = 30
      }

    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = {pollution = 4}
    },
    energy_usage = "10kW",
    result_inventory_size = 0,
    source_inventory_size = 0,
    show_recipe_icon = false,	
	show_recipe_icon_on_map = false,
	graphics_set = {
		status_colors = standard_status_colors(),
		animation = {
			north = {
				layers = {
					{
					  filename = "__outer_moons__/graphics/entity/gas-vent/gas-vent-base.png",
					  repeat_count = 4,
					  animation_speed = 1,
					  width = 64,
					  height = 192,
					  x = 0,
					  y = 0,
					  tw = 64,
					  th = 192,
					  scale = 0.5,
					  shift = {0, 0}
					},
					{
					  filename = "__outer_moons__/graphics/entity/gas-vent/gas-vent-working.png",
					  frame_count = 4,
					  line_length = 1,
					  animation_speed = 1,
					  width = 64,
					  height = 32,
					  x = 0,
					  y = 0,
					  tw = 64,
					  th = 32,
					  scale = 0.5,
					  shift = {0, -0.75}
					},
					{
					  filename = "__outer_moons__/graphics/entity/gas-vent/gas-vent-shadow.png",
					  repeat_count = 4,
					  animation_speed = 1,
					  draw_as_shadow = true,
					  width = 160,
					  height = 96,
					  x = 0,
					  y = 0,
					  tw = 160,
					  th = 96,
					  scale = 0.5,
					  shift = {0.75, 0.25}
					},
				}
			},
			east = {
				layers = {
					{
					  filename = "__outer_moons__/graphics/entity/gas-vent/gas-vent-base.png",
					  repeat_count = 4,
					  animation_speed = 1,
					  width = 64,
					  height = 192,
					  x = 64,
					  y = 0,
					  tw = 64,
					  th = 192,
					  scale = 0.5,
					  shift = {0, 0}
					},
					{
					  filename = "__outer_moons__/graphics/entity/gas-vent/gas-vent-working.png",
					  frame_count = 4,
					  line_length = 1,
					  animation_speed = 1,
					  width = 64,
					  height = 32,
					  x = 0,
					  y = 0,
					  tw = 64,
					  th = 32,
					  scale = 0.5,
					  shift = {0, -0.75}
					},
					{
					  filename = "__outer_moons__/graphics/entity/gas-vent/gas-vent-shadow.png",
					  repeat_count = 4,
					  animation_speed = 1,
					  draw_as_shadow = true,
					  width = 160,
					  height = 96,
					  x = 0,
					  y = 96,
					  tw = 160,
					  th = 96,
					  scale = 0.5,
					  shift = {0.75, 0.25}
					},
				}
			},
			south = {
				layers = {
					{
					  filename = "__outer_moons__/graphics/entity/gas-vent/gas-vent-base.png",
					  repeat_count = 4,
					  animation_speed = 1,
					  width = 64,
					  height = 192,
					  x = 128,
					  y = 0,
					  tw = 64,
					  th = 192,
					  scale = 0.5,
					  shift = {0, 0}
					},
					{
					  filename = "__outer_moons__/graphics/entity/gas-vent/gas-vent-working.png",
					  frame_count = 4,
					  line_length = 1,
					  animation_speed = 1,
					  width = 64,
					  height = 32,
					  x = 0,
					  y = 0,
					  tw = 64,
					  th = 32,
					  scale = 0.5,
					  shift = {0, -0.75}
					},
					{
					  filename = "__outer_moons__/graphics/entity/gas-vent/gas-vent-shadow.png",
					  repeat_count = 4,
					  animation_speed = 1,
					  draw_as_shadow = true,
					  width = 160,
					  height = 96,
					  x = 0,
					  y = 192,
					  tw = 160,
					  th = 96,
					  scale = 0.5,
					  shift = {0.75, 0.25}
					},
				}
			},
			west = {
				layers = {
					{
					  filename = "__outer_moons__/graphics/entity/gas-vent/gas-vent-base.png",
					  repeat_count = 4,
					  animation_speed = 1,
					  width = 64,
					  height = 192,
					  x = 192,
					  y = 0,
					  tw = 64,
					  th = 192,
					  scale = 0.5,
					  shift = {0, 0}
					},
					{
					  filename = "__outer_moons__/graphics/entity/gas-vent/gas-vent-working.png",
					  frame_count = 4,
					  line_length = 1,
					  animation_speed = 1,
					  width = 64,
					  height = 32,
					  x = 0,
					  y = 0,
					  tw = 64,
					  th = 32,
					  scale = 0.5,
					  shift = {0, -0.75}
					},
					{
					  filename = "__outer_moons__/graphics/entity/gas-vent/gas-vent-shadow.png",
					  repeat_count = 4,
					  animation_speed = 1,
					  draw_as_shadow = true,
					  width = 160,
					  height = 96,
					  x = 0,
					  y = 288,
					  tw = 160,
					  th = 96,
					  scale = 0.5,
					  shift = {0.75, 0.25}
					},
				}
			},
		},
		working_visualisations = {
			{
				animation = {
					--{
					  filename = "__outer_moons__/graphics/entity/gas-vent/gas-vent-status.png",
					  draw_as_glow = true,
					  frame_count = 30,
					  line_length = 6,
					  animation_speed = 1,
					  width = 64,
					  height = 64,
					  x = 0,
					  y = 0,
					  tw = 64,
					  th = 64,
					  scale = 0.5,
					  blend_mode = "additive",
					  shift = {0, -0.5}
					--},			
				},
				
				--apply_recipe_tint = "secondary",
				apply_tint = "status",
				tint_as_overlay = true,
				always_draw = true,
			},
			{
				animation = {
					--{
					  filename = "__outer_moons__/graphics/entity/gas-vent/gas-vent-venting.png",
					  frame_count = 30,
					  line_length = 10,
					  animation_speed = 1,
					  width = 192,
					  height = 192,
					  x = 0,
					  y = 0,
					  tw = 192,
					  th = 192,
					  scale = 0.5,
					  shift = {0, -120/64}
					--},			
				},
				fadeout = true,
				apply_recipe_tint = "primary",
			},
		},

	},
    working_sound =
    {
      sound = { filename = "__outer_moons__/sound/air-vent.ogg" },
      apparent_volume = 1.5,
    },
    fluid_boxes = {
		{
			production_type = "input",
			pipe_covers = shadowlesspipecoverspictures(),
			volume = 100,
			pipe_connections = {
				{ flow_direction = "input", direction = defines.direction.north, position = { 0, 0 } },
			},
		},
	},
  },
  {
    type = "furnace",
    name = "flare-stack",
    icon = "__outer_moons__/graphics/icons/flare-stack.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "flare-stack"},
    fast_replaceable_group = "flare-stack",
    max_health = 200,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    crafting_categories = {"flaring"},
    crafting_speed = 0.5,
    resistances =
    {
      {
        type = "fire",
        percent = 80
      },
      {
        type = "impact",
        percent = 30
      }

    },
	surface_conditions =
	{
	  {
		property = "pressure",
		min = 150,
		max = 5000
	  }
	},
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = {pollution = 8}
    },
    energy_usage = "10kW",
    result_inventory_size = 0,
    source_inventory_size = 0,
    show_recipe_icon = false,
	show_recipe_icon_on_map = false,
    stateless_visualisation =
    {
      {
        animation =
        {
          layers = {
            {
              filename = "__outer_moons__/graphics/entity/flare-stack/flare-stack.png",
              priority = "high",
              width = 320,
              height = 320,
              scale = 0.5,
              frame_count = 1,
              shift = {1.5, -1.59375}
            },
            {
              filename = "__outer_moons__/graphics/entity/flare-stack/flare-stack-shadow.png",
              priority = "high",
              width = 320,
              height = 320,
              scale = 0.5,
              frame_count = 1,
              shift = {1.5, -1.59375},
              draw_as_shadow = true
            },
          }
          
        }
      }
    },
    match_animation_speed_to_activity = false,
    graphics_set = {
      working_visualisations = {
        {
          animation =
          {
            layers = {
              {
                filename = "__outer_moons__/graphics/entity/flare-stack/flare-stack-fire.png",
                priority = "high",
                frame_count = 60,
				line_length = 10,
                width = 40,
				height = 81,
                scale = 0.5,
                shift = {0, -4.3},
                draw_as_glow = true,
                run_mode = "backward"
              },
              {
                filename = "__outer_moons__/graphics/entity/flare-stack/flare-stack-glow-top.png",
                priority = "high",
                repeat_count = 60,
                width = 320,
                height = 320,
                scale = 0.5,
                shift = {1.5, -1.59375},
                draw_as_light = true,
              },
            }
          },
          --light = {intensity = 0.1, size = 5},
          constant_speed = true
        }
      }
    },
    working_sound =
    {
      sound = { filename = "__base__/sound/oil-refinery.ogg" },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 2.5,
    },
    fluid_boxes = {
		{
			production_type = "input",
			pipe_covers = shadowlesspipecoverspictures(),
			volume = 100,
			pipe_connections = {
				{ flow_direction = "input", direction = defines.direction.north, position = { 0, 0 } },
			},
		},
	},
  },
  {
    type = "solar-panel",
    name = "solar-array",
    icon = "__outer_moons__/graphics/icons/solar-array.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "solar-array"},
    fast_replaceable_group = "solar-array",
    max_health = 300,
    corpse = "solar-array-remnants",
    dying_explosion = "solar-panel-explosion",
    collision_box = {{-2.9, -2.9}, {2.9, 2.9}},
    selection_box = {{-3, -3}, {3, 3}},
    damaged_trigger_effect = hit_effects.entity(),
    energy_source =
    {
      type = "electric",
      usage_priority = "solar"
    },
	picture =
    {
      layers =
      {
        {
          filename = "__outer_moons__/graphics/entity/solar-array/solar-array.png",
          width = 624,
          height = 578,
          scale = 0.32,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(10, -4),
        },
        {
          filename = "__outer_moons__/graphics/entity/solar-array/solar-array-shadow.png",
          width = 624,
          height = 578,
          scale = 0.32,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(12, 12),
          draw_as_shadow = true,
        }
      }
    },
    impact_category = "glass",
    production = "160kW"
  },

  {
    type = "accumulator",
    name = "superaccumulator",
    icon = "__outer_moons__/graphics/icons/superaccumulator.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "superaccumulator"},
    fast_replaceable_group = "superaccumulator",
    max_health = 200,
    corpse = "accumulator-remnants",
    dying_explosion = "accumulator-explosion",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.5,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "32MJ",
      usage_priority = "tertiary",
      input_flow_limit = "760kW",
      output_flow_limit = "760kW"
    },
    chargable_graphics =
    {
      picture = {
		layers =
		{
		  {
			filename = "__outer_moons__/graphics/entity/superaccumulator/superaccumulator.png",
			priority = "high",
			width = 188,
			height = 230,
			repeat_count = repeat_count,
			shift = util.by_pixel(0, -5),
			tint = tint,
			animation_speed = 0.5,
			scale = 0.52
		  },
		  {
			filename = "__outer_moons__/graphics/entity/superaccumulator/superaccumulator-shadow.png",
			priority = "high",
			width = 234,
			height = 147,
			repeat_count = repeat_count,
			shift = util.by_pixel(40, 12),
			draw_as_shadow = true,
			scale = 0.52,
		  }
		}
	  },
      charge_animation = {
		layers =
		{
		  --advanced_accumulator_picture({ r=1, g=1, b=1, a=1 } , 24),
		  {
			  filename = "__outer_moons__/graphics/entity/superaccumulator/superaccumulator-charge.png",
			  priority = "high",
			  width = 178,
			  height = 210,
			  line_length = 6,
			  frame_count = 24,
			  draw_as_glow = true,
			  shift = util.by_pixel(2, -10),
			  scale = 0.75
		  }
		}
	  },
      charge_cooldown = 30,
      discharge_animation = {
		layers =
		{
		  --advanced_accumulator_picture({ r=1, g=1, b=1, a=1 } , 24),
		  {
			  filename = "__outer_moons__/graphics/entity/superaccumulator/superaccumulator-discharge.png",
			  priority = "high",
			  width = 174,
			  height = 214,
			  line_length = 6,
			  frame_count = 24,
			  draw_as_glow = true,
			  shift = util.by_pixel(-1, -10),
			  scale = 0.75
		  }
		}
	  },
      discharge_cooldown = 60
      --discharge_light = {intensity = 0.7, size = 7, color = {r = 1.0, g = 1.0, b = 1.0}},
    },
    water_reflection = accumulator_reflection(),
    impact_category = "metal",
    open_sound = sounds.electric_large_open,
    close_sound = sounds.electric_large_close,
    working_sound =
    {
      main_sounds =
      {
        {
          sound = {filename = "__base__/sound/accumulator-working.ogg", volume = 0.4, modifiers = volume_multiplier("main-menu", 1.44)},
          match_volume_to_activity = true,
          activity_to_volume_modifiers = {offset = 2, inverted = true},
          fade_in_ticks = 4,
          fade_out_ticks = 20
        },
        {
          sound = {filename = "__base__/sound/accumulator-discharging.ogg", volume = 0.4, modifiers = volume_multiplier("main-menu", 1.44)},
          match_volume_to_activity = true,
          activity_to_volume_modifiers = {offset = 1},
          fade_in_ticks = 4,
          fade_out_ticks = 20
        }
      },
      idle_sound = {filename = "__base__/sound/accumulator-idle.ogg", volume = 0.35},
      max_sounds_per_type = 3,
      audible_distance_modifier = 0.5
    },

    circuit_connector = circuit_connector_definitions["accumulator"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,

    default_output_signal = {type = "virtual", name = "signal-A"}
  },
  {
    type = "storage-tank",
    name = "small-storage-tank",
    icon = "__outer_moons__/graphics/icons/small-storage-tank.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "small-storage-tank"},
    max_health = 250,
    corpse = "small-remnants",
    dying_explosion = "storage-tank-explosion",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "pipe",
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 1.35,
    icon_draw_specification = {scale = 0.75, shift = {0, -0.33}},
    fluid_box =
    {
      volume = 3000,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { direction = defines.direction.north, position = {0, 0} },
        { direction = defines.direction.east, position = {0, 0} },
        { direction = defines.direction.south, position = {0, 0} },
        { direction = defines.direction.west, position = {0, 0} }
      },
      hide_connection_info = true
    },
    two_direction_only = false,
    window_bounding_box = {{-0.1, -1.5 + 30 / 64}, {0.1, 0.5 - 46 / 64}},
    pictures =
    {
      picture =
      {
        sheets =
        {
          {
            filename = "__outer_moons__/graphics/entity/fluid-tanks/small-fluid-tank.png",
            priority = "extra-high",
            frames = 1,
            width = 64,
            height = 192,
            shift = util.by_pixel(0, -32),
            scale = 0.5
          },
          {
            filename = "__outer_moons__/graphics/entity/fluid-tanks/small-fluid-tank.png",
            priority = "extra-high",
            frames = 1,
            width = 160,
            height = 128,
			y = 192,
            shift = util.by_pixel(24, 0),
            scale = 0.5,
            draw_as_shadow = true
          }
        }
      },
      fluid_background =
      {
        filename = "__base__/graphics/entity/storage-tank/fluid-background.png",
        priority = "extra-high",
        width = 32,
        height = 15,
		scale = 0.8
      },
      window_background =
      {
        filename = "__base__/graphics/entity/storage-tank/window-background.png",
        priority = "extra-high",
        width = 34,
        height = 48,
        scale = 0.4
      },
      flow_sprite =
      {
        filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
        priority = "extra-high",
        width = 160,
        height = 20
      },
      gas_flow =
      {
        filename = "__base__/graphics/entity/pipe/steam.png",
        priority = "extra-high",
        line_length = 10,
        width = 48,
        height = 30,
        frame_count = 60,
        animation_speed = 0.25,
        scale = 0.4
      }
    },
    flow_length_in_ticks = 460*1.25,
    impact_category = "metal-large",
    open_sound = sounds.metal_large_open,
    close_sound = sounds.metal_large_close,
    working_sound =
    {
      sound = { filename = "__base__/sound/storage-tank.ogg", volume = 0.6 },
      match_volume_to_activity = true,
      audible_distance_modifier = 0.5,
      max_sounds_per_type = 3
    },

    circuit_connector = circuit_connector_definitions.create_vector(universal_connector_template, {
		{ variation = 26, main_offset = util.by_pixel(7, -5),
		  shadow_offset = util.by_pixel(7, -3), show_shadow = false },
		{ variation = 26, main_offset = util.by_pixel(7, -5),
		  shadow_offset = util.by_pixel(7, -3), show_shadow = false },
		{ variation = 26, main_offset = util.by_pixel(7, -5),
		  shadow_offset = util.by_pixel(7, -3), show_shadow = false },
		{ variation = 26, main_offset = util.by_pixel(7, -5),
		  shadow_offset = util.by_pixel(7, -3), show_shadow = false }
	}),
    circuit_wire_max_distance = default_circuit_wire_max_distance,
	heating_energy = "25kW",
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/storage-tank/storage-tank-reflection.png",
        priority = "extra-high",
        width = 24,
        height = 24,
        shift = util.by_pixel(5, 35),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  {
    type = "storage-tank",
    name = "large-storage-tank",
    icon = "__outer_moons__/graphics/icons/large-storage-tank.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "large-storage-tank"},
    max_health = 800,
    corpse = "big-remnants",
    dying_explosion = "storage-tank-explosion",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    fast_replaceable_group = "large-storage-tank",
    damaged_trigger_effect = hit_effects.entity(),
    icon_draw_specification = {scale = 2, shift = {0, -0.25}},
    fluid_box =
    {
      volume = 100000,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { direction = defines.direction.north, position = {-2, -2} },
		{ direction = defines.direction.north, position = { 2, -2} },
		{ direction = defines.direction.east,  position = { 2, -2} },
		{ direction = defines.direction.east,  position = { 2,  2} },
		{ direction = defines.direction.south, position = { 2,  2} },
		{ direction = defines.direction.south, position = {-2,  2} },
		{ direction = defines.direction.west,  position = {-2,  2} },
		{ direction = defines.direction.west,  position = {-2, -2} }
      },
      hide_connection_info = true
    },
    two_direction_only = true,
    window_bounding_box = {{-0.2, 0.5 + 24 / 64}, {0.2, 2.5 - 41 / 64}},
    pictures =
    {
      picture =
      {
        sheets =
        {
          {
            filename = "__outer_moons__/graphics/entity/fluid-tanks/large-fluid-tank.png",
            priority = "extra-high",
            frames = 1,
            width = 320,
            height = 384,
            shift = util.by_pixel(0, -16),
            scale = 0.5
          },
          {
            filename = "__outer_moons__/graphics/entity/fluid-tanks/large-fluid-tank.png",
            priority = "extra-high",
            frames = 1,
            width = 384,
            height = 352,
			y = 384,
            shift = util.by_pixel(16, 8),
            scale = 0.5,
            draw_as_shadow = true
          }
        }
      },
      fluid_background =
      {
        filename = "__base__/graphics/entity/storage-tank/fluid-background.png",
        priority = "extra-high",
        width = 32,
        height = 15,		
		scale = 0.8
      },
      window_background =
      {
        filename = "__base__/graphics/entity/storage-tank/window-background.png",
        priority = "extra-high",
        width = 34,
        height = 48,
        scale = 0.6
      },
      flow_sprite =
      {
        filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
        priority = "extra-high",
        width = 160,
        height = 20
      },
      gas_flow =
      {
        filename = "__base__/graphics/entity/pipe/steam.png",
        priority = "extra-high",
        line_length = 10,
        width = 48,
        height = 30,
        frame_count = 60,
        animation_speed = 0.25,
        scale = 0.6
      }
    },
    flow_length_in_ticks = 690*0.833,
    impact_category = "metal-large",
    open_sound = sounds.metal_large_open,
    close_sound = sounds.metal_large_close,
    working_sound =
    {
      sound = { filename = "__base__/sound/storage-tank.ogg", volume = 0.6 },
      match_volume_to_activity = true,
      audible_distance_modifier = 0.5,
      max_sounds_per_type = 3
    },

    circuit_connector = circuit_connector_definitions.create_vector(universal_connector_template, {
		{ variation = 25, main_offset = util.by_pixel(-61.5, 33.5),
		  shadow_offset = util.by_pixel(-61.5, 45.5), show_shadow = false },
		{ variation = 25, main_offset = util.by_pixel(-61.5, 33.5),
		  shadow_offset = util.by_pixel(-61.5, 45.5), show_shadow = false },
		{ variation = 25, main_offset = util.by_pixel(-61.5, 33.5),
		  shadow_offset = util.by_pixel(-61.5, 45.5), show_shadow = false },
		{ variation = 25, main_offset = util.by_pixel(-61.5, 33.5),
		  shadow_offset = util.by_pixel(-61.5, 45.5), show_shadow = false }
	}),
    circuit_wire_max_distance = default_circuit_wire_max_distance,
	heating_energy = "250kW",
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/storage-tank/storage-tank-reflection.png",
        priority = "extra-high",
        width = 24,
        height = 24,
        shift = util.by_pixel(5, 35),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  {
        type = "furnace",
        name = "scrubber",
        icon = "__outer_moons__/graphics/icons/scrubber.png",
        flags = { "placeable-neutral", "placeable-player", "player-creation" },
        minable = { mining_time = 0.2, result = "scrubber" },
        fast_replaceable_group = "scrubber",
        max_health = 350,
        corpse = "big-remnants",
        dying_explosion = "big-explosion",
        resistances = { { type = "fire", percent = 70 } },
        collision_box = { { -1.2, -1.2 }, { 1.2, 1.2 } },
        selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
        damaged_trigger_effect = hit_effects.entity(),
        module_slots = 0,
        allowed_effects = { "consumption", "speed" },
        crafting_categories = { "scrubbing" },
        crafting_speed = 1,
        source_inventory_size = 0,
        result_inventory_size = 0,
        show_recipe_icon = false,
        show_recipe_icon_on_map = false,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = {
                ["pollution"] = -30,
            },
        },
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 150,
			max = 5000
		  }
		},
        energy_usage = "150kW",
        impact_category = "metal",
        open_sound = sounds.machine_open,
        close_sound = sounds.machine_close,
        working_sound = {
            apparent_volume = 1,
            idle_sound = { filename = "__base__/sound/idle1.ogg" },
            sound = { filename = "__outer_moons__/sound/scrubber.ogg" },
            audible_distance_modifier = 0.5,
            fade_in_ticks = 4,
            fade_out_ticks = 20,
        },
		fluid_boxes =
		{
		  {
			production_type = "output",
			pipe_picture = util.empty_sprite(),
			pipe_covers = pipecoverspictures(),
			volume = 100,
			pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {0, -1} }},
			secondary_draw_orders = { north = -1 }
		  },
		  {
			production_type = "output",
			pipe_picture = util.empty_sprite(),
			pipe_covers = pipecoverspictures(),
			volume = 100,
			pipe_connections = {{ flow_direction="output", direction = defines.direction.east, position = {1, 0} }},
			secondary_draw_orders = { north = -1 }
		  },
		  {
			production_type = "output",
			pipe_picture = util.empty_sprite(),
			pipe_covers = pipecoverspictures(),
			volume = 100,
			pipe_connections = {{ flow_direction="output", direction = defines.direction.west, position = {-1, 0} }},
			secondary_draw_orders = { north = -1 }
		  },
		  {
			production_type = "output",
			pipe_picture = util.empty_sprite(),
			pipe_covers = pipecoverspictures(),
			volume = 100,
			pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {0, 1} }},
			secondary_draw_orders = { north = -1 }
		  }
		},
		fluid_boxes_off_when_no_fluid_recipe = true,
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename = "__outer_moons__/graphics/entity/scrubber/scrubber-hr-shadow.png",
                        priority = "high",
                        size = { 400, 350 },
                        shift = { 0, -0.4 },
                        scale = 0.5,
                        line_length = 1,
                        repeat_count = 60,
                        draw_as_shadow = true,
                        animation_speed = 0.3,
                    },
                    {
                        filename = "__outer_moons__/graphics/entity/scrubber/scrubber-hr-animation-1.png",
                        size = { 210, 290 },
                        shift = { 0, -0.4 },
                        scale = 0.5,
                        line_length = 8,
                        frame_count = 60,
                        animation_speed = 0.3,
                    },
                },
            },
        },
    },
  --Corpse
  {
    type = "corpse",
    name = "solar-array-remnants",
    icon = "__outer_moons__/graphics/icons/solar-array.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "energy-remnants",
    order = "a-c-a",
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
    tile_width = 9,
    tile_height = 9,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = 
    {
      filename = "__outer_moons__/graphics/entity/solar-array/solar-array-remnants.png",
      line_length = 1,
      width = 624,
      height = 578,
      frame_count = 1,
      direction_count = 1,
      shift = util.by_pixel(10, 0),
      scale = 0.5
    }
  },
})
