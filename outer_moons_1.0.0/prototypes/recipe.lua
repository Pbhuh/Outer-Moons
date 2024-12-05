data:extend({
	{
		type = "recipe",
		name = "chloralkali-process",
		icon = "__outer_moons__/graphics/icons/chloralkali.png",
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
		icon = "__outer_moons__/graphics/icons/gibbsite.png",
		category = "chemistry-or-cryogenics",
		subgroup = "selene-processes",
		order = "a[selene]-b[gibbsite-extraction]",
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
		order = "a[selene]-d[red-mud-reprocessing]",
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
})
