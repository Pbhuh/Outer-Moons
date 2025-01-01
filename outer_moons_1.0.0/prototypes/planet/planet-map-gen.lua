local planet_map_gen = require("__base__/prototypes/planet/planet-map-gen")

planet_map_gen.nauvis = function()
  return
  {
    aux_climate_control = true,
    moisture_climate_control = true,
    property_expression_names =
    { -- Warning: anything set here overrides any selections made in the map setup screen so the options do nothing.
      --cliff_elevation = "cliff_elevation_nauvis",
      --cliffiness = "cliffiness_nauvis",
      --elevation = "elevation_island"
    },
    cliff_settings =
    {
      name = "cliff",
      control = "nauvis_cliff",
      cliff_smoothing = 0
    },
    autoplace_controls =
    {
      ["iron-ore"] = {},
      ["copper-ore"] = {},
      ["lead-ore"] = {},
      ["nickel-ore"] = {},
      ["aluminum-ore"] = {},
      ["silicon-ore"] = {},
      ["stone"] = {},
      ["coal"] = {},
      ["uranium-ore"] = {},
      ["crude-oil"] = {},
      ["natural-gas"] = {},
      ["water"] = {},
      ["trees"] = {},
      ["enemy-base"] = {},
      ["rocks"] = {},
      ["starting_area_moisture"] = {},
      ["nauvis_cliff"] = {}
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          ["grass-1"] = {},
          ["grass-2"] = {},
          ["grass-3"] = {},
          ["grass-4"] = {},
          ["dry-dirt"] = {},
          ["dirt-1"] = {},
          ["dirt-2"] = {},
          ["dirt-3"] = {},
          ["dirt-4"] = {},
          ["dirt-5"] = {},
          ["dirt-6"] = {},
          ["dirt-7"] = {},
          ["sand-1"] = {},
          ["sand-2"] = {},
          ["sand-3"] = {},
          ["red-desert-0"] = {},
          ["red-desert-1"] = {},
          ["red-desert-2"] = {},
          ["red-desert-3"] = {},
          ["water"] = {},
          ["deepwater"] = {}
        }
      },
      ["decorative"] =
      {
        settings =
        {
          ["brown-hairy-grass"] = {},
          ["green-hairy-grass"] = {},
          ["brown-carpet-grass"] = {},
          ["green-carpet-grass"] = {},
          ["green-small-grass"] = {},
          ["green-asterisk"] = {},
          ["brown-asterisk-mini"] = {},
          ["green-asterisk-mini"] = {},
          ["brown-asterisk"] = {},
          ["red-asterisk"] = {},
          ["dark-mud-decal"] = {},
          ["light-mud-decal"] = {},
          ["cracked-mud-decal"] = {},
          ["red-desert-decal"] = {},
          ["sand-decal"] = {},
          ["sand-dune-decal"] = {},
          ["green-pita"] = {},
          ["red-pita"] = {},
          ["green-croton"] = {},
          ["red-croton"] = {},
          ["green-pita-mini"] = {},
          ["brown-fluff"] = {},
          ["brown-fluff-dry"] = {},
          ["green-desert-bush"] = {},
          ["red-desert-bush"] = {},
          ["white-desert-bush"] = {},
          ["garballo-mini-dry"] = {},
          ["garballo"] = {},
          ["green-bush-mini"] = {},
          ["medium-rock"] = {},
          ["small-rock"] = {},
          ["tiny-rock"] = {},
          ["medium-sand-rock"] = {},
          ["small-sand-rock"] = {}
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["iron-ore"] = {},
          ["copper-ore"] = {},
          ["lead-ore"] = {},
          ["nickel-ore"] = {},
          ["aluminum-ore"] = {},
          ["silicon-ore"] = {},
          ["stone"] = {},
          ["coal"] = {},
          ["crude-oil"] = {},
          ["natural-gas"] = {},
          ["uranium-ore"] = {},
          ["fish"] = {},
          ["big-sand-rock"] = {},
          ["huge-rock"] = {},
          ["big-rock"] = {},
        }
      }
    }
  }
