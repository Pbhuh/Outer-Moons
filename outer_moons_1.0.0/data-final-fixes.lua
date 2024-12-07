-- Rocket parts
data.raw["recipe"]["rocket-part"].ingredients = {{type = "item", name = "rocket-part-new", amount = 1 } }

-- Cryo Plant changes
data.raw["assembling-machine"]["cryogenic-plant"].effect_receiver = { base_effect = { productivity = 0.5 } }
data.raw["assembling-machine"]["cryogenic-plant"].module_slots = 4

data.raw["recipe"]["fluoroketone-cooling"].ingredients = { { type = "fluid", name = "fluoroketone-hot", amount = 18 } }
data.raw["recipe"]["fluoroketone-cooling"].results = { { type = "fluid", name= "fluoroketone-cold", amount = 12 } }
data.raw["recipe"]["fluoroketone-cooling"].energy_required = 9