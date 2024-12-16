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


data:extend({
  
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
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    drawing_box = {{-2.5, -2.8}, {2.5, 2.6}},
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
                    scale = 0.45,
                },
                {
                    priority = "high",
                    width = 360,
                    height = 350,
                    frame_count = 80,
                    animation_speed = 1,
                    scale = 0.45,
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
                    scale = 0.45,
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
    crafting_categories = {"convecting"},
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
    crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid", "advanced-assembly"},

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
    name = "arc-furnace",
    icon = "__outer_moons__/graphics/icons/arc-furnace.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "arc-furnace"},
	--order = "d[arc-furnace]",
	effect_receiver = { base_effect = { productivity = 0.5 }},
	--source_inventory_size = 3,
    max_health = 350,
	corpse = "big-remnants",
    dying_explosion = "massive-explosion",
    icon_draw_specification = {shift = {0, -0.3}},
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["foundry"],
    alert_icon_shift = util.by_pixel(0, -12),
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        --enable_working_visualisations = { "input-pipe" },
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {-1, 2} }}
      },
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        --pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        --enable_working_visualisations = { "input-pipe" },
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {1, 2} }}
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        --pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        --enable_working_visualisations = { "output-pipe" },
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {-1, -2} }}
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        --enable_working_visualisations = { "output-pipe" },
        volume = 100,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {1, -2} }}
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
	collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
	selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    drawing_box = {{-2.5, -2.8}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__outer_moons__/graphics/entity/arc-furnace/arc-furnace-hr-shadow.png",
                    priority = "high",
                    size = { 600, 400 },
                    shift = { 0, 0 },
                    scale = 0.5,
                    line_length = 1,
                    frame_count = 1,
                    repeat_count = 40,
                    draw_as_shadow = true,
                    animation_speed = 0.25,
                },
                {
                    filename = "__outer_moons__/graphics/entity/arc-furnace/arc-furnace-hr-structure.png",
                    size = { 320, 320 },
                    shift = { 0, 0 },
                    scale = 0.5,
                    line_length = 1,
                    frame_count = 1,
                    repeat_count = 40,
                    animation_speed = 0.25,
                },
            },
        },
        working_visualisations = {
            {
                fadeout = true,
                secondary_draw_order = 1,
                animation = {
                    layers = {
                        {
                            filename = "__outer_moons__/graphics/entity/arc-furnace/arc-furnace-hr-animation-emission-1.png",
                            size = { 320, 320 },
                            shift = { 0, 0 },
                            scale = 0.5,
                            line_length = 8,
                            lines_per_file = 8,
                            frame_count = 40,
                            draw_as_glow = true,
                            blend_mode = "additive",
                            animation_speed = 0.25,
                        },
                    }
                },
            },
        },

        reset_animation_when_frozen = true,
		frozen_patch = { 
			--tint = {0.5, 0.5, 0.8},
			--tint_as_overlay = true,
			priority = "extra-high",
			filename = "__outer_moons__/graphics/entity/arc-furnace/arc-furnace-frozen.png",
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
      sound = {filename = "__base__/sound/electric-furnace.ogg", volume = 0.6},
      apparent_volume = 0.3,
    },
    crafting_categories = {"smelting", "advanced-smelting"},

    crafting_speed = 2,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 1 }
    },
    energy_usage = "360kW",	
	heating_energy = "100kW",
    module_slots = 4,
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
    crafting_categories = {"metallurgy", "pressing", "crafting-with-fluid-or-metallurgy", "metallurgy-or-assembling"},
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
  }
})