end

planet_map_gen.gleba = function()
  return
  {
    cliff_settings =
    {
      name = "cliff-gleba",
      control = "gleba_cliff",
      cliff_elevation_0 = 40,
      cliff_elevation_interval = 60,
      richness = 0.80,
      cliff_smoothing = 0 -- Not critical but looks better
    },
    property_expression_names =
    {
      elevation = "gleba_elevation",
      aux = "gleba_aux",
      moisture = "gleba_moisture",
      temperature = "gleba_temperature",
      cliffiness = "gleba_cliffiness",
      cliff_elevation = "cliff_elevation_from_elevation",
      enemy_base_radius = "gleba_enemy_base_radius",
      enemy_base_frequency = "gleba_enemy_base_frequency",
      ["entity:phosphate:richness"] = "gleba_stone_richness",
      ["entity:phosphate:probability"] = "gleba_stone_probability",

      ["decorative:red-desert-bush:probability"] = "gleba_red_desert_bush_probability",
      ["decorative:white-desert-bush:probability"] = "gleba_white_desert_bush_probability",
      ["decorative:red-pita:probability"] = "gleba_red_pita_probability",
      ["decorative:green-bush-mini:probability"] = "gleba_green_bush_probability",
      ["decorative:green-croton:probability"] = "gleba_green_cronton_probability",
      ["decorative:green-pita:probability"] = "gleba_green_pita_probability",
      ["decorative:green-pita-mini:probability"] = "gleba_green_pita_mini_probability",
      ["decorative:lichen-decal:probability"] = "gleba_orange_lichen_probability",
      ["decorative:shroom-decal:probability"] = "gleba_carpet_shroom_probability",
      ["decorative:cracked-mud-decal:probability"] = "gleba_cracked_mud_probability",
      ["decorative:light-mud-decal:probability"] = "gleba_light_mud_probability",
      ["decorative:dark-mud-decal:probability"] = "gleba_dark_mud_probability",
      ["decorative:green-carpet-grass:probability"] = "gleba_green_carpet_grass_probability",
      ["decorative:green-hairy-grass:probability"] = "gleba_green_hairy_grass_probability"
    },
    autoplace_controls =
    {
      ["gleba_stone"] = {},
      ["gleba_plants"] = {},
      ["gleba_enemy_base"] = {},
      ["gleba_water"] = {},
      ["gleba_cliff"] = {},
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          ["natural-yumako-soil"] = {},
          ["natural-jellynut-soil"] = {},
          ["wetland-yumako"] = {},
          ["wetland-jellynut"] = {},
          ["wetland-blue-slime"] = {},
          ["wetland-light-green-slime"] = {},
          ["wetland-green-slime"] = {},
          ["wetland-light-dead-skin"] = {},
          ["wetland-dead-skin"] = {},
          ["wetland-pink-tentacle"] = {},
          ["wetland-red-tentacle"] = {},
          ["gleba-deep-lake"] = {},
          ["lowland-brown-blubber"] = {},
          ["lowland-olive-blubber"] = {},
          ["lowland-olive-blubber-2"] = {},
          ["lowland-olive-blubber-3"] = {},
          ["lowland-pale-green"] = {},
          ["lowland-cream-cauliflower"] = {},
          ["lowland-cream-cauliflower-2"] = {},
          ["lowland-dead-skin"] = {},
          ["lowland-dead-skin-2"] = {},
          ["lowland-cream-red"] = {},
          ["lowland-red-vein"] = {},
          ["lowland-red-vein-2"] = {},
          ["lowland-red-vein-3"] = {},
          ["lowland-red-vein-4"] = {},
          ["lowland-red-vein-dead"] = {},
          ["lowland-red-infection"] = {},
          ["midland-turquoise-bark"] = {},
          ["midland-turquoise-bark-2"] = {},
          ["midland-cracked-lichen"] = {},
          ["midland-cracked-lichen-dull"] = {},
          ["midland-cracked-lichen-dark"] = {},
          ["midland-yellow-crust"] = {},
          ["midland-yellow-crust-2"] = {},
          ["midland-yellow-crust-3"] = {},
          ["midland-yellow-crust-4"] = {},
          ["highland-dark-rock"] = {},
          ["highland-dark-rock-2"] = {},
          ["highland-yellow-rock"] = {},
          ["pit-rock"] = {}
        }

      },
      ["decorative"] =
      {
        settings =
        {
          ["yellow-lettuce-lichen-1x1"] = {},
          ["yellow-lettuce-lichen-3x3"] = {},
          ["yellow-lettuce-lichen-6x6"] = {},
          ["yellow-lettuce-lichen-cups-1x1"] = {},
          ["yellow-lettuce-lichen-cups-3x3"] = {},
          ["yellow-lettuce-lichen-cups-6x6"] = {},
          ["green-lettuce-lichen-1x1"] = {},
          ["green-lettuce-lichen-3x3"] = {},
          ["green-lettuce-lichen-6x6"] = {},
          ["green-lettuce-lichen-water-1x1"] = {},
          ["green-lettuce-lichen-water-3x3"] = {},
          ["green-lettuce-lichen-water-6x6"] = {},
          ["honeycomb-fungus"] = {},
          ["honeycomb-fungus-1x1"] = {},
          ["honeycomb-fungus-decayed"] = {},
          ["split-gill-1x1"] = {},
          ["split-gill-2x2"] = {},
          ["split-gill-dying-1x1"] = {},
          ["split-gill-dying-2x2"] = {},
          ["split-gill-red-1x1"] = {},
          ["split-gill-red-2x2"] = {},
          ["veins"] = {},
          ["veins-small"] = {},
          ["mycelium"] = {},
          ["coral-water"] = {},
          ["coral-land"] = {},
          ["black-sceptre"] = {},
          ["pink-phalanges"] = {},
          ["pink-lichen-decal"] = {},
          ["red-lichen-decal"] = {},
          ["green-cup"] = {},
          ["brown-cup"] = {},
          ["blood-grape"] = {},
          ["blood-grape-vibrant"] = {},
          ["brambles"] = {},
          ["polycephalum-slime"] = {},
          ["polycephalum-balloon"] = {},
          ["fuchsia-pita"] = {},
          ["wispy-lichen"] = {},
          ["grey-cracked-mud-decal"] = {},
          ["barnacles-decal"] = {},
          ["coral-stunted"] = {},
          ["coral-stunted-grey"] = {},
          ["nerve-roots-veins-dense"] = {},
          ["nerve-roots-veins-sparse"] = {},
          ["yellow-coral"] = {},
          ["solo-barnacle"] = {},
          ["curly-roots-orange"] = {},
          ["knobbly-roots"] = {},
          ["knobbly-roots-orange"] = {},
          ["matches-small"] = {},
          ["pale-lettuce-lichen-cups-1x1"] = {},
          ["pale-lettuce-lichen-cups-3x3"] = {},
          ["pale-lettuce-lichen-cups-6x6"] = {},
          ["pale-lettuce-lichen-1x1"] = {},
          ["pale-lettuce-lichen-3x3"] = {},
          ["pale-lettuce-lichen-6x6"] = {},
          ["pale-lettuce-lichen-water-1x1"] = {},
          ["pale-lettuce-lichen-water-3x3"] = {},
          ["pale-lettuce-lichen-water-6x6"] = {},
          ["white-carpet-grass"] = {},
          ["green-carpet-grass"] = {},
          ["green-hairy-grass"] = {},

          --shared
          ["light-mud-decal"] = {},
          ["dark-mud-decal"] = {},
          ["cracked-mud-decal"] = {},
          ["red-desert-bush"] = {},
          ["white-desert-bush"] = {},
          ["red-pita"] = {},
          ["green-bush-mini"] = {},
          ["green-croton"] = {},
          ["green-pita"] = {},
          ["green-pita-mini"] = {},
          ["lichen-decal"] = {},
          ["shroom-decal"] = {}
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["phosphate"] = {},
          ["iron-stromatolite"] = {},
          ["copper-stromatolite"] = {}
        }
      }
    }
  }
