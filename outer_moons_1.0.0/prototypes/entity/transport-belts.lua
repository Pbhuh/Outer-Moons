require ("circuit-connector-sprites")
local meld = require("meld")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local simulations = require("__outer_moons__.prototypes.factoriopedia-simulations")

local tungsten_belt_animation_set =
{
  alternate = true,
  animation_set =
  {
    filename = "__outer_moons__/graphics/entity/turbo-transport-belt/turbo-transport-belt.png",
    priority = "extra-high",
    size = 128,
    scale = 0.5,
    frame_count = 64,
    direction_count = 20
  },
  frozen_patch = {
    filename = "__outer_moons__/graphics/entity/turbo-transport-belt/turbo-transport-belt-frozen.png",
    priority = "extra-high",
    size = 128,
    scale = 0.5,
    line_length = 1,
    direction_count = 20
  }
}

local hyper_belt_animation_set =
{
  alternate = true,
  animation_set =
  {
    filename = "__outer_moons__/graphics/entity/hyper-transport-belt/hyper-transport-belt.png",
    priority = "extra-high",
    size = 128,
    scale = 0.5,
    frame_count = 64,
    direction_count = 20
  },
  frozen_patch = {
    filename = "__outer_moons__/graphics/entity/hyper-transport-belt/hyper-transport-belt-frozen.png",
    priority = "extra-high",
    size = 128,
    scale = 0.5,
    line_length = 1,
    direction_count = 20
  }
}

local vacuum_belt_animation_set =
{
  alternate = true,
  animation_set =
  {
    filename = "__outer_moons__/graphics/entity/vacuum-transport-belt/vacuum-transport-belt.png",
    priority = "extra-high",
    size = 128,
    scale = 0.5,
    frame_count = 64,
    direction_count = 20
  },
  frozen_patch = {
    filename = "__outer_moons__/graphics/entity/vacuum-transport-belt/vacuum-transport-belt-frozen.png",
    priority = "extra-high",
    size = 128,
    scale = 0.5,
    line_length = 1,
    direction_count = 20
  }
}

meld(tungsten_belt_animation_set, belt_reader_gfx)
meld(hyper_belt_animation_set, belt_reader_gfx)
meld(vacuum_belt_animation_set, belt_reader_gfx)

data.raw["transport-belt"]["express-transport-belt"].next_upgrade = "turbo-transport-belt";
data.raw["underground-belt"]["express-underground-belt"].next_upgrade = "turbo-underground-belt";
data.raw["splitter"]["express-splitter"].next_upgrade = "turbo-splitter";

