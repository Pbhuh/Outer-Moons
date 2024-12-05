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
	order = "g[convector]",
	fast_replaceable_group = "convector",
	module_slots = 2,
    max_health = 350,
	corpse = "big-remnants",
    dying_explosion = "medium-explosion",
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
                    scale = 0.5,
                },
                {
                    priority = "high",
                    width = 360,
                    height = 350,
                    frame_count = 80,
                    animation_speed = 1,
                    scale = 0.5,
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
                    scale = 0.5,
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
        reset_animation_when_frozen = true
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
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"}
  },
  
  {
    type = "assembling-machine",
    name = "adv-assembling-machine",
    icon = "__outer_moons__/graphics/icons/adv-assembler.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "adv-assembling-machine"},
	order = "d[adv-assembling-machine]",
	effect_receiver = { base_effect = { productivity = 0.5 }},
    max_health = 500,
	corpse = "big-remnants",
    dying_explosion = "medium-explosion",
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
		volume = 1000,
		pipe_connections = { { direction = defines.direction.north, flow_direction = "input", position = { 0, -2 } } },
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
		volume = 1000,
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
        reset_animation_when_frozen = true
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
    crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid"},

    crafting_speed = 1.5,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 1 }
    },
    energy_usage = "750kW",
    module_slots = 5,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"}
  },
})