end

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
	  ["entity:metallic-regolith:probability"] = "selene_metallic_regolith_probability",
      ["entity:metallic-regolith:richness"] = "selene_metallic_regolith_richness",
	  ["entity:aluminum-ore:probability"] = "selene_aluminum_ore_probability",
      ["entity:aluminum-ore:richness"] = "selene_aluminum_ore_richness",
      ["entity:titanium-ore:probability"] = "selene_titanium_ore_probability",
      ["entity:titanium-ore:richness"] = "selene_titanium_ore_richness",
      ["entity:saline-geyser:probability"] = "selene_saline_geyser_probability",
      ["entity:saline-geyser:richness"] = "selene_saline_geyser_richness",
    },
    cliff_settings =
    {
      name = "cliff-selene",
      cliff_elevation_interval = 250,
      cliff_elevation_0 = 40
    },
    autoplace_controls =
    {
      ["saline_geyser"] = {},
      ["metallic_regolith"] = {},
      ["aluminum_ore"] = {},
      ["titanium_ore"] = {},
      ["selene_craters"] = {},
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
         -- ["selene-snow-patchy"] = {},
        }
      },
      ["decorative"] =
      {
        settings =
        {
		  
          ["selene-dune-decal"] = {},
          ["selene-sand-decal"] = {},
		  
          ["crater-selene-small"] = {},
          ["crater-selene-medium"] = {},
          ["crater-selene-large"] = {},
          ["crater-selene-very-large"] = {},
          ["crater-selene-huge"] = {},
		  
          ["tiny-selene-rock"] = {},
          ["small-selene-rock"] = {},
          ["medium-selene-rock"] = {},
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["saline-geyser"] = {},
          ["metallic-regolith"] = {},
          ["aluminum-ore"] = {},
          ["titanium-ore"] = {},
          ["huge-selene-rock"] = {},
          ["big-selene-rock"] = {},
          ["selene-crater-cliff"] = {},
        }
      }
    }
  }
