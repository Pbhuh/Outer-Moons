require ("sound-util")
require ("circuit-connector-sprites")
require ("util")
require ("__space-age__.prototypes.entity.circuit-network")
require ("__space-age__.prototypes.entity.space-platform-hub-cockpit")

local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require ("__space-age__.prototypes.entity.sounds")
local meld = require("meld")
local simulations = require("__amyz_factorio__.prototypes.factoriopedia-simulations")
local procession_graphic_catalogue_types = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

data:extend({
  
  scaled_cliff(
    {
      mod_name = "__amyz_factorio__",
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
      mod_name = "__amyz_factorio__",
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
})