-- Productivity 3 changes
--data.raw["recipe"]["productivity-module-3"].ingredients = 
--{
--  {type = "item", name = "productivity-module-2", amount = 4},
--  {type = "item", name = "advanced-circuit", amount = 5},
--  {type = "item", name = "processing-unit", amount = 5},
--  {type = "item", name = "uranium-fuel-cell", amount = 1}
--}

-- Rocket parts
local rocket_part_recipe = data.raw["recipe"]["rocket-part"]
rocket_part_recipe.ingredients = {{type = "item", name = "rocket-part-new", amount = 1 } }

local rocket_silo_technology = data.raw["technology"]["rocket-silo"]
table.insert(rocket_silo_technology.effects, {type = "unlock-recipe", recipe = "rocket-part-new"})

-- Cryo Plant changes
data.raw["assembling-machine"]["cryogenic-plant"].effect_receiver = { base_effect = { productivity = 0.5 } }
data.raw["assembling-machine"]["cryogenic-plant"].module_slots = 4

data.raw["recipe"]["fluoroketone-cooling"].ingredients = { { type = "fluid", name = "fluoroketone-hot", amount = 18 } }
data.raw["recipe"]["fluoroketone-cooling"].results = { { type = "fluid", name= "fluoroketone-cold", amount = 12 } }
data.raw["recipe"]["fluoroketone-cooling"].energy_required = 9