end

planet_map_gen.mefitis = function()
  return
  {
    property_expression_names =
    {
      elevation = "mefitis_elevation",
      temperature = "mefitis_temperature",
      moisture = "mefitis_moisture",
      aux = "mefitis_aux",
      cliffiness = "cliffiness_basic",
      cliff_elevation = "cliff_elevation_from_elevation",
      ["entity:titanium-ore:probability"] = "mefitis_titanium_ore_probability",
      ["entity:titanium-ore:richness"] = "mefitis_titanium_ore_richness",
      ["entity:chlorine-geyser:probability"] = "mefitis_chlorine_geyser_probability",
      ["entity:chlorine-geyser:richness"] = "mefitis_chlorine_geyser_richness",
    },
    cliff_settings =
    {
      name = "cliff-mefitis",
      cliff_elevation_interval = 120,
      cliff_elevation_0 = 70
    },
    autoplace_controls =
    {
      ["chlorine_geyser"] = {},
      --["titanium_ore"] = {},
      ["mefitis_volcanism"] = {},
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          --["mefitis-lava-dust"] = {},
          ["mefitis-dust-1"] = {},
          ["mefitis-dust-2"] = {},
          ["mefitis-dust-3"] = {},
          ["mefitis-dust-4"] = {},
          ["mefitis-dust-5"] = {},
          ["mefitis-dust-6"] = {},
          ["mefitis-sand-1"] = {},
          ["mefitis-sand-2"] = {},
          ["mefitis-sand-3"] = {},
          ["lava-caldera"] = {},
          ["lava-caldera-hot"] = {},
		  ["sulfur_ocean"] = {},
        }
      },
      ["decorative"] =
      {
        settings =
        {
          ["small-chlorine-rock"] = {},
          ["tiny-chlorine-rock"] = {},
          ["chlorine-rock-cluster"] = {},
          ["chlorine-stain"] = {},
          ["chlorine-stain-small"] = {},
          ["chlorine-puddle"] = {},
          ["chlorine-puddle-small"] = {},
		  
          --["vulcanus-rock-decal-large"] = {},
          ["vulcanus-dune-decal"] = {},
          ["vulcanus-sand-decal"] = {},
          ["crater-small"] = {},
          ["crater-large"] = {},
          ["pumice-relief-decal"] = {},
          ["small-volcanic-rock"] = {},
          ["medium-volcanic-rock"] = {},
          ["tiny-volcanic-rock"] = {},
          ["tiny-rock-cluster"] = {},
          ["waves-decal"] = {},
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["chlorine-geyser"] = {},
          --["titanium-ore"] = {},
         -- ["uranium-ore"] = {},
          ["huge-volcanic-rock"] = {},
          ["big-volcanic-rock"] = {},
          ["mefitis-crater-cliff"] = {},
        }
      }
    }
  }
