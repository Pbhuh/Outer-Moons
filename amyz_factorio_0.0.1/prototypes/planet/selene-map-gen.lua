selene = function()
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
            elevation = "vulcanus_elevation",
            aux = "gleba_aux",
            moisture = "gleba_moisture",
            temperature = "gleba_temperature",
            cliffiness = "vulcanus_cliffiness",
            cliff_elevation = "cliff_elevation_from_elevation",
            enemy_base_radius = "gleba_enemy_base_radius",
            enemy_base_frequency = "gleba_enemy_base_frequency",
            ["entity:stone:richness"] = "gleba_stone_richness",
            ["entity:stone:probability"] = "gleba_stone_probability",

            ["decorative:cracked-mud-decal:probability"] = "gleba_cracked_mud_probability",
            ["decorative:light-mud-decal:probability"] = "gleba_light_mud_probability",
            ["decorative:dark-mud-decal:probability"] = "gleba_dark_mud_probability",
        },
        autoplace_controls =
        {
           -- ["selene_plants"] = {},
			["titanium_ore"] = {},
            ["gleba_water"] = {},
            ["rocks"] = {},
        },
        autoplace_settings =
        {
            ["tile"] =
            {
                settings =
                {
                    ["selene-dust"] = {},
                    ["chlorine-tile"] = {},
                }

            },
            ["decorative"] =
            {
                settings =
                {
                    ["light-mud-decal"] = {},
                    ["dark-mud-decal"] = {},
                    ["cracked-mud-decal"] = {},
                    ["lichen-decal"] = {},
                    ["shroom-decal"] = {}
                }
            },
            ["entity"] =
            {
                settings =
                {
                    ["stone"] = {},
                    ["titanium-ore"] = {},
                    ["crude-oil"] = {},
                    ["iron-ore"] = {},
                    ["copper-ore"] = {},
                    ["uranium-ore"] = {},
                }
            }
        }
    }
end

return selene
