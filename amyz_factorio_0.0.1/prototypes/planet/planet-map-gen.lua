local planet_map_gen = require("__base__/prototypes/planet/planet-map-gen")
-- get nauvis from base

planet_map_gen.selene = function()
  return
  {
    property_expression_names =
    {
      elevation = "selene_elevation",
      temperature = "selene_temperature",
      moisture = "selene_moisture",
      aux = "selene_aux",
      cliffiness = "cliffiness_basic",
      cliff_elevation = "cliff_elevation_from_elevation",
      ["entity:titanium-ore:probability"] = "selene_titanium_ore_probability",
      ["entity:titanium-ore:richness"] = "selene_titanium_ore_richness",
      ["entity:chlorine-geyser:probability"] = "selene_chlorine_geyser_probability",
      ["entity:chlorine-geyser:richness"] = "selene_chlorine_geyser_richness",
    },
    cliff_settings =
    {
      name = "cliff-selene",
      cliff_elevation_interval = 120,
      cliff_elevation_0 = 70
    },
    autoplace_controls =
    {
      ["chlorine_geyser"] = {},
      ["titanium_ore"] = {},
      ["selene_volcanism"] = {},
      --["rocks"] = {}, -- can't add the rocks control otherwise nauvis rocks spawn
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          ["selene-dust-1"] = {},
          ["selene-dust-2"] = {},
          ["selene-dust-3"] = {},
          ["selene-dust-4"] = {},
          ["selene-dust-5"] = {},
          ["selene-dust-6"] = {},
          ["selene-sand-1"] = {},
          ["selene-sand-2"] = {},
          ["selene-sand-3"] = {},
          ["lava"] = {},
          ["lava-hot"] = {},
		  ["sulfur_ocean"] = {},
        }
      },
      ["decorative"] =
      {
        settings =
        {
          ["vulcanus-rock-decal-large"] = {},
          ["vulcanus-dune-decal"] = {},
          ["vulcanus-sand-decal"] = {},
          ["chlorine-stain"] = {},
          ["chlorine-stain-small"] = {},
          ["chlorine-puddle"] = {},
          ["chlorine-puddle-small"] = {},
          ["crater-small"] = {},
          ["crater-large"] = {},
          ["pumice-relief-decal"] = {},
          ["small-volcanic-rock"] = {},
          ["medium-volcanic-rock"] = {},
          ["tiny-volcanic-rock"] = {},
          ["tiny-rock-cluster"] = {},
          ["small-chlorine-rock"] = {},
          ["tiny-chlorine-rock"] = {},
          ["chlorine-rock-cluster"] = {},
          ["waves-decal"] = {},
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["chlorine-geyser"] = {},
          ["titanium-ore"] = {},
          ["uranium-ore"] = {},
          ["huge-volcanic-rock"] = {},
          ["big-volcanic-rock"] = {},
          ["crater-cliff"] = {},
        }
      }
    }
  }
end

return planet_map_gen
