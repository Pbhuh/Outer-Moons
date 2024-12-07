--data.raw.entity["cargo-wagon"].inventory_size_quality_increase = 10,
--data.raw.entity["fluid-wagon"].capacity_quality_increase = 10,

-- Finite Pumping
if data.raw.resource["crude-oil"] then

    data.raw["mining-drill"]["pumpjack"].mining_speed = 1

    data.raw.resource["crude-oil"].infinite = false
    data.raw.resource["crude-oil"].minimum = 25000
    data.raw.resource["crude-oil"].normal = 100000
    data.raw.resource["crude-oil"].infinite_depletion_amount = 10
    data.raw.resource["crude-oil"].minable =
        {
            mining_time = 1,
            results = {
                {
                    type = "fluid",
                    name = "crude-oil",
                    amount_min = 10,
                    amount_max = 10,
                    probability = 1
                }
            }
        }
end
if data.raw.resource["sulfuric-acid-geyser"] then

    data.raw["mining-drill"]["pumpjack"].mining_speed = 1

    data.raw.resource["sulfuric-acid-geyser"].infinite = false
    data.raw.resource["sulfuric-acid-geyser"].minimum = 60000
    data.raw.resource["sulfuric-acid-geyser"].normal = 300000
    data.raw.resource["sulfuric-acid-geyser"].infinite_depletion_amount = 10
    data.raw.resource["sulfuric-acid-geyser"].minable =
        {
            mining_time = 1,
            results = {
                {
                    type = "fluid",
                    name = "sulfuric-acid",
                    amount_min = 10,
                    amount_max = 10,
                    probability = 1
                }
            }
        }
end
if data.raw.resource["fluorine-vent"] then

    data.raw["mining-drill"]["pumpjack"].mining_speed = 1

    data.raw.resource["fluorine-vent"].infinite = false
    data.raw.resource["fluorine-vent"].minimum = 20000
    data.raw.resource["fluorine-vent"].normal = 100000
    data.raw.resource["fluorine-vent"].infinite_depletion_amount = 10
    data.raw.resource["fluorine-vent"].minable =
        {
            mining_time = 1,
            results = {
                {
                    type = "fluid",
                    name = "fluorine",
                    amount_min = 1,
                    amount_max = 1,
                    probability = 1
                }
            }
        }
end

--- TECH
data.raw["tool"]["space-science-pack"].icon = "__outer_moons__/graphics/icons/space-science-pack.png"
data.raw["technology"]["space-science-pack"].icon = "__outer_moons__/graphics/technology/space-science-pack.png"
data.raw["recipe"]["space-science-pack"].icon = "__outer_moons__/graphics/icons/space-science-pack.png"
-- Rocket Silo
data.raw.technology["rocket-silo"].effects =
{
  {
	type = "unlock-recipe",
	recipe = "rocket-silo"
  },
  {
	type = "unlock-recipe",
	recipe = "rocket-part"
  },
  {
	type = "unlock-recipe",
	recipe = "rocket-part-new"
  },
  {
	type = "unlock-recipe",
	recipe = "cargo-landing-pad"
  }
}
-- Foundry
data.raw.technology["foundry"].effects =
{
  {
	type = "unlock-recipe",
	recipe = "foundry"
  },
  {
	type = "unlock-recipe",
	recipe = "molten-iron-from-lava"
  },
  {
	type = "unlock-recipe",
	recipe = "molten-copper-from-lava"
  },
  {
	type = "unlock-recipe",
	recipe = "concrete-from-molten-iron"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-low-density-structure"
  },
  {
	type = "unlock-recipe",
	recipe = "molten-iron"
  },
  {
	type = "unlock-recipe",
	recipe = "molten-copper"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-iron"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-copper"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-steel"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-titanium-plate"
  },  
  {
	type = "unlock-recipe",
	recipe = "casting-iron-gear-wheel"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-iron-stick"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-pipe"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-pipe-to-ground"
  },
  {
	type = "unlock-recipe",
	recipe = "casting-copper-cable"
  },
}
-- Planet discoveries
data.raw.technology["planet-discovery-vulcanus"].prerequisites =
{
  "space-platform-thruster",
  "lunar-science-pack"
}
data.raw.technology["planet-discovery-vulcanus"].unit.ingredients =
{
   {"automation-science-pack",      1},
   {"logistic-science-pack",        1},
   {"chemical-science-pack",        1},
   {"space-science-pack",           1},
   {"lunar-science-pack",   	    1}
}
data.raw.technology["planet-discovery-gleba"].prerequisites =
{
  "space-platform-thruster",
  "lunar-science-pack"
}
data.raw.technology["planet-discovery-gleba"].unit.ingredients =
{
   {"automation-science-pack",      1},
   {"logistic-science-pack",        1},
   {"chemical-science-pack",        1},
   {"space-science-pack",           1},
   {"lunar-science-pack",   	    1}
}
data.raw.technology["planet-discovery-fulgora"].prerequisites =
{
  "space-platform-thruster",
  "lunar-science-pack"
}
data.raw.technology["planet-discovery-fulgora"].unit.ingredients =
{
   {"automation-science-pack",      1},
   {"logistic-science-pack",        1},
   {"chemical-science-pack",        1},
   {"space-science-pack",           1},
   {"lunar-science-pack",   	    1}
}
data.raw.technology["planet-discovery-aquilo"].prerequisites =
{
  "planet-discovery-cronus",
  "heating-tower"
}

