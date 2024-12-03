data:extend({
	{
		type = "recipe",
		name = "chloralkali-process",
		icon = "__outer_moons__/graphics/icons/fluid/saline.png",
		category = "chemistry-or-cryogenics",
		subgroup = "selene-processes",
		order = "a[selene]-a[chloralkali-process]",
		auto_recycle = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "fluid", name = "saline", amount = 50},
		},
		results =
		{
		  {type = "item", name = "lye", amount = 1},
		  {type = "fluid", name = "water", amount = 30},
		  {type = "fluid", name = "chlorine", amount = 20},
		},
		allow_productivity = true,
		enabled = true,
		always_show_made_in = true,
		always_show_products = true,
		allow_decomposition = false,
		crafting_machine_tint =
		{
		  primary = {r = 0.596, g = 0.764, b = 0.780, a = 1.000},
		  secondary = {r = 0.551, g = 0.762, b = 0.844, a = 1.000},
		  tertiary = {r = 0.596, g = 0.773, b = 0.895, a = 1.000},
		  quaternary = {r = 0.290, g = 0.734, b = 1, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "gibbsite-extraction",
		icon = "__outer_moons__/graphics/icons/gibbsite.png",
		category = "chemistry-or-cryogenics",
		subgroup = "selene-processes",
		order = "a[selene]-b[gibbsite-extraction]",
		auto_recycle = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "aluminum-ore", amount = 1 },
		  {type = "item", name = "lye", amount = 1 },
		},
		results =
		{
		  {type = "item", name = "gibbsite", amount = 1},
		  {type = "fluid", name = "red-mud", amount = 5},
		},
		allow_productivity = true,
		enabled = true,
		always_show_made_in = true,
		always_show_products = true,
		allow_decomposition = false,
		crafting_machine_tint =
		{
		  primary = {r = 0.596, g = 0.764, b = 0.780, a = 1.000},
		  secondary = {r = 0.551, g = 0.762, b = 0.844, a = 1.000},
		  tertiary = {r = 0.596, g = 0.773, b = 0.895, a = 1.000},
		  quaternary = {r = 0.290, g = 0.734, b = 1, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "alumina-crystallization",
		icon = "__outer_moons__/graphics/icons/alumina.png",
		category = "chemistry-or-cryogenics",
		subgroup = "selene-processes",
		order = "a[selene]-c[gibbsite-crystallization]",
		auto_recycle = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "gibbsite", amount = 1},
		  {type = "fluid", name = "water", amount = 10},
		},
		results =
		{
		  {type = "item", name = "alumina", amount = 5},
		},
		allow_productivity = true,
		enabled = true,
		always_show_made_in = true,
		always_show_products = true,
		allow_decomposition = false,
		crafting_machine_tint =
		{
		  primary = {r = 0.596, g = 0.764, b = 0.780, a = 1.000},
		  secondary = {r = 0.551, g = 0.762, b = 0.844, a = 1.000},
		  tertiary = {r = 0.596, g = 0.773, b = 0.895, a = 1.000},
		  quaternary = {r = 0.290, g = 0.734, b = 1, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "red-mud-reprocessing",
		icon = "__outer_moons__/graphics/icons/fluid/red-mud.png",
		category = "chemistry-or-cryogenics",
		subgroup = "selene-processes",
		order = "a[selene]-d[red-mud-reprocessing]",
		auto_recycle = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "fluid", name = "water", amount = 20},
		  {type = "fluid", name = "red-mud", amount = 10},
		},
		results =
		{
		  {type = "item", name = "calcite", amount = 5},
		},
		allow_productivity = true,
		enabled = true,
		always_show_made_in = true,
		always_show_products = true,
		allow_decomposition = false,
		crafting_machine_tint =
		{
		  primary = {r = 0.596, g = 0.764, b = 0.780, a = 1.000},
		  secondary = {r = 0.551, g = 0.762, b = 0.844, a = 1.000},
		  tertiary = {r = 0.596, g = 0.773, b = 0.895, a = 1.000},
		  quaternary = {r = 0.290, g = 0.734, b = 1, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "aluminum-plate",
		category = "smelting",
		subgroup = "selene-processes",
		order = "a[selene]-a[aluminum-plate]",
		auto_recycle = false,
		energy_required = 6.4,
		ingredients = {{type = "item", name = "alumina", amount = 1}},
		results = {{type="item", name="aluminum-plate", amount=1}},
		allow_productivity = true,
		enabled = true
	},
})