data:extend
{
  {
    type = "transport-belt",
    name = "turbo-transport-belt",
    icon = "__outer_moons__/graphics/icons/turbo-transport-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "turbo-transport-belt"},
    max_health = 180,
    corpse = "turbo-transport-belt-remnants",
    dying_explosion = "turbo-transport-belt-explosion",
	--next_upgrade = "hyper-transport-belt",
    resistances =
    {
      {
        type = "fire",
        percent = 50
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.transport_belt_open,
    close_sound = sounds.transport_belt_close,
    working_sound =
    {
      sound = { filename = "__base__/sound/express-transport-belt.ogg", volume = 0.3 },
      persistent = true,
      use_doppler_shift = false
    },
    animation_speed_coefficient = 32,
    belt_animation_set = tungsten_belt_animation_set,
    related_underground_belt = "turbo-underground-belt",
    fast_replaceable_group = "transport-belt",
    speed = 0.125,
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_connector = circuit_connector_definitions["belt"],
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance,
    heating_energy = "10kW",
  },
  {
    type = "underground-belt",
    name = "turbo-underground-belt",
    icon = "__outer_moons__/graphics/icons/turbo-underground-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "turbo-underground-belt"},
    max_health = 180,
    corpse = "turbo-underground-belt-remnants",
    dying_explosion = "turbo-underground-belt-explosion",
	--next_upgrade = "hyper-underground-belt",
    factoriopedia_simulation = simulations.factoriopedia_turbo_underground_belt,
    max_distance = 11,
    heating_energy = "200kW",
    underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    underground_remove_belts_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines-remove.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    resistances =
    {
      {
        type = "fire",
        percent = 60
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    underground_collision_mask = {layers={lava_tile=true, empty_space=true}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound = { filename = "__base__/sound/express-underground-belt.ogg", volume = 0.35 },
      max_sounds_per_type = 2,
      audible_distance_modifier = 0.5,
      persistent = true,
      use_doppler_shift = false
    },
    animation_speed_coefficient = 32,
    belt_animation_set = tungsten_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    speed = 0.125,
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__outer_moons__/graphics/entity/turbo-underground-belt/turbo-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192,
          scale = 0.5
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__outer_moons__/graphics/entity/turbo-underground-belt/turbo-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height =192,
          scale = 0.5
        }
      },
      direction_in_side_loading =
      {
        sheet =
        {
          filename = "__outer_moons__/graphics/entity/turbo-underground-belt/turbo-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192*3,
          scale = 0.5
        }
      },
      direction_out_side_loading =
      {
        sheet =
        {
          filename = "__outer_moons__/graphics/entity/turbo-underground-belt/turbo-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192*2,
          scale = 0.5
        }
      },
      back_patch =
      {
        sheet =
        {
          filename = "__outer_moons__/graphics/entity/turbo-underground-belt/turbo-underground-belt-structure-back-patch.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      },
      front_patch =
      {
        sheet =
        {
          filename = "__outer_moons__/graphics/entity/turbo-underground-belt/turbo-underground-belt-structure-front-patch.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      },
      frozen_patch_in =
      {
        sheet =
        {
          filename = "__space-age__/graphics/entity/frozen/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192,
          scale = 0.5
        }
      },
      frozen_patch_out =
      {
        sheet =
        {
          filename = "__space-age__/graphics/entity/frozen/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      }
    }
  },
  {
    type = "splitter",
    name = "turbo-splitter",
    icon = "__outer_moons__/graphics/icons/turbo-splitter.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "turbo-splitter"},
    max_health = 200,
    corpse = "turbo-splitter-remnants",
    dying_explosion = "turbo-splitter-explosion",
	--next_upgrade = "hyper-splitter",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.9, -0.4}, {0.9, 0.4}},
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    animation_speed_coefficient = 32,
    structure_animation_speed_coefficient = 1.2,
    structure_animation_movement_cooldown = 10,
    icon_draw_specification = {scale = 0.5},
    belt_animation_set = tungsten_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    speed = 0.125,
    working_sound = sounds.express_splitter,
    related_transport_belt = "turbo-transport-belt",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    heating_energy = "30kW",
    structure =
    {
      north =
      util.sprite_load("__outer_moons__/graphics/entity/turbo-splitter/turbo-splitter-north",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      ),
      east =
      util.sprite_load("__outer_moons__/graphics/entity/turbo-splitter/turbo-splitter-east",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      ),
      south =
      util.sprite_load("__outer_moons__/graphics/entity/turbo-splitter/turbo-splitter-south",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      ),
      west =
      util.sprite_load("__outer_moons__/graphics/entity/turbo-splitter/turbo-splitter-west",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      ),
    },
    structure_patch =
    {
      north = util.empty_sprite(),
      east =
      util.sprite_load("__outer_moons__/graphics/entity/turbo-splitter/turbo-splitter-east-top_patch",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      ),
      south = util.empty_sprite(),
      west =
      util.sprite_load("__outer_moons__/graphics/entity/turbo-splitter/turbo-splitter-west-top_patch",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      )
    },
    frozen_patch =
    {
      north =
      {
        filename = "__space-age__/graphics/entity/frozen/splitter/splitter.png",
        priority = "extra-high",
        width = 192,
        height = 128,
        scale = 0.5
      },
      east =
      {
        filename = "__space-age__/graphics/entity/frozen/splitter/splitter.png",
        priority = "extra-high",
        x = 192,
        width = 128,
        height = 192,
        scale = 0.5
      },
      south =
      {
        filename = "__space-age__/graphics/entity/frozen/splitter/splitter.png",
        priority = "extra-high",
        x = 192 + 128,
        width = 192,
        height = 128,
        scale = 0.5
      },
      west =
      {
        filename = "__space-age__/graphics/entity/frozen/splitter/splitter.png",
        priority = "extra-high",
        x = 192 * 2 + 128,
        width = 128,
        height = 192,
        scale = 0.5
      }
    }
  },
  {
    type = "loader",
    name = "turbo-loader",
    icon = "__outer_moons__/graphics/icons/turbo-loader.png",
    flags = {"placeable-neutral", "player-creation"},
    hidden = true,
    minable = {mining_time = 0.1, result = "turbo-loader"},
    max_health = 180,
    filter_count = 5,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = sounds.express_loader,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.4, -0.9}, {0.4, 0.9}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    animation_speed_coefficient = 32,
    belt_animation_set = tungsten_belt_animation_set,
    fast_replaceable_group = "loader",
    speed = 0.125,
    structure_render_layer = "lower-object",
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64,
          y = 64
        }
      }
    },
    circuit_connector = circuit_connector_definitions["loader-1x2"],
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance,
  },
  {
    type = "transport-belt",
    name = "hyper-transport-belt",
    icon = "__outer_moons__/graphics/icons/hyper-transport-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "hyper-transport-belt"},
    max_health = 190,
    corpse = "hyper-transport-belt-remnants",
    dying_explosion = "turbo-transport-belt-explosion",
	--next_upgrade = "vacuum-transport-belt",
    resistances =
    {
      {
        type = "fire",
        percent = 50
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.transport_belt_open,
    close_sound = sounds.transport_belt_close,
    working_sound =
    {
      sound = { filename = "__base__/sound/express-transport-belt.ogg", volume = 0.3 },
      persistent = true,
      use_doppler_shift = false
    },
    animation_speed_coefficient = 32,
    belt_animation_set = hyper_belt_animation_set,
    related_underground_belt = "hyper-underground-belt",
    fast_replaceable_group = "transport-belt",
    speed = 0.15625,
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_connector = circuit_connector_definitions["belt"],
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance,
    heating_energy = "10kW",
  },
  {
    type = "underground-belt",
    name = "hyper-underground-belt",
    icon = "__outer_moons__/graphics/icons/hyper-underground-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "hyper-underground-belt"},
    max_health = 190,
    corpse = "hyper-underground-belt-remnants",
    dying_explosion = "turbo-underground-belt-explosion",
	--next_upgrade = "vacuum-underground-belt",
    factoriopedia_simulation = simulations.factoriopedia_hyper_underground_belt,
    max_distance = 13,
    heating_energy = "200kW",
    underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    underground_remove_belts_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines-remove.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    resistances =
    {
      {
        type = "fire",
        percent = 60
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    underground_collision_mask = {layers={lava_tile=true, empty_space=true}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound = { filename = "__base__/sound/express-underground-belt.ogg", volume = 0.35 },
      max_sounds_per_type = 2,
      audible_distance_modifier = 0.5,
      persistent = true,
      use_doppler_shift = false
    },
    animation_speed_coefficient = 32,
    belt_animation_set = hyper_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    speed = 0.15625,
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__outer_moons__/graphics/entity/hyper-underground-belt/hyper-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192,
          scale = 0.5
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__outer_moons__/graphics/entity/hyper-underground-belt/hyper-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height =192,
          scale = 0.5
        }
      },
      direction_in_side_loading =
      {
        sheet =
        {
          filename = "__outer_moons__/graphics/entity/hyper-underground-belt/hyper-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192*3,
          scale = 0.5
        }
      },
      direction_out_side_loading =
      {
        sheet =
        {
          filename = "__outer_moons__/graphics/entity/hyper-underground-belt/hyper-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192*2,
          scale = 0.5
        }
      },
      back_patch =
      {
        sheet =
        {
          filename = "__outer_moons__/graphics/entity/hyper-underground-belt/hyper-underground-belt-structure-back-patch.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      },
      front_patch =
      {
        sheet =
        {
          filename = "__outer_moons__/graphics/entity/hyper-underground-belt/hyper-underground-belt-structure-front-patch.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      },
      frozen_patch_in =
      {
        sheet =
        {
          filename = "__space-age__/graphics/entity/frozen/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192,
          scale = 0.5
        }
      },
      frozen_patch_out =
      {
        sheet =
        {
          filename = "__space-age__/graphics/entity/frozen/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      }
    }
  },
  {
    type = "splitter",
    name = "hyper-splitter",
    icon = "__outer_moons__/graphics/icons/hyper-splitter.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "hyper-splitter"},
    max_health = 210,
    corpse = "hyper-splitter-remnants",
    dying_explosion = "turbo-splitter-explosion",
	--next_upgrade = "vacuum-splitter",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.9, -0.4}, {0.9, 0.4}},
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    animation_speed_coefficient = 32,
    structure_animation_speed_coefficient = 1.2,
    structure_animation_movement_cooldown = 10,
    icon_draw_specification = {scale = 0.5},
    belt_animation_set = hyper_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    speed = 0.15625,
    working_sound = sounds.express_splitter,
    related_transport_belt = "hyper-transport-belt",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    heating_energy = "30kW",
    structure =
    {
      north =
      util.sprite_load("__outer_moons__/graphics/entity/hyper-splitter/hyper-splitter-north",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      ),
      east =
      util.sprite_load("__outer_moons__/graphics/entity/hyper-splitter/hyper-splitter-east",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      ),
      south =
      util.sprite_load("__outer_moons__/graphics/entity/hyper-splitter/hyper-splitter-south",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      ),
      west =
      util.sprite_load("__outer_moons__/graphics/entity/hyper-splitter/hyper-splitter-west",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      ),
    },
    structure_patch =
    {
      north = util.empty_sprite(),
      east =
      util.sprite_load("__outer_moons__/graphics/entity/hyper-splitter/hyper-splitter-east-top_patch",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      ),
      south = util.empty_sprite(),
      west =
      util.sprite_load("__outer_moons__/graphics/entity/hyper-splitter/hyper-splitter-west-top_patch",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      )
    },
    frozen_patch =
    {
      north =
      {
        filename = "__space-age__/graphics/entity/frozen/splitter/splitter.png",
        priority = "extra-high",
        width = 192,
        height = 128,
        scale = 0.5
      },
      east =
      {
        filename = "__space-age__/graphics/entity/frozen/splitter/splitter.png",
        priority = "extra-high",
        x = 192,
        width = 128,
        height = 192,
        scale = 0.5
      },
      south =
      {
        filename = "__space-age__/graphics/entity/frozen/splitter/splitter.png",
        priority = "extra-high",
        x = 192 + 128,
        width = 192,
        height = 128,
        scale = 0.5
      },
      west =
      {
        filename = "__space-age__/graphics/entity/frozen/splitter/splitter.png",
        priority = "extra-high",
        x = 192 * 2 + 128,
        width = 128,
        height = 192,
        scale = 0.5
      }
    }
  },
  {
    type = "loader",
    name = "hyper-loader",
    icon = "__outer_moons__/graphics/icons/hyper-loader.png",
    flags = {"placeable-neutral", "player-creation"},
    hidden = true,
    minable = {mining_time = 0.1, result = "hyper-loader"},
    max_health = 190,
    filter_count = 5,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = sounds.express_loader,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.4, -0.9}, {0.4, 0.9}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    animation_speed_coefficient = 32,
    belt_animation_set = hyper_belt_animation_set,
    fast_replaceable_group = "loader",
    speed = 0.15625,
    structure_render_layer = "lower-object",
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64,
          y = 64
        }
      }
    },
    circuit_connector = circuit_connector_definitions["loader-1x2"],
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance,
  },
  {
    type = "transport-belt",
    name = "vacuum-transport-belt",
    icon = "__outer_moons__/graphics/icons/vacuum-transport-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "vacuum-transport-belt"},
    max_health = 200,
    corpse = "vacuum-transport-belt-remnants",
    dying_explosion = "turbo-transport-belt-explosion",
	--next_upgrade = "vacuum-transport-belt",
    resistances =
    {
      {
        type = "fire",
        percent = 50
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.transport_belt_open,
    close_sound = sounds.transport_belt_close,
    working_sound =
    {
      sound = { filename = "__base__/sound/express-transport-belt.ogg", volume = 0.3 },
      persistent = true,
      use_doppler_shift = false
    },
    animation_speed_coefficient = 32,
    belt_animation_set = vacuum_belt_animation_set,
    related_underground_belt = "vacuum-underground-belt",
    fast_replaceable_group = "transport-belt",
    speed = 0.1875,
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_connector = circuit_connector_definitions["belt"],
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance,
    heating_energy = "10kW",
  },
  {
    type = "underground-belt",
    name = "vacuum-underground-belt",
    icon = "__outer_moons__/graphics/icons/vacuum-underground-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "vacuum-underground-belt"},
    max_health = 200,
    corpse = "vacuum-underground-belt-remnants",
    dying_explosion = "turbo-underground-belt-explosion",
    factoriopedia_simulation = simulations.factoriopedia_vacuum_underground_belt,
    max_distance = 15,
    heating_energy = "200kW",
    underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    underground_remove_belts_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines-remove.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    resistances =
    {
      {
        type = "fire",
        percent = 60
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    underground_collision_mask = {layers={lava_tile=true, empty_space=true}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound = { filename = "__base__/sound/express-underground-belt.ogg", volume = 0.35 },
      max_sounds_per_type = 2,
      audible_distance_modifier = 0.5,
      persistent = true,
      use_doppler_shift = false
    },
    animation_speed_coefficient = 32,
    belt_animation_set = vacuum_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    speed = 0.1875,
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__outer_moons__/graphics/entity/vacuum-underground-belt/vacuum-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192,
          scale = 0.5
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__outer_moons__/graphics/entity/vacuum-underground-belt/vacuum-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height =192,
          scale = 0.5
        }
      },
      direction_in_side_loading =
      {
        sheet =
        {
          filename = "__outer_moons__/graphics/entity/vacuum-underground-belt/vacuum-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192*3,
          scale = 0.5
        }
      },
      direction_out_side_loading =
      {
        sheet =
        {
          filename = "__outer_moons__/graphics/entity/vacuum-underground-belt/vacuum-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192*2,
          scale = 0.5
        }
      },
      back_patch =
      {
        sheet =
        {
          filename = "__outer_moons__/graphics/entity/vacuum-underground-belt/vacuum-underground-belt-structure-back-patch.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      },
      front_patch =
      {
        sheet =
        {
          filename = "__outer_moons__/graphics/entity/vacuum-underground-belt/vacuum-underground-belt-structure-front-patch.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      },
      frozen_patch_in =
      {
        sheet =
        {
          filename = "__space-age__/graphics/entity/frozen/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192,
          scale = 0.5
        }
      },
      frozen_patch_out =
      {
        sheet =
        {
          filename = "__space-age__/graphics/entity/frozen/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      }
    }
  },
  {
    type = "splitter",
    name = "vacuum-splitter",
    icon = "__outer_moons__/graphics/icons/vacuum-splitter.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "vacuum-splitter"},
    max_health = 220,
    corpse = "vacuum-splitter-remnants",
    dying_explosion = "turbo-splitter-explosion",
	--next_upgrade = "vacuum-splitter",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.9, -0.4}, {0.9, 0.4}},
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    animation_speed_coefficient = 32,
    structure_animation_speed_coefficient = 1.2,
    structure_animation_movement_cooldown = 10,
    icon_draw_specification = {scale = 0.5},
    belt_animation_set = vacuum_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    speed = 0.1875,
    working_sound = sounds.express_splitter,
    related_transport_belt = "vacuum-transport-belt",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    heating_energy = "30kW",
    structure =
    {
      north =
      util.sprite_load("__outer_moons__/graphics/entity/vacuum-splitter/vacuum-splitter-north",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      ),
      east =
      util.sprite_load("__outer_moons__/graphics/entity/vacuum-splitter/vacuum-splitter-east",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      ),
      south =
      util.sprite_load("__outer_moons__/graphics/entity/vacuum-splitter/vacuum-splitter-south",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      ),
      west =
      util.sprite_load("__outer_moons__/graphics/entity/vacuum-splitter/vacuum-splitter-west",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      ),
    },
    structure_patch =
    {
      north = util.empty_sprite(),
      east =
      util.sprite_load("__outer_moons__/graphics/entity/vacuum-splitter/vacuum-splitter-east-top_patch",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      ),
      south = util.empty_sprite(),
      west =
      util.sprite_load("__outer_moons__/graphics/entity/vacuum-splitter/vacuum-splitter-west-top_patch",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      )
    },
    frozen_patch =
    {
      north =
      {
        filename = "__space-age__/graphics/entity/frozen/splitter/splitter.png",
        priority = "extra-high",
        width = 192,
        height = 128,
        scale = 0.5
      },
      east =
      {
        filename = "__space-age__/graphics/entity/frozen/splitter/splitter.png",
        priority = "extra-high",
        x = 192,
        width = 128,
        height = 192,
        scale = 0.5
      },
      south =
      {
        filename = "__space-age__/graphics/entity/frozen/splitter/splitter.png",
        priority = "extra-high",
        x = 192 + 128,
        width = 192,
        height = 128,
        scale = 0.5
      },
      west =
      {
        filename = "__space-age__/graphics/entity/frozen/splitter/splitter.png",
        priority = "extra-high",
        x = 192 * 2 + 128,
        width = 128,
        height = 192,
        scale = 0.5
      }
    }
  },
  {
    type = "loader",
    name = "vacuum-loader",
    icon = "__outer_moons__/graphics/icons/vacuum-loader.png",
    flags = {"placeable-neutral", "player-creation"},
    hidden = true,
    minable = {mining_time = 0.1, result = "vacuum-loader"},
    max_health = 200,
    filter_count = 5,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = sounds.express_loader,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.4, -0.9}, {0.4, 0.9}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    animation_speed_coefficient = 32,
    belt_animation_set = vacuum_belt_animation_set,
    fast_replaceable_group = "loader",
    speed = 0.1875,
    structure_render_layer = "lower-object",
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64,
          y = 64
        }
      }
    },
    circuit_connector = circuit_connector_definitions["loader-1x2"],
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance,
  }
}
