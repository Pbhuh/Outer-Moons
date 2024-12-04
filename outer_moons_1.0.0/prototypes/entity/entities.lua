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
})