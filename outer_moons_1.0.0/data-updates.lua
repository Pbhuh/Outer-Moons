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
	data.raw.resource["crude-oil"].map_color = {0, 0, 0}
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
                    name = "volcanic-gas",
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
data.raw["tool"]["space-science-pack"].subgroup = "science-pack-2"
data.raw["tool"]["space-science-pack"].order = "b"
data.raw["technology"]["space-science-pack"].icon = "__outer_moons__/graphics/technology/space-science-pack.png"
data.raw["recipe"]["space-science-pack"].icon = "__outer_moons__/graphics/icons/space-science-pack.png"

data.raw["tool"]["metallurgic-science-pack"].icon = "__outer_moons__/graphics/icons/metallurgic-science-pack.png"
data.raw["tool"]["metallurgic-science-pack"].subgroup = "science-pack-2"
data.raw["tool"]["metallurgic-science-pack"].order = "d"
data.raw["technology"]["metallurgic-science-pack"].icon = "__outer_moons__/graphics/technology/metallurgic-science-pack.png"
data.raw["recipe"]["metallurgic-science-pack"].icon = "__outer_moons__/graphics/icons/metallurgic-science-pack.png"

data.raw["tool"]["agricultural-science-pack"].icon = "__outer_moons__/graphics/icons/agricultural-science-pack.png"
data.raw["tool"]["agricultural-science-pack"].subgroup = "science-pack-2"
data.raw["tool"]["agricultural-science-pack"].order = "e"
data.raw["technology"]["agricultural-science-pack"].icon = "__outer_moons__/graphics/technology/agricultural-science-pack.png"
data.raw["recipe"]["agricultural-science-pack"].icon = "__outer_moons__/graphics/icons/agricultural-science-pack.png"

data.raw["tool"]["electromagnetic-science-pack"].icon = "__outer_moons__/graphics/icons/electromagnetic-science-pack.png"
data.raw["tool"]["electromagnetic-science-pack"].subgroup = "science-pack-2"
data.raw["tool"]["electromagnetic-science-pack"].order = "f"
data.raw["technology"]["electromagnetic-science-pack"].icon = "__outer_moons__/graphics/technology/electromagnetic-science-pack.png"
data.raw["recipe"]["electromagnetic-science-pack"].icon = "__outer_moons__/graphics/icons/electromagnetic-science-pack.png"

data.raw["tool"]["cryogenic-science-pack"].icon = "__outer_moons__/graphics/icons/cryogenic-science-pack.png"
data.raw["tool"]["cryogenic-science-pack"].subgroup = "science-pack-3"
data.raw["tool"]["cryogenic-science-pack"].order = "b"
data.raw["technology"]["cryogenic-science-pack"].icon = "__outer_moons__/graphics/technology/cryogenic-science-pack.png"
data.raw["recipe"]["cryogenic-science-pack"].icon = "__outer_moons__/graphics/icons/cryogenic-science-pack.png"

data.raw["tool"]["promethium-science-pack"].icon = "__outer_moons__/graphics/icons/deep-space-science-pack.png"
data.raw["tool"]["promethium-science-pack"].subgroup = "science-pack-3"
data.raw["tool"]["promethium-science-pack"].order = "f"
data.raw["technology"]["promethium-science-pack"].icon = "__outer_moons__/graphics/technology/deep-space-science-pack.png"
data.raw["recipe"]["promethium-science-pack"].icon = "__outer_moons__/graphics/icons/deep-space-science-pack.png"
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
data.raw.technology["planet-discovery-fulgora"].effects =
{
  {
	type = "unlock-space-location",
	space_location = "fulgora",
	use_icon_overlay_constant = true
  },
  {
	type = "unlock-recipe",
	recipe = "lightning-rod",
  },
  {
	type = "unlock-recipe",
	recipe = "sludge-separation"
  },
}
data.raw["tile"]["oil-ocean-shallow"].fluid = "sludge"
data.raw["tile"]["oil-ocean-deep"].fluid = "sludge"
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

--order
data.raw.resource["crude-oil"].order = "a-b-a[crude-oil]"
data.raw.resource["sulfuric-acid-geyser"].order = "a-b-c[sulfuric-acid-geyser]"
data.raw.resource["lithium-brine"].order = "a-b-e[lithium-brine]"
data.raw.resource["fluorine-vent"].order = "a-b-f[fluorine-vent]"
data.raw.recipe["molten-iron-from-lava"].icon = "__outer_moons__/graphics/icons/fluid/molten-iron-from-lava.png"
data.raw.recipe["simple-coal-liquefaction"].hidden = true
data.raw.recipe["steam-condensation"].subgroup = "phase-recipes"
data.raw.recipe["ice-melting"].subgroup = "phase-recipes"
data.raw.recipe["acid-neutralisation"].subgroup = "phase-recipes"