end

planet_map_gen.aiolos = function()
  return
  {
    property_expression_names =
    {
      elevation = "fulgora_elevation",
      temperature = "temperature_basic",
      moisture = "moisture_basic",
      aux = "aux_basic",
      cliffiness = "fulgora_cliffiness",
      cliff_elevation = "cliff_elevation_from_elevation",
    },
    cliff_settings =
    {
      name = "cliff-fulgora",
      control = "fulgora_cliff",
      cliff_elevation_0 = 80,
      -- Ideally the first cliff would be at elevation 0 on the coastline, but that doesn't work,
      -- so instead the coastline is moved to elevation 80.
      -- Also there needs to be a large cliff drop at the coast to avoid the janky cliff smoothing
      -- but it also fails if a corner goes below zero, so we need an extra buffer of 40.
      -- So the first cliff is at 80, and terrain near the cliff shouln't go close to 0 (usually above 40).
      cliff_elevation_interval = 40,
      cliff_smoothing = 0, -- This is critical for correct cliff placement on the coast.
      richness = 0.95
    },
    autoplace_controls =
    {
      ["scrap"] = {},
      ["fulgora_islands"] = {},
      ["fulgora_cliff"] = {},
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          ["oil-ocean-shallow"] = {},
          ["oil-ocean-deep"] = {},
          ["fulgoran-rock"] = {},
          ["fulgoran-dust"] = {},
          ["fulgoran-sand"] = {},
          ["fulgoran-dunes"] = {},
          ["fulgoran-walls"] = {},
          ["fulgoran-paving"] = {},
          ["fulgoran-conduit"] = {},
          ["fulgoran-machinery"] = {},
        }
      },
      ["decorative"] =
      {
        settings =
        {
          ["fulgoran-ruin-tiny"] = {},
          ["fulgoran-gravewort"] = {},
          ["urchin-cactus"] = {},
          ["medium-fulgora-rock"] = {},
          ["small-fulgora-rock"] = {},
          ["tiny-fulgora-rock"] = {},
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["scrap"] = {},
          ["fulgoran-ruin-vault"] = {},
          ["fulgoran-ruin-attractor"] = {},
          ["fulgoran-ruin-colossal"] = {},
          ["fulgoran-ruin-huge"] = {},
          ["fulgoran-ruin-big"] = {},
          ["fulgoran-ruin-stonehenge"] = {},
          ["fulgoran-ruin-medium"] = {},
          ["fulgoran-ruin-small"] = {},
          ["fulgurite"] = {},
          ["big-fulgora-rock"] = {}
        }
      }
    }
  }
end