-- Stack inserter
data.raw.technology["stack-inserter"].prerequisites =
{
  "bulk-inserter",
  "production-science-pack", 
  "utility-science-pack",
  "lunar-science-pack"
}
data.raw.technology["stack-inserter"].unit.ingredients =
{
  {"automation-science-pack",   1},
  {"logistic-science-pack",     1},
  {"chemical-science-pack",     1},
  {"production-science-pack",   1},
  {"utility-science-pack",      1},
  {"space-science-pack",        1},
  {"lunar-science-pack", 		1}
}
data.raw.recipe["stack-inserter"].ingredients = {
	{type = "item", name = "bulk-inserter", amount = 1},
	{type = "item", name = "processing-unit", amount = 1},
	{type = "item", name = "aluminum-plate", amount = 4},
	{type = "item", name = "titanium-plate", amount = 8}
}
data.raw.technology["transport-belt-capacity-1"].unit.ingredients =
{
   {"automation-science-pack",      1},
   {"logistic-science-pack",        1},
   {"chemical-science-pack",        1},
   {"production-science-pack",      1},
   {"utility-science-pack",         1},
   {"space-science-pack",           1},
   {"lunar-science-pack",   	    1}
}
data.raw.technology["transport-belt-capacity-2"].unit.ingredients =
{
   {"automation-science-pack",      1},
   {"logistic-science-pack",        1},
   {"chemical-science-pack",        1},
   {"production-science-pack",      1},
   {"utility-science-pack",         1},
   {"space-science-pack",           1},
   {"lunar-science-pack",   		1}
}
-- Productivity 3
data.raw.technology["productivity-module-3"].prerequisites =
{
  "productivity-module-2",
  "kovarex-enrichment-process",
  "lunar-science-pack", 
  "metallurgic-science-pack", 
  "agricultural-science-pack", 
  "electromagnetic-science-pack"
}
data.raw.technology["productivity-module-3"].unit.ingredients =
{
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"space-science-pack", 1},
  {"lunar-science-pack", 1},
  {"metallurgic-science-pack", 1},
  {"agricultural-science-pack", 1},
  {"electromagnetic-science-pack", 1}
}

-- Agricultural Science Pack doesn't spoil
data.raw.tool["agricultural-science-pack"].spoil_result = nil
data.raw.tool["agricultural-science-pack"].spoil_result = nil
data.raw.lab["lab"].inputs =
{
  "automation-science-pack",
  "logistic-science-pack",
  "military-science-pack",
  "chemical-science-pack",
  "production-science-pack",
  "utility-science-pack",
  "space-science-pack",
  "lunar-science-pack",
  "metallurgic-science-pack",
  "agricultural-science-pack",
  "electromagnetic-science-pack",
  "cryogenic-science-pack",
  "promethium-science-pack"
}
data.raw.lab["biolab"].inputs =
{
  "automation-science-pack",
  "logistic-science-pack",
  "military-science-pack",
  "chemical-science-pack",
  "production-science-pack",
  "utility-science-pack",
  "space-science-pack",
  "lunar-science-pack",
  "metallurgic-science-pack",
  "agricultural-science-pack",
  "electromagnetic-science-pack",
  "cryogenic-science-pack",
  "promethium-science-pack"
}