data.raw["cargo-wagon"]["cargo-wagon"].quality_affects_inventory_size = true
data.raw["fluid-wagon"]["fluid-wagon"].quality_affects_capacity = true

data.raw.module["speed-module"].subgroup = "speed-module"
data.raw.module["speed-module-2"].subgroup = "speed-module"
data.raw.module["speed-module-3"].subgroup = "speed-module"

data.raw.module["efficiency-module"].subgroup = "efficiency-module"
data.raw.module["efficiency-module-2"].subgroup = "efficiency-module"
data.raw.module["efficiency-module-3"].subgroup = "efficiency-module"

data.raw.module["productivity-module"].subgroup = "productivity-module"
data.raw.module["productivity-module-2"].subgroup = "productivity-module"
data.raw.module["productivity-module-3"].subgroup = "productivity-module"

data.raw.module["quality-module"].subgroup = "quality-module"
data.raw.module["quality-module-2"].subgroup = "quality-module"
data.raw.module["quality-module-3"].subgroup = "quality-module"

data.raw.item["underground-belt"].subgroup = "underground"
data.raw.item["fast-underground-belt"].subgroup = "underground"
data.raw.item["express-underground-belt"].subgroup = "underground"

data.raw.item["splitter"].subgroup = "splitter"
data.raw.item["fast-splitter"].subgroup = "splitter"
data.raw.item["express-splitter"].subgroup = "splitter"

data.raw.item["loader"].subgroup = "loader"
data.raw.item["fast-loader"].subgroup = "loader"
data.raw.item["express-loader"].subgroup = "loader"

data.raw.item["engine-unit"].order = "c[advanced-intermediates]-b[engine-unit]"
data.raw.item["electric-engine-unit"].order = "c[advanced-intermediates]-d[electric-engine-unit]"
data.raw.item["flying-robot-frame"].order = "c[advanced-intermediates]-e[flying-robot-frame]"
data.raw.item["copper-cable"].subgroup = "circuit-parts"
data.raw.item["centrifuge"].icon = "__outer_moons__/graphics/icons/centrifuge.png"
data.raw.item["tungsten-plate"].icon = "__outer_moons__/graphics/icons/tungsten-plate.png"
data.raw.item["tungsten-carbide"].icon = "__outer_moons__/graphics/icons/tungsten-carbide.png"

data.raw["assembling-machine"]["electromagnetic-plant"].crafting_categories = {"electromagnetics", "electronics", "electronics-with-fluid", "electronics-or-assembling", "electronics-or-convecting"}
data.raw["assembling-machine"]["foundry"].crafting_categories = {"metallurgy", "pressing", "crafting-with-fluid-or-metallurgy", "metallurgy-or-assembling", "metallurgy-or-adv-metallurgy"}

data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories = {"crafting", "basic-crafting", "advanced-crafting", "assembly-or-robotics"}
data.raw["assembling-machine"]["assembling-machine-2"].crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid", "assembly-or-robotics", "fluid-assembly-or-robotics"}
data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid", "assembly-or-robotics", "fluid-assembly-or-robotics"}

data.raw.item["lab"].subgroup = "labs"
data.raw.item["biolab"].subgroup = "labs"

data.raw.lab["lab"].inputs = {
	"automation-science-pack",
	"logistic-science-pack",
	"military-science-pack",
	"chemical-science-pack",
	"production-science-pack",
	"utility-science-pack",
	"nuclear-science-pack",
	"space-science-pack",
	"lunar-science-pack",
	"metallurgic-science-pack",
	"agricultural-science-pack",
	"electromagnetic-science-pack",
	"material-science-pack",
	"cryogenic-science-pack",
	"pneumatic-science-pack",
	"genetic-science-pack",
	"particle-science-pack",
	"promethium-science-pack"
}
data.raw.lab["biolab"].inputs = {
	"automation-science-pack",
	"logistic-science-pack",
	"military-science-pack",
	"chemical-science-pack",
	"production-science-pack",
	"utility-science-pack",
	"nuclear-science-pack",
	"space-science-pack",
	"lunar-science-pack",
	"metallurgic-science-pack",
	"agricultural-science-pack",
	"electromagnetic-science-pack",
	"material-science-pack",
	"cryogenic-science-pack",
	"pneumatic-science-pack",
	"genetic-science-pack",
	"particle-science-pack",
	"promethium-science-pack"
}

data.raw.item["nuclear-fuel"].stack_size = 5

data.raw.item["oil-refinery"].subgroup = "fluid-machine"
data.raw.item["oil-refinery"].order = "b[oil-refinery]"
data.raw.item["chemical-plant"].subgroup = "fluid-machine"
data.raw.item["chemical-plant"].order = "c[chemical-plant]"
data.raw.item["cryogenic-plant"].subgroup = "fluid-machine"
data.raw.item["cryogenic-plant"].order = "d[cryogenic-plant]"

