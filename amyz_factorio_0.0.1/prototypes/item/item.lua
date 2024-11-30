local item_sounds = require("__base__.prototypes.item_sounds")
local meld = require("meld")

---Creates a basic item
---@param name string name of the item
---@param stack_size integer? The stack size of the item
---@param weight integer? The weight of the item
---@param glow boolean? Does this item glow?
---@param size int? The size of the icon image
---@param extra table? Extra parameters to set?
---@return table
local function quick_item(name, stack_size, weight, glow, extra)
    return meld({
        type = "item",
        name = name,
        subgroup = "intermediate-product",
        stack_size = stack_size or 100,
        icon = "__amyz_factorio__/graphics/icons/" .. name .. ".png",
        pictures = {
            size = 64,
            filename = "__amyz_factorio__/graphics/icons/" .. name .. ".png",
            scale = 0.5,
            draw_as_glow = glow or false,
        },
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        weight = weight or (2 * kg)
    }, extra or {})
end

--local bioluminescent_science_pack = meld(
--    table.deepcopy(data.raw["tool"]["automation-science-pack"]), {
--        name = "bioluminescent-science-pack",
--        icon = "__amyz_factorio__/graphics/icons/bioluminescent-science-pack.png",
--        order = "k[bioluminescent_science_pack]",
--        pictures = meld.overwrite {
--            scale = 0.5,
--            size = 64,
--            filename = "__amyz_factorio__/graphics/icons/bioluminescent-science-pack.png",
--            draw_as_glow = true,
--    }
--})

data:extend({
    {
        type = "item",
        name = "titanium-ore",
        group = "intermediate-products",
        icon = "__amyz_factorio__/graphics/icons/titanium-ore.png",
        pictures =
        {
            size = 64,
            filename = "__amyz_factorio__/graphics/icons/titanium-ore.png",
            scale = 0.5,
            mipmap_count = 4,
        },
        subgroup = "raw-resource",
        color_hint = { text = "I" },
        order = "e[titanium-ore]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    }
})