planet_map_gen.feronia = function()
  return
  {
    cliff_settings =
    {
      name = "cliff-gleba",
      control = "gleba_cliff",
      cliff_elevation_0 = 40,
      cliff_elevation_interval = 60,
      richness = 0.80,
      cliff_smoothing = 0 -- Not critical but looks better
    },
    property_expression_names =
    {
      elevation = "gleba_elevation",
      aux = "gleba_aux",
      moisture = "gleba_moisture",
      temperature = "gleba_temperature",
      cliffiness = "gleba_cliffiness",
      cliff_elevation = "cliff_elevation_from_elevation",
      enemy_base_radius = "gleba_enemy_base_radius",
      enemy_base_frequency = "gleba_enemy_base_frequency",
      ["entity:stone:richness"] = "gleba_stone_richness",
      ["entity:stone:probability"] = "gleba_stone_probability",

      ["decorative:red-desert-bush:probability"] = "gleba_red_desert_bush_probability",
      ["decorative:white-desert-bush:probability"] = "gleba_white_desert_bush_probability",
      ["decorative:red-pita:probability"] = "gleba_red_pita_probability",
      ["decorative:green-bush-mini:probability"] = "gleba_green_bush_probability",
      ["decorative:green-croton:probability"] = "gleba_green_cronton_probability",
      ["decorative:green-pita:probability"] = "gleba_green_pita_probability",
      ["decorative:green-pita-mini:probability"] = "gleba_green_pita_mini_probability",
      ["decorative:lichen-decal:probability"] = "gleba_orange_lichen_probability",
      ["decorative:shroom-decal:probability"] = "gleba_carpet_shroom_probability",
      ["decorative:cracked-mud-decal:probability"] = "gleba_cracked_mud_probability",
      ["decorative:light-mud-decal:probability"] = "gleba_light_mud_probability",
      ["decorative:dark-mud-decal:probability"] = "gleba_dark_mud_probability",
      ["decorative:green-carpet-grass:probability"] = "gleba_green_carpet_grass_probability",
      ["decorative:green-hairy-grass:probability"] = "gleba_green_hairy_grass_probability"
    },
    autoplace_controls =
    {
      ["gleba_stone"] = {},
      ["gleba_plants"] = {},
      ["gleba_enemy_base"] = {},
      ["gleba_water"] = {},
      ["gleba_cliff"] = {},
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          ["natural-yumako-soil"] = {},
          ["natural-jellynut-soil"] = {},
          ["wetland-yumako"] = {},
          ["wetland-jellynut"] = {},
          ["wetland-blue-slime"] = {},
          ["wetland-light-green-slime"] = {},
          ["wetland-green-slime"] = {},
          ["wetland-light-dead-skin"] = {},
          ["wetland-dead-skin"] = {},
          ["wetland-pink-tentacle"] = {},
          ["wetland-red-tentacle"] = {},
          ["gleba-deep-lake"] = {},
          ["lowland-brown-blubber"] = {},
          ["lowland-olive-blubber"] = {},
          ["lowland-olive-blubber-2"] = {},
          ["lowland-olive-blubber-3"] = {},
          ["lowland-pale-green"] = {},
          ["lowland-cream-cauliflower"] = {},
          ["lowland-cream-cauliflower-2"] = {},
          ["lowland-dead-skin"] = {},
          ["lowland-dead-skin-2"] = {},
          ["lowland-cream-red"] = {},
          ["lowland-red-vein"] = {},
          ["lowland-red-vein-2"] = {},
          ["lowland-red-vein-3"] = {},
          ["lowland-red-vein-4"] = {},
          ["lowland-red-vein-dead"] = {},
          ["lowland-red-infection"] = {},
          ["midland-turquoise-bark"] = {},
          ["midland-turquoise-bark-2"] = {},
          ["midland-cracked-lichen"] = {},
          ["midland-cracked-lichen-dull"] = {},
          ["midland-cracked-lichen-dark"] = {},
          ["midland-yellow-crust"] = {},
          ["midland-yellow-crust-2"] = {},
          ["midland-yellow-crust-3"] = {},
          ["midland-yellow-crust-4"] = {},
          ["highland-dark-rock"] = {},
          ["highland-dark-rock-2"] = {},
          ["highland-yellow-rock"] = {},
          ["pit-rock"] = {}
        }

      },
      ["decorative"] =
      {
        settings =
        {
          ["yellow-lettuce-lichen-1x1"] = {},
          ["yellow-lettuce-lichen-3x3"] = {},
          ["yellow-lettuce-lichen-6x6"] = {},
          ["yellow-lettuce-lichen-cups-1x1"] = {},
          ["yellow-lettuce-lichen-cups-3x3"] = {},
          ["yellow-lettuce-lichen-cups-6x6"] = {},
          ["green-lettuce-lichen-1x1"] = {},
          ["green-lettuce-lichen-3x3"] = {},
          ["green-lettuce-lichen-6x6"] = {},
          ["green-lettuce-lichen-water-1x1"] = {},
          ["green-lettuce-lichen-water-3x3"] = {},
          ["green-lettuce-lichen-water-6x6"] = {},
          ["honeycomb-fungus"] = {},
          ["honeycomb-fungus-1x1"] = {},
          ["honeycomb-fungus-decayed"] = {},
          ["split-gill-1x1"] = {},
          ["split-gill-2x2"] = {},
          ["split-gill-dying-1x1"] = {},
          ["split-gill-dying-2x2"] = {},
          ["split-gill-red-1x1"] = {},
          ["split-gill-red-2x2"] = {},
          ["veins"] = {},
          ["veins-small"] = {},
          ["mycelium"] = {},
          ["coral-water"] = {},
          ["coral-land"] = {},
          ["black-sceptre"] = {},
          ["pink-phalanges"] = {},
          ["pink-lichen-decal"] = {},
          ["red-lichen-decal"] = {},
          ["green-cup"] = {},
          ["brown-cup"] = {},
          ["blood-grape"] = {},
          ["blood-grape-vibrant"] = {},
          ["brambles"] = {},
          ["polycephalum-slime"] = {},
          ["polycephalum-balloon"] = {},
          ["fuchsia-pita"] = {},
          ["wispy-lichen"] = {},
          ["grey-cracked-mud-decal"] = {},
          ["barnacles-decal"] = {},
          ["coral-stunted"] = {},
          ["coral-stunted-grey"] = {},
          ["nerve-roots-veins-dense"] = {},
          ["nerve-roots-veins-sparse"] = {},
          ["yellow-coral"] = {},
          ["solo-barnacle"] = {},
          ["curly-roots-orange"] = {},
          ["knobbly-roots"] = {},
          ["knobbly-roots-orange"] = {},
          ["matches-small"] = {},
          ["pale-lettuce-lichen-cups-1x1"] = {},
          ["pale-lettuce-lichen-cups-3x3"] = {},
          ["pale-lettuce-lichen-cups-6x6"] = {},
          ["pale-lettuce-lichen-1x1"] = {},
          ["pale-lettuce-lichen-3x3"] = {},
          ["pale-lettuce-lichen-6x6"] = {},
          ["pale-lettuce-lichen-water-1x1"] = {},
          ["pale-lettuce-lichen-water-3x3"] = {},
          ["pale-lettuce-lichen-water-6x6"] = {},
          ["white-carpet-grass"] = {},
          ["green-carpet-grass"] = {},
          ["green-hairy-grass"] = {},

          --shared
          ["light-mud-decal"] = {},
          ["dark-mud-decal"] = {},
          ["cracked-mud-decal"] = {},
          ["red-desert-bush"] = {},
          ["white-desert-bush"] = {},
          ["red-pita"] = {},
          ["green-bush-mini"] = {},
          ["green-croton"] = {},
          ["green-pita"] = {},
          ["green-pita-mini"] = {},
          ["lichen-decal"] = {},
          ["shroom-decal"] = {}
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["stone"] = {},
          ["iron-stromatolite"] = {},
          ["copper-stromatolite"] = {}
        }
      }
    }
  }
end

return planet_map_gen
