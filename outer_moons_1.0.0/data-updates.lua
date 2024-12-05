
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

-- Productivity Module 3 tech changes
--data.raw.technology["productivity-module-3"].prerequisites =
--{
--  "productivity-module-2",
--  "kovarex-enrichment-process",
--  "metallurgic-science-pack", 
--  "agricultural-science-pack", 
--  "electromagnetic-science-pack"
--}
--data.raw.technology["productivity-module-3"].unit.ingredients =
--{
--  {"automation-science-pack", 1},
--  {"logistic-science-pack", 1},
--  {"chemical-science-pack", 1},
--  {"space-science-pack", 1},
--  {"metallurgic-science-pack", 1},
--  {"agricultural-science-pack", 1},
--  {"electromagnetic-science-pack", 1}
--}

--data.raw.entity["assembling-machine-3"].next_upgrade = "adv-assembling-machine"
-- Agricultural Science Pack doesn't spoil
data.raw.tool["agricultural-science-pack"].spoil_ticks = nil
data.raw.tool["agricultural-science-pack"].spoil_result = nil