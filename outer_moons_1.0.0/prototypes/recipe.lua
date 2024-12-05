data:extend({
	{
		type = "recipe",
		name = "rocket-part-new",
		energy_required = 3,
		enabled = false,
		category = "crafting",
		ingredients =
		{
		  {type = "item", name = "processing-unit", amount = 10},
		  {type = "item", name = "low-density-structure", amount = 10},
		  {type = "item", name = "rocket-fuel", amount = 10}
		},
		results = {{type="item", name="rocket-part-new", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "chloralkali-process",
		icon = "__outer_moons__/graphics/icons/chloralkali.png",
		category = "chemistry-or-cryogenics",
		subgroup = "selene-processes",
		order = "b[selene]-b[chloralkali-process]",
		auto_recycle = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "fluid", name = "saline", amount = 50},
		},
		results =
		{
		  {type = "item", name = "lye", amount = 1},
		  {type = "fluid", name = "water", amount = 50},
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
		icon = "__outer_moons__/graphics/icons/gibbsite-extraction.png",
		category = "chemistry-or-cryogenics",
		subgroup = "selene-processes",
		order = "b[selene]-c[gibbsite-extraction]",
		auto_recycle = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "aluminum-ore", amount = 2 },
		  {type = "item", name = "lye", amount = 3 },
		},
		results =
		{
		  {type = "item", name = "gibbsite", amount = 1},
		  {type = "fluid", name = "red-mud", amount = 8},
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
		icon = "__outer_moons__/graphics/icons/alumina-crystallization.png",
		category = "chemistry-or-cryogenics",
		subgroup = "selene-processes",
		order = "b[selene]-d[gibbsite-crystallization]",
		auto_recycle = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "gibbsite", amount = 1},
		  {type = "fluid", name = "water", amount = 10},
		},
		results =
		{
		  {type = "item", name = "alumina", amount = 3},
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
		icon = "__outer_moons__/graphics/icons/red-mud-reprocessing.png",
		category = "chemistry-or-cryogenics",
		subgroup = "selene-processes",
		order = "b[selene]-e[red-mud-reprocessing]",
		auto_recycle = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "fluid", name = "water", amount = 20},
		  {type = "fluid", name = "red-mud", amount = 5},
		},
		results =
		{
		  {type = "item", name = "iron-ore", amount = 1, probability = 0.4, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "copper-ore", amount = 1, probability = 0.1, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "alumina", amount = 1, probability = 0.02, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "titanium-ore", amount = 1, probability = 0.03, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "calcite", amount = 1, probability =0.2, show_details_in_recipe_tooltip = false},
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
	{
		type = "recipe",
		name = "titanium-plate",
		category = "smelting",
		subgroup = "selene-processes",
		order = "a[selene]-b[titanium-plate]",
		enabled = true,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 5},
		  {type = "item", name = "titanium-ore", amount = 5},
		  {type = "fluid", name = "oxygen", amount = 20},
		},
		energy_required = 6.4,
		results = {{type="item", name="titanium-plate", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "casting-titanium-plate",
		icon = "__outer_moons__/graphics/icons/casting-titanium.png",
		category = "metallurgy",
		subgroup = "selene-processes",
		order = "a[selene]-c[titanium-plate]",
		enabled = true,
		ingredients =
		{
		  {type = "item", name = "titanium-ore", amount = 6},
		  {type = "fluid", name = "molten-iron", amount = 15},
		},
		energy_required = 10,
		results = {{type="item", name="titanium-plate", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "ethylene",
		icon = "__outer_moons__/graphics/icons/fluid/ethylene.png",
		category = "chemistry-or-cryogenics",
		subgroup = "selene-processes",
		order = "b[selene]-f[ethylene]",
		auto_recycle = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "carbon", amount = 10},
		  {type = "fluid", name = "water", amount = 30},
		},
		results =
		{
		  {type = "fluid", name = "ethylene", amount = 5},
		  {type = "fluid", name = "oxygen", amount = 30},
		},
		allow_productivity = true,
		enabled = true,
		always_show_made_in = true,
		always_show_products = true,
		allow_decomposition = false,
		{
		  {
			property = "pressure",
			min = 0,
			max = 100
		  }
		},
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
		name = "polyethlyene",
		icon = "__outer_moons__/graphics/icons/fluid/ethylene.png",
		category = "chemistry-or-cryogenics",
		subgroup = "selene-processes",
		order = "b[selene]-g[polyethlyene]",
		auto_recycle = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "carbon", amount = 4},
		  {type = "fluid", name = "ethylene", amount = 10},
		},
		results =
		{
		  {type = "item", name = "plastic-bar", amount = 2},
		},
		allow_productivity = true,
		enabled = true,
		always_show_made_in = true,
		always_show_products = true,
		allow_decomposition = false,
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 0,
			max = 100
		  }
		},
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
		name = "solid-fuel-from-aluminum",
		icon = "__outer_moons__/graphics/icons/solid-fuel-from-aluminum.png",
		energy_required = 1,
		enabled = true,
		category = "chemistry",
		subgroup = "selene-processes",
		order = "b[selene]-h[solid-fuel-from-aluminum]",
		{
		  {type = "fluid", name = "aluminum-plate", amount = 5}
		},
		results =
		{
		  {type = "item", name = "solid-fuel", amount = 1}
		},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 0.222, g = 0.188, b = 0.344, a = 1.000}, -- #383057ff
		  secondary = {r = 0.394, g = 0.481, b = 0.594, a = 1.000}, -- #647a97ff
		  tertiary = {r = 0.370, g = 0.362, b = 0.362, a = 1.000}, -- #5e5c5cff
		  quaternary = {r = 0.192, g = 0.210, b = 0.308, a = 1.000}, -- #30354eff
		}
	},
	{
		type = "recipe",
		name = "oxygen-rocket-fuel",
		icon = "__outer_moons__/graphics/icons/oxygen-rocket-fuel.png",
		energy_required = 5,
		enabled = true,
		category = "chemistry-or-cryogenics",
		subgroup = "selene-processes",
		order = "b[selene]-i[oxygen-rocket-fuel]",
		ingredients =
		{
		  {type = "item", name = "solid-fuel", amount = 10},
		  {type="fluid", name = "oxygen", amount= 50},
		},
		results = {{type="item", name="rocket-fuel", amount=1}},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 0.996, g = 0.742, b = 0.408, a = 1.000}, -- #febd68ff
		  secondary = {r = 0.446, g = 0.392, b = 0.168, a = 1.000}, -- #71632aff
		  tertiary = {r = 0.347, g = 0.388, b = 0.387, a = 1.000}, -- #586262ff
		  quaternary = {r = 0.656, g = 0.562, b = 0.264, a = 1.000}, -- #a78f43ff
		}
	},
	
	--regolith
	{
		type = "recipe",
		name = "amalgamate-regolith",
		icon = "__outer_moons__/graphics/icons/amalgamate-regolith.png",
		category = "convecting",
		subgroup = "selene-processes",
		order = "b[selene]-a[amalgamate-regolith]",
		auto_recycle = false,
		energy_required = 5,
		ingredients = {{type = "item", name = "metallic-regolith", amount = 5}},
		results = {
			{type="item", name="stone", amount=1, probability=0.5, show_details_in_recipe_tooltip = false},
			{type="item", name="iron-ore", amount=1, probability=0.4, show_details_in_recipe_tooltip = false},
			{type="item", name="copper-ore", amount=1, probability=0.1, show_details_in_recipe_tooltip = false},
			{type="item", name="sulfur", amount=1, probability=0.05, show_details_in_recipe_tooltip = false},
			{type="item", name="carbon", amount=1, probability=0.2, show_details_in_recipe_tooltip = false},
			--{type="item", name="aluminum-ore", amount=1, probability=0.03},
			--{type="item", name="titanium-ore", amount=1, probability=0.02},
			{type="item", name="uranium-ore", amount=1, probability=0.01, show_details_in_recipe_tooltip = false}
		},
		allow_productivity = true,
		enabled = true
	},
	--structures
	{
		type = "recipe",
		name = "convector",
		enabled = true,
		ingredients =
		{
		  {type = "item", name = "electronic-circuit", amount = 5},
		  {type = "item", name = "iron-gear-wheel", amount = 5},
		  {type = "item", name = "copper-cable", amount = 10},
		  {type = "item", name = "aluminum-plate", amount = 15}
		 -- {type = "item", name = "concrete", amount = 5}
		},
		results = {{type="item", name="convector", amount=1}}
	},
	{
		type = "recipe",
		name = "adv-assembling-machine",
		icon = "__outer_moons__/graphics/icons/adv-assembler.png",
		enabled = true,
		ingredients =
		{
		  {type = "item", name = "assembling-machine-3", amount = 2},
		  {type = "item", name = "productivity-module-2", amount = 2},
		  {type = "item", name = "aluminum-plate", amount = 10},
		  {type = "item", name = "titanium-plate", amount = 5}
		},
		results = {{type="item", name="adv-assembling-machine", amount=1}}
	},
})