data.raw["heat-pipe"]["heat-pipe"].heating_radius = 2

data.raw.item["accumulator"].subgroup = "energy-production"
data.raw.item["solar-panel"].subgroup = "energy-production"
data.raw.item["steam-engine"].subgroup = "energy-production"
--data.raw.item["nuclear-reactor"].subgroup = "energy-production"
data.raw.item["nuclear-reactor"].order = "e[nuclear-reactor]"
data.raw.item["steam-turbine"].subgroup = "energy-production"
--data.raw.item["fusion-reactor"].subgroup = "energy-production"
data.raw.item["fusion-generator"].subgroup = "energy-production"

data.raw.item["storage-tank"].order = "b[fluid]-b[storage-tank]"
data.raw.item["heat-exchanger"].order = "c[heat-exchanger]"
data.raw.item["heat-pipe"].order = "d[heat-pipe]"

data.raw.recipe["plastic-bar"].hidden = true

data.raw.item["uranium-ore"].subgroup = "uranium-processing"
data.raw.item["uranium-ore"].order = "a[uranium-processing]-a[uranium-ore]"

data.raw.item["steel-plate"].subgroup = "alloy"
data.raw.item["steel-plate"].order = "b[steel-plate]"

data.raw.item["carbon"].subgroup = "chemical"
data.raw.item["carbon"].order = "a[carbon]"
data.raw.item["sulfur"].subgroup = "chemical"
data.raw.item["sulfur"].order = "b[sulfur]"


data.raw.item["solid-fuel"].subgroup = "chemical-product"
data.raw.item["solid-fuel"].order = "a[solid-fuel]"
data.raw.item["plastic-bar"].subgroup = "chemical-product"
data.raw.item["plastic-bar"].order = "b[plastic-bar]"
data.raw.item["explosives"].subgroup = "chemical-product"
data.raw.item["explosives"].order = "c[explosives]"


data.raw.item["low-density-structure"].subgroup = "space-parts"
data.raw.recipe["rocket-fuel"].category = "chemistry-or-cryogenics"
data.raw.item["rocket-fuel"].subgroup = "space-parts"
data.raw.item["rocket-part"].subgroup = "space-parts"

data.raw.item["ice"].subgroup = "selene-resources"
data.raw.item["ice"].order = "b[ice]"


data.raw.capsule["raw-fish"].subgroup = "nauvis-agriculture"
data.raw.capsule["raw-fish"].order = "b[nauvis-agriculture]-b[fish-breeding]"
data.raw.item["tree-seed"].subgroup = "nauvis-agriculture"
data.raw.item["tree-seed"].order = "b[nauvis-agriculture]-a[wood-processing]"
data.raw.item["biter-egg"].subgroup = "nauvis-agriculture"
data.raw.item["biter-egg"].order = "b[nauvis-agriculture]-d[nutrients-from-biter-egg]"

data.raw.item["ice-platform"].order = "c[landfill]-i[ice-platform]"
data.raw.item["foundation"].order = "c[landfill]-j[foundation]"

data.raw.recipe["molten-iron"].subgroup = "vulcanus-fluid"
data.raw.recipe["molten-copper"].subgroup = "vulcanus-fluid"
data.raw.recipe["casting-iron"].subgroup = "vulcanus-casting"
data.raw.recipe["casting-copper"].subgroup = "vulcanus-casting"
data.raw.recipe["casting-iron-gear-wheel"].subgroup = "vulcanus-products"
data.raw.recipe["casting-iron-gear-wheel"].order = "d[casting]-a[casting-iron-gear-wheel]"
data.raw.recipe["casting-iron-stick"].subgroup = "vulcanus-products"
data.raw.recipe["casting-iron-stick"].order = "d[casting]-b[casting-iron-stick]"
data.raw.recipe["casting-copper-cable"].subgroup = "vulcanus-products"
data.raw.recipe["casting-copper-cable"].order = "d[casting]-c[casting-copper-cable]"

data.raw.recipe["nutrients-from-spoilage"].subgroup = "agriculture-products"
data.raw.recipe["nutrients-from-spoilage"].order = "c[nutrients]-b[nutrients-from-spoilage]"
data.raw.recipe["nutrients-from-bioflux"].subgroup = "agriculture-products"
data.raw.recipe["nutrients-from-bioflux"].order = "c[nutrients]-a[nutrients-from-bioflux]"
--data.raw.item["nutrients"].subgroup = "agriculture-products"
data.raw.item["nutrients"].order = "a[agriculture]-h[nutrients]"
--data.raw.item["spoilage"].subgroup = "agriculture-products"
data.raw.item["spoilage"].order = "a[agriculture]-i[spoilage]"
data.raw.item["copper-bacteria"].order = "c[bacteria]-b[copper-bacteria]"
data.raw.item["iron-bacteria"].order = "c[bacteria]-a[iron-bacteria]"

