local hit_effects = require("__base__.prototypes.entity.hit-effects")

data:extend(
{
  {
    type = "reactor",
    name = "radioisotope-thermal-generator",
    icon  = "__pbnuclear__/graphics/icons/radioisotope-thermal-generator.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "nuclear-reactor"},
    fast_replaceable_group = "reactor",
    max_health = 500,
    corpse = "nuclear-reactor-remnants",
    dying_explosion = "nuclear-reactor-explosion",
    consumption = "4MW",
    neighbour_bonus = 1,
    energy_source =
    {
      type = "burner",
      fuel_categories = {"nuclear"},
      effectivity = 2,
      fuel_inventory_size = 1,
      burnt_inventory_size = 1,
      light_flicker =
      {
        color = {0,0,0},
        minimum_intensity = 0.7,
        maximum_intensity = 0.95
      }
    },
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    lower_layer_picture =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-pipes.png",
      width = 320,
      height = 316,
      scale = 0.5,
      shift = util.by_pixel(-1, -5)
    },
    heat_lower_layer_picture = apply_heat_pipe_glow
    {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-pipes-heated.png",
      width = 320,
      height = 316,
      scale = 0.5,
      shift = util.by_pixel(-0.5, -4.5)
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/nuclear-reactor/reactor.png",
          width = 302,
          height = 318,
          scale = 0.5,
          shift = util.by_pixel(-5, -7)
        },
        {
          filename = "__base__/graphics/entity/nuclear-reactor/reactor-shadow.png",
          width = 525,
          height = 323,
          scale = 0.5,
          shift = { 1.625, 0 },
          draw_as_shadow = true
        }
      }
    },

    working_light_picture =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-lights-color.png",
      blend_mode = "additive",
      draw_as_glow = true,
      width = 320,
      height = 320,
      scale = 0.5,
      shift = { -0.03125, -0.1875 },
    },

    heat_buffer =
    {
      max_temperature = 1000,
      specific_heat = "10MJ",
      max_transfer = "10GW",
      minimum_glow_temperature = 350,
      connections =
      {
        {
          position = {-2, -2},
          direction = defines.direction.north
        },
        {
          position = {0, -2},
          direction = defines.direction.north
        },
        {
          position = {2, -2},
          direction = defines.direction.north
        },
        {
          position = {2, -2},
          direction = defines.direction.east
        },
        {
          position = {2, 0},
          direction = defines.direction.east
        },
        {
          position = {2, 2},
          direction = defines.direction.east
        },
        {
          position = {2, 2},
          direction = defines.direction.south
        },
        {
          position = {0, 2},
          direction = defines.direction.south
        },
        {
          position = {-2, 2},
          direction = defines.direction.south
        },
        {
          position = {-2, 2},
          direction = defines.direction.west
        },
        {
          position = {-2, 0},
          direction = defines.direction.west
        },
        {
          position = {-2, -2},
          direction = defines.direction.west
        }
      },

      heat_picture = apply_heat_pipe_glow
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-heated.png",
        width = 216,
        height = 256,
        scale = 0.5,
        shift = util.by_pixel(3, -6.5)
      },
    },

    connection_patches_connected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches.png",
        width = 64,
        height = 64,
        variation_count = 12,
        scale = 0.5
      }
    },

    connection_patches_disconnected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches.png",
        width = 64,
        height = 64,
        variation_count = 12,
        y = 64,
        scale = 0.5
      }
    },

    heat_connection_patches_connected =
    {
      sheet = apply_heat_pipe_glow
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches-heated.png",
        width = 64,
        height = 64,
        variation_count = 12,
        scale = 0.5
      }
    },

    heat_connection_patches_disconnected =
    {
      sheet = apply_heat_pipe_glow
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches-heated.png",
        width = 64,
        height = 64,
        variation_count = 12,
        y = 64,
        scale = 0.5
      }
    },

    impact_category = "metal-large",
    open_sound = {filename = "__base__/sound/open-close/nuclear-open.ogg", volume = 0.8},
    close_sound = {filename = "__base__/sound/open-close/nuclear-close.ogg", volume = 0.8},
    working_sound =
    {
      sound = sound_variations("__base__/sound/nuclear-reactor", 2, 0.55, volume_multiplier("main-menu", 1.1) ),
      max_sounds_per_type = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },

    meltdown_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "atomic-rocket"
          }
        }
      }
    },

    default_temperature_signal = {type = "virtual", name = "signal-T"},
    circuit_wire_max_distance = reactor_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["nuclear-reactor"],
  },
  {
    type = "pump",
    name = "pump",
    icon = "__base__/graphics/icons/pump.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.2, result = "pump"},
    max_health = 180,
    fast_replaceable_group = "pipe",
    corpse = "pump-remnants",
    dying_explosion = "pump-explosion",
    collision_box = {{-0.29, -0.9}, {0.29, 0.9}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    icon_draw_specification = {scale = 0.5},
    working_sound =
    {
      sound = { filename = "__base__/sound/pump.ogg", volume = 0.3 },
      audible_distance_modifier = 0.5,
      max_sounds_per_type = 2
    },
    damaged_trigger_effect = hit_effects.entity(),
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
    fluid_box =
    {
      volume = 400,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { direction = defines.direction.north, position = {0, -0.5}, flow_direction = "output" },
        { direction = defines.direction.south, position = {0, 0.5}, flow_direction = "input" }
      }
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "1kW"
    },
    energy_usage = "29kW",
    pumping_speed = 20,
    impact_category = "metal",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,

    animations =
    {
      north =
      {
        filename = "__base__/graphics/entity/pump/pump-north.png",
        width = 103,
        height = 164,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(8, 3.5)
      },
      east =
      {
        filename = "__base__/graphics/entity/pump/pump-east.png",
        width = 130,
        height = 109,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(-0.5, 1.75)
      },

      south =
      {
        filename = "__base__/graphics/entity/pump/pump-south.png",
        width = 114,
        height = 160,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(12.5, -8)
      },
      west =
      {
        filename = "__base__/graphics/entity/pump/pump-west.png",
        width = 131,
        height = 111,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        animation_speed = 0.5,
        shift = util.by_pixel(-0.25, 1.25)
      }
    },

    fluid_wagon_connector_frame_count = 35,
    fluid_wagon_connector_alignment_tolerance = 2.0 / 32.0,

    fluid_wagon_connector_graphics = require("prototypes.entity.pump-connector"),

    fluid_animation =
    {
      north =
      {
        filename = "__base__/graphics/entity/pump/pump-north-liquid.png",
        apply_runtime_tint = true,
        width = 38,
        height = 22,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(-0.250, -16.750)
      },

      east =
      {
        filename = "__base__/graphics/entity/pump/pump-east-liquid.png",
        width = 35,
        height = 46,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(6.25, -8.5)
      },

      south =
      {
        filename = "__base__/graphics/entity/pump/pump-south-liquid.png",
        width = 38,
        height = 45,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(0.5, -9.25)
      },
      west =
      {
        filename = "__base__/graphics/entity/pump/pump-west-liquid.png",
        width = 35,
        height = 47,
        scale = 0.5,
        line_length =8,
        frame_count =32,
        shift = util.by_pixel(-6.5, -9.5)
      }
    },

    glass_pictures =
    {
      north =
      {
        filename = "__base__/graphics/entity/pump/pump-north-glass.png",
        width = 64,
        height = 128,
        scale = 0.5
      },
      east =
      {
        filename = "__base__/graphics/entity/pump/pump-east-glass.png",
        width = 128,
        height = 192,
        scale = 0.5
      },
      south =
      {
        filename = "__base__/graphics/entity/pump/pump-south-glass.png",
        width = 64,
        height = 128,
        scale = 0.5
      },
      west =
      {
        filename = "__base__/graphics/entity/pump/pump-west-glass.png",
        width = 192,
        height = 192,
        scale = 0.5,
        shift = util.by_pixel(-16, 0)
      }
    },

    circuit_connector = circuit_connector_definitions["pump"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
})