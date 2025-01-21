local hit_effects = require("__base__.prototypes.entity.hit-effects")

data:extend(
{
  {
    type = "burner-generator",
    name = "radiothermal-generator",
    icon  = "__outer_moons__/graphics/icons/RTG.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "radiothermal-generator"},
    fast_replaceable_group = "radiothermal-generator",
    max_health = 500,
    corpse = "big-remnants",
    dying_explosion = "nuclear-reactor-explosion",
	max_power_output = "250kW",
    consumption = "250kW",
    energy_source = {
		type = "electric",
		usage_priority = "secondary-output",
	},
    burner =
    {
      type = "burner",
      fuel_categories = {"radiothermal"},
      effectivity = 1,
      fuel_inventory_size = 1,
      burnt_inventory_size = 1,
    },
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
	
	always_draw_idle_animation = true,
	idle_animation = {
		layers = {
			{
				filename = "__outer_moons__/graphics/entity/RTG/RTG-hr-shadow.png",
				priority = "high",
				width = 900,
				height = 500,
				frame_count = 1,
				line_length = 1,
				repeat_count = 80,
				animation_speed = 0.5,
				shift = util.by_pixel_hr(0, -32),
				draw_as_shadow = true,
				scale = 0.4,
			},
			{
				priority = "high",
				width = 400,
				height = 480,
				frame_count = 80,
				shift = util.by_pixel_hr(0, -32),
				animation_speed = 0.41,
				scale = 0.4,
				stripes = {
					{
						filename = "__outer_moons__/graphics/entity/RTG/RTG-hr-animation-1.png",
						width_in_frames = 8,
						height_in_frames = 8,
					},
					{
						filename = "__outer_moons__/graphics/entity/RTG/RTG-hr-animation-2.png",
						width_in_frames = 8,
						height_in_frames = 2,
					},
				},
			},
		},
	},
	animation = {
				
		fadeout = true,
		secondary_draw_order = 1,
		layers = {
			{
				priority = "high",
				size = { 400, 480 },
				shift = util.by_pixel_hr(0, -32),
				frame_count = 80,
				draw_as_glow = true,
				scale = 0.4,
				animation_speed = 1.5,
				blend_mode = "additive",
				stripes = {
					{
						filename = "__outer_moons__/graphics/entity/RTG/RTG-hr-emission-1.png",
						width_in_frames = 8,
						height_in_frames = 8,
					},
					{
						filename = "__outer_moons__/graphics/entity/RTG/RTG-hr-emission-2.png",
						width_in_frames = 8,
						height_in_frames = 2,
					},
				},
			}
		}
	},

    perceived_performance = {minimum = 0.25, performance_to_activity_rate = 2.0},
    impact_category = "metal-large",
    open_sound = {filename = "__base__/sound/open-close/nuclear-open.ogg", volume = 0.8},
    close_sound = {filename = "__base__/sound/open-close/nuclear-close.ogg", volume = 0.8},
    working_sound =
    {
      sound = sound_variations("__base__/sound/nuclear-reactor", 2, 0.55, volume_multiplier("main-menu", 0.8)),
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

    circuit_wire_max_distance = reactor_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["nuclear-reactor"],
  },
})