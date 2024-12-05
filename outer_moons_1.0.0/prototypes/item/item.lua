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
        icon = "__outer_moons__/graphics/icons/" .. name .. ".png",
        pictures = {
            size = 64,
            filename = "__outer_moons__/graphics/icons/" .. name .. ".png",
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
--        icon = "__outer_moons__/graphics/icons/bioluminescent-science-pack.png",
--        order = "k[bioluminescent_science_pack]",
--        pictures = meld.overwrite {
--            scale = 0.5,
--            size = 64,
--            filename = "__outer_moons__/graphics/icons/bioluminescent-science-pack.png",
--            draw_as_glow = true,
--    }
--})

data:extend({
	{
		type = "item",
		name = "rocket-part-new",
		icon = "__outer_moons__/graphics/icons/rocket-part-new.png",
		subgroup = "intermediate-product",
		order = "d[rocket-parts]-c[rocket-part-new]",
		inventory_move_sound = item_sounds.mechanical_inventory_move,
		pick_sound = item_sounds.mechanical_inventory_pickup,
		drop_sound = item_sounds.mechanical_inventory_move,
		stack_size = 20,
		weight = 20*kg,
	},

	{
        type = "item",
        name = "metallic-regolith",
        group = "intermediate-products",
        icon = "__outer_moons__/graphics/icons/regolith.png",
        pictures =
        {
            size = 64,
            filename = "__outer_moons__/graphics/icons/regolith.png",
            scale = 0.5,
            mipmap_count = 4,
        },
        subgroup = "selene-processes",
		default_import_location = "selene",
        color_hint = { text = "I" },
        order = "b[selene]-a[regolith]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 200,
        weight = 1 * kg
    },
	{
        type = "item",
        name = "aluminum-ore",
        group = "intermediate-products",
        icon = "__outer_moons__/graphics/icons/aluminum-ore.png",
        pictures =
        {
            size = 64,
            filename = "__outer_moons__/graphics/icons/aluminum-ore.png",
            scale = 0.5,
            mipmap_count = 4,
        },
        subgroup = "selene-processes",
		default_import_location = "selene",
        color_hint = { text = "I" },
        order = "b[selene]-b[aluminum-ore]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 5 * kg
    },
    {
        type = "item",
        name = "titanium-ore",
        group = "intermediate-products",
        icon = "__outer_moons__/graphics/icons/titanium-ore.png",
        pictures =
        {
            size = 64,
            filename = "__outer_moons__/graphics/icons/titanium-ore.png",
            scale = 0.5,
            mipmap_count = 4,
        },
        subgroup = "selene-processes",
		default_import_location = "selene",
        color_hint = { text = "I" },
        order = "b[selene]-c[titanium-ore]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 10 * kg
    },
	{
		type = "item",
		name = "titanium-plate",		
        group = "intermediate-products",
		icon = "__outer_moons__/graphics/icons/titanium-plate.png",
		subgroup = "selene-processes",
		order = "g[titanium-plate]",
		inventory_move_sound = item_sounds.metal_small_inventory_move,
		pick_sound = item_sounds.metal_small_inventory_pickup,
		drop_sound = item_sounds.metal_small_inventory_move,
		stack_size = 100,
		weight = 10 * kg,
	},
	{
		type = "item",
		name = "lye",		
        group = "intermediate-products",
		icon = "__outer_moons__/graphics/icons/lye.png",
		subgroup = "selene-processes",
		order = "d[lye]",
		inventory_move_sound = item_sounds.sulfur_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.sulfur_inventory_move,
		stack_size = 200,
		weight = 1 * kg,
	},
	{
		type = "item",
		name = "gibbsite",		
        group = "intermediate-products",
		icon = "__outer_moons__/graphics/icons/gibbsite.png",
		subgroup = "selene-processes",
		order = "e[gibbsite]",
		inventory_move_sound = item_sounds.sulfur_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.sulfur_inventory_move,
		stack_size = 200,
		weight = 1 * kg,
	},
	{
		type = "item",
		name = "alumina",		
        group = "intermediate-products",
		icon = "__outer_moons__/graphics/icons/alumina.png",
		subgroup = "selene-processes",
		order = "f[alumina]",
		inventory_move_sound = item_sounds.sulfur_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.sulfur_inventory_move,
		stack_size = 200,
		weight = 1 * kg,
	},
	{
		type = "item",
		name = "aluminum-plate",		
        group = "intermediate-products",
		icon = "__outer_moons__/graphics/icons/aluminum-plate.png",
		subgroup = "selene-processes",
		order = "g[aluminum-plate]",
		inventory_move_sound = item_sounds.metal_small_inventory_move,
		pick_sound = item_sounds.metal_small_inventory_pickup,
		drop_sound = item_sounds.metal_small_inventory_move,
		stack_size = 100,
		weight = 1 * kg,
	},
	
	-- structures
	{
		type = "item",
		name = "convector",
		icon = "__outer_moons__/graphics/icons/convector.png",
		subgroup = "production-machine",
		color_hint = { text = "1" },
		order = "g[convector]",
		inventory_move_sound = item_sounds.mechanical_inventory_move,
		pick_sound = item_sounds.mechanical_inventory_pickup,
		drop_sound = item_sounds.mechanical_inventory_move,
		place_result = "convector",
		stack_size = 20,
		weight = 50 * kg,
		random_tint_color = item_tints.iron_rust		
	},
	{
		type = "item",
		name = "adv-assembling-machine",
		icon = "__outer_moons__/graphics/icons/convector.png",
		subgroup = "production-machine",
		color_hint = { text = "1" },
		order = "d[adv-assembling-machine]",
		inventory_move_sound = item_sounds.mechanical_inventory_move,
		pick_sound = item_sounds.mechanical_inventory_pickup,
		drop_sound = item_sounds.mechanical_inventory_move,
		place_result = "adv-assembling-machine",
		stack_size = 20,
		weight = 100 * kg,
		random_tint_color = item_tints.iron_rust		
	},
})
