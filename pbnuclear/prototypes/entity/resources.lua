local resource_autoplace = require("resource-autoplace")
local sounds = require("__base__.prototypes.entity.sounds")
local simulations = require("__pbnuclear__.prototypes.factoriopedia-simulations")

-- Initialize the core patch sets in a predictable order
resource_autoplace.initialize_patch_set("crude-oil", false, "aquilo")
resource_autoplace.initialize_patch_set("lithium-brine", false, "aquilo")
resource_autoplace.initialize_patch_set("fluorine-vent", false, "aquilo")

local function create_tiles()
  return {
    type = "direct",
    action_delivery =
    {
      type = "instant",
      source_effects =
      {
        {
          type = "create-entity",
          entity_name = "aquilo-tiles-inner-explosion",
          offsets = {{0.5, 0.5}}
        },
        {
          type = "create-entity",
          entity_name = "aquilo-tiles-outer-explosion",
          offsets = {{0.5, 0.5}}
        }
      }
    }
  }
end

data.raw.resource["crude-oil"].created_effect = create_tiles("snow-flat")

local function resource(resource_parameters, autoplace_parameters)
  return
  {
    type = "resource",
    name = resource_parameters.name,
    icon = "__pbnuclear__/graphics/icons/" .. resource_parameters.name .. ".png",
    flags = {"placeable-neutral"},
    order="a-b-"..resource_parameters.order,
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    minable = resource_parameters.minable or
    {
      mining_particle = resource_parameters.name .. "-particle",
      mining_time = resource_parameters.mining_time,
      result = resource_parameters.name
    },
    category = resource_parameters.category,
    subgroup = resource_parameters.subgroup,
    walking_sound = resource_parameters.walking_sound,
    collision_mask = resource_parameters.collision_mask,
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    resource_patch_search_radius = resource_parameters.resource_patch_search_radius,
    autoplace = autoplace_parameters.probability_expression ~= nil and
    {
      --control = resource_parameters.name,
      order = resource_parameters.order,
      probability_expression = autoplace_parameters.probability_expression,
      richness_expression = autoplace_parameters.richness_expression
    }
    or resource_autoplace.resource_autoplace_settings
    {
      name = resource_parameters.name,
      order = resource_parameters.order,
      autoplace_control_name = resource_parameters.autoplace_control_name,
      base_density = autoplace_parameters.base_density,
      base_spots_per_km = autoplace_parameters.base_spots_per_km2,
      regular_rq_factor_multiplier = autoplace_parameters.regular_rq_factor_multiplier,
      starting_rq_factor_multiplier = autoplace_parameters.starting_rq_factor_multiplier,
      candidate_spot_count = autoplace_parameters.candidate_spot_count,
      tile_restriction = autoplace_parameters.tile_restriction
    },
    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
    stages =
    {
      sheet =
      {
        filename = "__pbnuclear__/graphics/entity/" .. resource_parameters.name .. "/" .. resource_parameters.name .. ".png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
    },
    map_color = resource_parameters.map_color,
    mining_visualisation_tint = resource_parameters.mining_visualisation_tint,
    factoriopedia_simulation = resource_parameters.factoriopedia_simulation
  }
end

data:extend({  
    resource(
		{
		  name = "pyromorphite-ore",
		  order = "b",
		  map_color = {r = 69/256, g = 55/256, b = 75/256, a = 1.000},
		  minable =
		  {
			  mining_particle = "stone-particle",
			  mining_time = 1.5,
			  result = "pyromorphite-ore",
		  },
		  walking_sound = sounds.ore,
		  driving_sound = stone_driving_sound,
		  mining_visualisation_tint = {r = 69/256, g = 55/256, b = 75/256, a = 1.000},
		  factoriopedia_simulation = simulations.factoriopedia_lead_ore,
		},
		{
		  base_density = 6,
		  regular_rq_factor_multiplier = 1.10,
		  starting_rq_factor_multiplier = 1.2,
		  candidate_spot_count = 16, -- To match 0.17.50 placement
		  has_starting_area_placement = true
		}
	),
})