data.raw.item["carbon-fiber"].hidden_in_factoriopedia = true
data.raw.item["carbon-fiber"].subgroup = "gleba-general"
data.raw.item["carbon-fiber"].order = "h[carbon-fiber]"

data.raw.recipe["copper-bacteria"].subgroup = "agriculture-products"
data.raw.recipe["copper-bacteria"].order = "b[organic-products]-f[copper-bacteria]"
data.raw.recipe["copper-bacteria"].icon = "__outer_moons__/graphics/icons/mash-copper.png"
data.raw.recipe["copper-bacteria-cultivation"].order = "c[bacteria]-b[cultivation]-b[copper]"
data.raw.recipe["iron-bacteria-cultivation"].order = "c[bacteria]-b[cultivation]-a[iron]"

data.raw.item["foundry"].order = "f[recycler]"
data.raw.item["recycler"].order = "h[recycler]"

data.raw.item["superconductor"].icon = "__outer_moons__/graphics/icons/superconductor.png"
data.raw.item["supercapacitor"].icon = "__outer_moons__/graphics/icons/supercapacitor.png"

data.raw.item["beacon"].weight = 50 * kg

data.raw.inserter["long-handed-inserter"].next_upgrade = "fast-long-handed-inserter"
data.raw.inserter["stack-inserter"].default_import_location = "selene"

--Flamethrower
data.raw["fluid-turret"]["flamethrower-turret"].attack_parameters.fluids = { {type = "crude-oil"},  {type = "heavy-oil", damage_modifier = 1.05}, {type = "light-oil", damage_modifier = 1.1}, {type = "ethanol", damage_modifier = 1.1} }

--Pressure fix
data.raw.recipe["metallurgic-science-pack"].surface_conditions = { { property = "pressure", min = 2000, max = 2000 } }
data.raw.recipe["big-mining-drill"].surface_conditions = { { property = "pressure", min = 2000, max = 2000 } }


data.raw.recipe["iron-bacteria"].surface_conditions = { { property = "pressure", min = 2500, max = 2500 } }
data.raw.recipe["iron-bacteria-cultivation"].surface_conditions = { { property = "pressure", min = 2500, max = 2500 } }
data.raw.recipe["copper-bacteria"].surface_conditions = { { property = "pressure", min = 2500, max = 2500 } }
data.raw.recipe["copper-bacteria-cultivation"].surface_conditions = { { property = "pressure", min = 2500, max = 2500 } }
data.raw.recipe["pentapod-egg"].surface_conditions = { { property = "pressure", min = 2500, max = 2500 } }
data.raw.recipe["agricultural-science-pack"].surface_conditions = { { property = "pressure", min = 2500, max = 2500 } }

--Equipment fix
data.raw["night-vision-equipment"]["night-vision-equipment"].shape = { width = 1, height = 1, type = "full"  }

--disable
data.raw.item["stone-furnace"].hidden = true
data.raw.item["stone-furnace"].subgroup = "other"
data.raw.recipe["stone-furnace"].hidden = true
data.raw.recipe["stone-furnace"].subgroup = "other"
data.raw.furnace["stone-furnace"].hidden = true
data.raw.furnace["stone-furnace"].next_upgrade = nil
data.raw.furnace["stone-furnace"].subgroup = "other"
data.raw.furnace["stone-furnace"].order = "z[stone-furnace]"

data.raw.item["steel-furnace"].hidden = true
data.raw.item["steel-furnace"].subgroup = "other"
data.raw.recipe["steel-furnace"].hidden = true
data.raw.recipe["steel-furnace"].subgroup = "other"
data.raw.furnace["steel-furnace"].hidden = true
data.raw.furnace["steel-furnace"].next_upgrade = nil
data.raw.furnace["steel-furnace"].subgroup = "other"
data.raw.furnace["steel-furnace"].order = "z[steel-furnace]"

data.raw.item["electric-furnace"].hidden = true
data.raw.item["electric-furnace"].subgroup = "other"
data.raw.recipe["electric-furnace"].hidden = true
data.raw.recipe["electric-furnace"].subgroup = "other"
data.raw.furnace["electric-furnace"].hidden = true
data.raw.furnace["electric-furnace"].subgroup = "other"
data.raw.furnace["electric-furnace"].order = "z[electric-furnace]"

data.raw.recipe["solid-fuel-from-petroleum-gas"].hidden = true

data.raw.recipe["nutrients-from-yumako-mash"].hidden = true
data.raw.recipe["coal-synthesis"].hidden = true
data.raw.recipe["solid-fuel-from-heavy-oil"].hidden = true
data.raw.recipe["solid-fuel-from-light-oil"].hidden = true