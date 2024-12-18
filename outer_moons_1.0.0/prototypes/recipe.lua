data:extend({
	--Chemistry
	{
		type = "recipe",
		name = "basic-oil-processing",
		category = "oil-processing",
		enabled = false,
		energy_required = 5,
		ingredients =
		{
		  {type = "fluid", name = "steam", amount = 50},
		  {type = "fluid", name = "crude-oil", amount = 100}
		},
		results =
		{
		  {type = "fluid", name = "petroleum-gas", amount = 45, fluidbox_index = 3},
		  {type = "fluid", name = "sulfane", amount = 70, fluidbox_index = 4}
		},
		allow_productivity = true,
		icon = "__base__/graphics/icons/fluid/basic-oil-processing.png",
		subgroup = "fluid-recipes",
		order = "a[oil-processing]-a[basic-oil-processing]",
		main_product = ""
	},
	{
		type = "recipe",
		name = "advanced-oil-processing",
		category = "oil-processing",
		enabled = false,
		energy_required = 5,
		ingredients =
		{
		  {type = "fluid", name = "steam", amount = 50},
		  {type = "fluid", name = "crude-oil", amount = 100}
		},
		results =
		{
		  {type = "fluid", name = "heavy-oil", amount = 25},
		  {type = "fluid", name = "light-oil", amount = 45},
		  {type = "fluid", name = "sulfane", amount = 95}
		},
		allow_productivity = true,
		icon = "__outer_moons__/graphics/icons/fluid/advanced-oil-processing.png",
		subgroup = "fluid-recipes",
		order = "a[oil-processing]-c[advanced-oil-processing]"
	},
	{
		type = "recipe",
		name = "coal-liquefaction",
		category = "oil-processing",
		enabled = false,
		energy_required = 5,
		ingredients =
		{
		  {type = "item", name = "coal", amount = 10},
		  {type = "fluid", name = "heavy-oil", amount = 25, ignored_by_stats = 25},
		  {type = "fluid", name = "steam", amount = 50}
		},
		results =
		{
		  {type = "fluid", name = "heavy-oil", amount = 90, ignored_by_stats = 25, ignored_by_productivity = 25},
		  {type = "fluid", name = "light-oil", amount = 20},
		  {type = "fluid", name = "sulfane", amount = 120}
		},
		allow_productivity = true,
		icon = "__base__/graphics/icons/fluid/coal-liquefaction.png",
		subgroup = "fluid-recipes",
		order = "a[oil-processing]-d[coal-liquefaction]",
		allow_decomposition = false
	},
	{
		type = "recipe",
		name = "heavy-oil-cracking",
		category = "chemistry-or-cryogenics",
		enabled = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "fluid", name = "steam", amount = 50},
		  {type = "fluid", name = "heavy-oil", amount = 40}
		},
		results =
		{
		  {type = "fluid", name = "light-oil", amount = 30}
		},
		allow_productivity = true,
		main_product = "",
		icon = "__outer_moons__/graphics/icons/fluid/heavy-oil-cracking.png",
		subgroup = "fluid-recipes",
		order = "b[fluid-chemistry]-a[heavy-oil-cracking]",
		crafting_machine_tint =
		{
		  primary = {r = 1.000, g = 0.642, b = 0.261, a = 1.000}, -- #ffa342ff
		  secondary = {r = 1.000, g = 0.722, b = 0.376, a = 1.000}, -- #ffb85fff
		  tertiary = {r = 0.854, g = 0.659, b = 0.576, a = 1.000}, -- #d9a892ff
		  quaternary = {r = 1.000, g = 0.494, b = 0.271, a = 1.000}, -- #ff7e45ff
		}
	},
	{
		type = "recipe",
		name = "light-oil-cracking",
		category = "chemistry-or-cryogenics",
		enabled = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "fluid", name = "steam", amount = 50},
		  {type = "fluid", name = "light-oil", amount = 30 },
		},
		results =
		{
		  {type = "fluid", name = "naphtha", amount = 15 },
		},
		allow_productivity = true,
		main_product = "",
		icon = "__outer_moons__/graphics/icons/fluid/light-oil-cracking.png",
		subgroup = "fluid-recipes",
		order = "b[fluid-chemistry]-b[light-oil-cracking]",
		crafting_machine_tint =
		{
		  primary = {r = 0.69, g = 0.55, b = 0.42, a = 1.000}, -- #fefeffff
		  secondary = {r = 0.86, g = 0.85, b = 0.30, a = 1.000}, -- #c4c4c4ff
		  tertiary = {r = 0.768, g = 0.665, b = 0.762, a = 1.000}, -- #c3a9c2ff
		  quaternary = {r = 0.000, g = 0.000, b = 0.000, a = 1.000}, -- #000000ff
		}		
	},
	{
		type = "recipe",
		name = "petroleum-gas-processing",
		icon = "__outer_moons__/graphics/icons/fluid/petroleum-gas-processing.png",
		category = "chemistry-or-cryogenics",
		subgroup = "fluid-recipes",
		order = "b[fluid-chemistry]-c[petroleum-gas-processing]",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "heavy-oil", amount = 30},
		  {type = "fluid", name = "light-oil", amount = 40}
		},
		results =
		{
		  {type = "fluid", name = "petroleum-gas", amount = 50}
		},		
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 0.764, g = 0.596, b = 0.780, a = 1.000}, -- #c298c6ff
		  secondary = {r = 0.762, g = 0.551, b = 0.844, a = 1.000}, -- #c28cd7ff
		  tertiary = {r = 0.895, g = 0.773, b = 0.596, a = 1.000}, -- #e4c597ff
		  quaternary = {r = 1.000, g = 0.734, b = 0.290, a = 1.000}, -- #ffbb49ff
		}
	},
	{
		type = "recipe",
		name = "olefins-extraction",
		icon = "__outer_moons__/graphics/icons/fluid/olefins-extraction.png",
		category = "chemistry-or-cryogenics",
		subgroup = "fluid-recipes",
		order = "b[fluid-chemistry]-e[olefins-extraction]",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "naphtha", amount = 50 },
		  {type = "fluid", name = "light-oil", amount = 20 },
		},
		results =
		{
		  {type = "fluid", name = "olefins", amount = 25 },
		},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 0.69, g = 0.55, b = 0.42, a = 1.000}, -- #fefeffff
		  secondary = {r = 0.86, g = 0.85, b = 0.30, a = 1.000}, -- #c4c4c4ff
		  tertiary = {r = 0.768, g = 0.665, b = 0.762, a = 1.000}, -- #c3a9c2ff
		  quaternary = {r = 0.000, g = 0.000, b = 0.000, a = 1.000}, -- #000000ff
		}
	},
	{
		type = "recipe",
		name = "aromatics-extraction",
		icon = "__outer_moons__/graphics/icons/fluid/aromatics-extraction.png",
		category = "chemistry-or-cryogenics",
		subgroup = "fluid-recipes",
		order = "b[fluid-chemistry]-f[aromatics-extraction]",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "naphtha", amount = 50 },
		  {type = "fluid", name = "petroleum-gas", amount = 25 },
		},
		results =
		{
		  {type = "fluid", name = "aromatics", amount = 20 },
		},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 0.69, g = 0.55, b = 0.42, a = 1.000}, -- #fefeffff
		  secondary = {r = 0.86, g = 0.85, b = 0.30, a = 1.000}, -- #c4c4c4ff
		  tertiary = {r = 0.768, g = 0.665, b = 0.762, a = 1.000}, -- #c3a9c2ff
		  quaternary = {r = 0.000, g = 0.000, b = 0.000, a = 1.000}, -- #000000ff
		}
	},
	{
		type = "recipe",
		name = "sulfur",
		category = "chemistry-or-cryogenics",
		icon = "__outer_moons__/graphics/icons/fluid/sulfur-crystallization.png",
		energy_required = 1,
		enabled = false,
		ingredients =
		{
		  --{type = "fluid", name = "water", amount = 30},
		  {type = "fluid", name = "sulfane", amount = 50}
		},
		results =
		{
		  {type = "item", name = "sulfur", amount = 4}
		},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 1.000, g = 0.995, b = 0.089, a = 1.000}, -- #fffd16ff
		  secondary = {r = 1.000, g = 0.974, b = 0.691, a = 1.000}, -- #fff8b0ff
		  tertiary = {r = 0.723, g = 0.638, b = 0.714, a = 1.000}, -- #b8a2b6ff
		  quaternary = {r = 0.954, g = 1.000, b = 0.350, a = 1.000}, -- #f3ff59ff
		}
	},
	{
		type = "recipe",
		name = "plastic-bar",
		category = "chemistry-or-cryogenics",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "olefins", amount = 30 },
		  {type = "fluid", name = "aromatics", amount = 20 },
		  {type = "item", name = "sulfur", amount = 2 }
		},
		results =
		{
		  {type = "item", name = "plastic-bar", amount = 2}
		},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 1.000, g = 1.000, b = 1.000, a = 1.000}, -- #fefeffff
		  secondary = {r = 0.771, g = 0.771, b = 0.771, a = 1.000}, -- #c4c4c4ff
		  tertiary = {r = 0.768, g = 0.665, b = 0.762, a = 1.000}, -- #c3a9c2ff
		  quaternary = {r = 0.000, g = 0.000, b = 0.000, a = 1.000}, -- #000000ff
		}
	},
	{
		type = "recipe",
		name = "chemical-science-pack",
		category = "crafting-with-fluid",
		enabled = false,
		energy_required = 24,
		ingredients =
		{
		  {type = "item", name = "engine-unit", amount = 2},
		  {type = "item", name = "advanced-circuit", amount = 3},
		  {type = "fluid", name = "petroleum-gas", amount = 10}
		},
		results = {{type="item", name="chemical-science-pack", amount=2}},
		crafting_machine_tint =
		{
		  primary = {r = 0.0, g = 0.8, b = 1.0, a = 1.000},
		  secondary = {r = 0.0, g = 0.8, b = 1.0, a = 1.000},
		},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "acid-neutralisation",
		icon = "__space-age__/graphics/icons/fluid/acid-neutralisation.png",
		category = "chemistry-or-cryogenics",
		subgroup = "fluid-recipes",
		order = "d[other-chemistry]-a[acid-neutralisation]",
		auto_recycle = false,
		enabled = false,
		--surface_conditions =
		--{
		--  {
		--	property = "pressure",
		--	min = 4000,
		--	max = 4000
		--  }
		--},
		ingredients =
		{
		  {type = "item", name = "calcite", amount = 1},
		  {type = "fluid", name = "sulfuric-acid", amount = 1000},
		},
		energy_required = 5,
		results =
		{
		  {type = "fluid", name = "steam", amount = 10000, temperature = 500}
		},
		allow_productivity = false,
		always_show_products = true,
		show_amount_in_title = false,
		allow_decomposition = false,
		crafting_machine_tint =
		{
		  primary = {r = 1.000, g = 0.912, b = 0.036, a = 1.000}, -- #ffe809ff
		  secondary = {r = 0.707, g = 0.797, b = 0.335, a = 1.000}, -- #b4cb55ff
		  tertiary = {r = 0.681, g = 0.635, b = 0.486, a = 1.000}, -- #ada17bff
		  quaternary = {r = 1.000, g = 0.804, b = 0.000, a = 1.000}, -- #ffcd00ff
		}
	},
	-- Explosives
	{
		type = "recipe",
		name = "niter",
		icon = "__outer_moons__/graphics/icons/niter.png",
		category = "chemistry",
		order = "h[niter]",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 1000,
			max = 2000
		  }
		},
		enabled = false,
		allow_productivity = true,
		auto_recycle = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "stone", amount = 5},
		  {type = "fluid", name = "water", amount = 6},
		  {type = "fluid", name = "sulfuric-acid", amount = 8},
		},
		results = {{type="item", name="niter", amount=2}}
	},
	{
		type = "recipe",
		name = "explosives",
		category = "chemistry",
		crafting_machine_tint =
		{
		  primary = {r = 0.968, g = 0.381, b = 0.259, a = 1.000}, -- #f66142ff
		  secondary = {r = 0.892, g = 0.664, b = 0.534, a = 1.000}, -- #e3a988ff
		  tertiary = {r = 1.000, g = 0.978, b = 0.513, a = 1.000}, -- #fff982ff
		  quaternary = {r = 0.210, g = 0.170, b = 0.013, a = 1.000}, -- #352b03ff
		},
		energy_required = 4,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "sulfur", amount = 1},
		  {type = "item", name = "coal", amount = 2},
		  {type = "item", name = "niter", amount = 10}
		},
		results = {{type="item", name="explosives", amount=2}},
		allow_productivity = true
	},
	--Silicon
	{
		type = "recipe",
		name = "silicon-ore",
		category = "chemistry",
		enabled = false,
		auto_recycle = false,
		energy_required = 5,
		ingredients =
		{
		  {type = "item", name = "stone", amount = 5},
		  {type = "item", name = "coal", amount = 2},
		  {type = "fluid", name = "sulfuric-acid", amount = 10}
		},
		results = {{type="item", name="silicon-ore", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "silicon-plate",
		category = "smelting",
		auto_recycle = false,
		energy_required = 3.2,
		ingredients = {{type = "item", name = "silicon-ore", amount = 1}},
		results = {{type="item", name="silicon-plate", amount=1}},
		allow_productivity = true
	},
	--Circuits
	{
		type = "recipe",
		name = "advanced-circuit",
		enabled = false,
		energy_required = 6,
		ingredients =
		{
		  {type = "item", name = "electronic-circuit", amount = 2},
		  {type = "item", name = "silicon-plate", amount = 2},
		  {type = "item", name = "copper-cable", amount = 4}
		},
		results = {{type="item", name="advanced-circuit", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "processing-unit",
		category = "crafting-with-fluid",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "plastic-bar", amount = 10},
		  {type = "item", name = "advanced-circuit", amount = 4},
		  {type = "fluid", name = "sulfuric-acid", amount = 5}
		},
		results = {{type="item", name="processing-unit", amount=1}},
		allow_productivity = true
	},
	--Rocket parts
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
	--Selene
	--regolith
	{
		type = "recipe",
		name = "amalgamate-regolith",
		icon = "__outer_moons__/graphics/icons/amalgamate-regolith.png",
		category = "convecting",
		subgroup = "selene-processes",
		order = "a[selene]-a[amalgamate-regolith]",
		auto_recycle = false,
		energy_required = 5,
		ingredients = {{type = "item", name = "metallic-regolith", amount = 5}},
		results = {
			{type="item", name="stone", amount=1, probability=0.5, show_details_in_recipe_tooltip = false},
			{type="item", name="iron-ore", amount=1, probability=0.4, show_details_in_recipe_tooltip = false},
			{type="item", name="carbon", amount=1, probability=0.2, show_details_in_recipe_tooltip = false},
			{type="item", name="copper-ore", amount=1, probability=0.15, show_details_in_recipe_tooltip = false},
			{type="item", name="silicon-ore", amount=1, probability=0.1, show_details_in_recipe_tooltip = false},
			{type="item", name="sulfur", amount=1, probability=0.05, show_details_in_recipe_tooltip = false},
			--{type="item", name="aluminum-ore", amount=1, probability=0.03},
			--{type="item", name="titanium-ore", amount=1, probability=0.02},
			{type="item", name="uranium-ore", amount=1, probability=0.01, show_details_in_recipe_tooltip = false}
		},
		allow_productivity = true,
		enabled = false
	},
	--Aluminum
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
		enabled = false,
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
		enabled = false,
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
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		allow_decomposition = false,
		show_amount_in_title = false,
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
		  {type = "fluid", name = "oxygen", amount = 10, show_details_in_recipe_tooltip = false},
		},
		allow_productivity = true,
		enabled = false,
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
		category = "convecting",
		subgroup = "selene-processes",
		order = "a[selene]-b[aluminum-plate]",
		auto_recycle = false,
		energy_required = 6.4,
		ingredients = {{type = "item", name = "alumina", amount = 2}},
		results = {{type="item", name="aluminum-plate", amount=1}},
		allow_productivity = true,
		enabled = false
	},
	--Titanium
	{
		type = "recipe",
		name = "titanium-plate",
		category = "advanced-smelting",
		subgroup = "selene-processes",
		order = "a[selene]-c[titanium-plate]",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 5},
		  {type = "item", name = "titanium-ore", amount = 5},
		  --{type = "fluid", name = "oxygen", amount = 20},
		},
		energy_required = 6.4,
		results = {{type="item", name="titanium-plate", amount=1}},
		allow_productivity = true,
		auto_recycle = false,
	},
	{
		type = "recipe",
		name = "casting-titanium-plate",
		icon = "__outer_moons__/graphics/icons/casting-titanium.png",
		category = "metallurgy",
		subgroup = "vulcanus-processes",
		order = "b[casting]-c[casting-titanium-plate]",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "titanium-ore", amount = 6},
		  {type = "fluid", name = "molten-iron", amount = 15, fluidbox_multiplier = 10},
		},
		energy_required = 10,
		results = {{type="item", name="titanium-plate", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "water-electrolysis",
		icon = "__outer_moons__/graphics/icons/fluid/water-electrolysis.png",
		category = "chemistry-or-cryogenics",
		subgroup = "fluid-recipes",
		order = "d[other-chemistry]-d[water-electrolysis]",
		auto_recycle = false,
		energy_required = 50,
		ingredients =
		{
		  {type = "fluid", name = "water", amount = 20},
		},
		results =
		{
		  {type = "fluid", name = "oxygen", amount = 20},
		},
		allow_productivity = false,
		enabled = false,
		always_show_made_in = true,
		show_amount_in_title = false,
		always_show_products = true,
		allow_decomposition = false,
		crafting_machine_tint =
		{
		  primary = {r = 0.596, g = 0.764, b = 0.780, a = 1.000},
		  secondary = {r = 0.551, g = 0.762, b = 0.844, a = 1.000},
		}
	},
	
	{
		type = "recipe",
		name = "olefins-synthesis",
		icon = "__outer_moons__/graphics/icons/olefins-synthesis.png",
		category = "chemistry-or-cryogenics",
		subgroup = "selene-processes",
		order = "b[selene]-f[olefins]",
		auto_recycle = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "carbon", amount = 10},
		  {type = "fluid", name = "water", amount = 30},
		},
		results =
		{
		  {type = "fluid", name = "olefins", amount = 5},
		  {type = "fluid", name = "oxygen", amount = 30},
		},
		allow_productivity = true,
		enabled = false,
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
		name = "polyethlyene",
		icon = "__outer_moons__/graphics/icons/polyethylene.png",
		category = "chemistry-or-cryogenics",
		subgroup = "selene-processes",
		order = "b[selene]-g[polyethlyene]",
		auto_recycle = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "carbon", amount = 4},
		  {type = "fluid", name = "olefins", amount = 10},
		},
		results =
		{
		  {type = "item", name = "plastic-bar", amount = 2},
		},
		allow_productivity = true,
		enabled = false,
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
		enabled = false,
		category = "chemistry-or-cryogenics",
		subgroup = "selene-processes",
		order = "b[selene]-h[solid-fuel-from-aluminum]",
		ingredients =
		{
		  {type = "item", name = "aluminum-plate", amount = 5}
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
		enabled = false,
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
	--structures
	{
		type = "recipe",
		name = "convector",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "electronic-circuit", amount = 5},
		  {type = "item", name = "iron-gear-wheel", amount = 5},
		  {type = "item", name = "copper-cable", amount = 10},
		  {type = "item", name = "steel-plate", amount = 20}
		 -- {type = "item", name = "concrete", amount = 5}
		},
		results = {{type="item", name="convector", amount=1}}
	},
	{
		type = "recipe",
		name = "adv-assembling-machine",
		icon = "__outer_moons__/graphics/icons/adv-assembler.png",
		enabled = false,
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 0,
			max = 100
		  }
		},
		ingredients =
		{
		  {type = "item", name = "assembling-machine-3", amount = 2},
		  {type = "item", name = "productivity-module-2", amount = 2},
		  {type = "item", name = "aluminum-plate", amount = 20},
		  {type = "item", name = "titanium-plate", amount = 10}
		},
		results = {{type="item", name="adv-assembling-machine", amount=1}}
	},
	{
		type = "recipe",
		name = "arc-furnace",
		icon = "__outer_moons__/graphics/icons/arc-furnace.png",
		enabled = false,
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 0,
			max = 100
		  }
		},
		ingredients =
		{
		  --{type = "item", name = "titanium-plate", amount = 30},
		  {type = "item", name = "aluminum-plate", amount = 30},
		  {type = "item", name = "advanced-circuit", amount = 5},
		  {type = "item", name = "refined-concrete", amount = 20},
		},
		results = {{type="item", name="arc-furnace", amount=1}}
	},
	-- Science
	{
		type = "recipe",
		name = "lunar-science-pack",
		category = "advanced-assembly",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 100,
			max = 100
		  }
		},
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "aluminum-plate", amount = 3},
		  {type = "item", name = "titanium-plate", amount = 2},
		  {type = "item", name = "solar-panel", amount = 1},
		  {type = "fluid", name = "oxygen", amount = 50},
		},
		energy_required = 10,
		results = {{type="item", name="lunar-science-pack", amount=1}},
		allow_productivity = true
	},
	-- Vulcanus
	--Gleba
	{
      type = "recipe",
      name = "funnelwood-processing",
      category = "organic-or-hand-crafting",
      icon = "__outer_moons__/graphics/icons/funnelwood-processing.png",
      enabled = false,
      energy_required = 5,
      ingredients =
      {
        {type = "item", name = "funnelwood", amount = 2},
      },
      results =
      {
		{type = "item", name = "funneltrunk-seed", amount = 1, probability = 0.02},
        {type = "item", name = "funnelbranch", amount = 3},
      },
      subgroup = "agriculture-processes",
      order = "b[agriculture]-d[funnelwood-processing]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.65, g = 0.66, b = 0.42, a = 1.000},
        secondary = {r = 0.75, g = 0.76, b = 0.52, a = 1.000}
      }
    },	
	{
      type = "recipe",
      name = "slipstack-polyp-processing",
      category = "organic-or-hand-crafting",
      icon = "__outer_moons__/graphics/icons/slipstack-polyp-processing.png",
      enabled = false,
      energy_required = 5,
      ingredients =
      {
        {type = "item", name = "slipstack-polyp", amount = 5},
       -- {type = "fluid", name = "water", amount = 15, fluidbox_multiplier = 10},
      },
      results =
      {
		{type = "item", name = "slipstack-seed", amount = 1, probability = 0.02},
        --{type = "item", name = "calcite", amount = 3},
        {type = "fluid", name = "slipgoo", amount = 10},
      },
      subgroup = "agriculture-processes",
      order = "b[agriculture]-a[slipstack-polyp-processing]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.65, g = 0.66, b = 0.42, a = 1.000},
        secondary = {r = 0.75, g = 0.76, b = 0.52, a = 1.000}
      }
    },	
	{
		type = "recipe",
		name = "yumako-processing",
		icon = "__space-age__/graphics/icons/yumako-processing.png",
		category = "organic-or-hand-crafting",
		subgroup = "agriculture-processes",
		order = "b[agriculture]-f[yumako-processing]",
		enabled = false,
		allow_productivity = true,
		energy_required = 1,
		ingredients = {{type = "item", name = "yumako", amount = 1}},
		results =
		{
		  {type = "item", name = "yumako-seed", amount = 1, probability = 0.02},
		  {type = "item", name = "yumako-mash", amount = 2}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.976, g = 0.006, b = 0.310, a = 1.000},
		  secondary = {r = 0.805, g = 0.701, b = 0.293, a = 1.000}
		}
	},
    {
      type = "recipe",
      name = "mawpouch-processing",
      category = "organic-or-hand-crafting",
      icon = "__outer_moons__/graphics/icons/mawpouch-processing.png",
      enabled = false,
      energy_required = 6,
      ingredients =
      {
        {type = "item", name = "mawpouch", amount = 5},
        --{type = "fluid", name = "water", amount = 20, fluidbox_multiplier = 10},
      },
      results =
      {
		{type = "item", name = "lickmaw-seed", amount = 1, probability = 0.02},
       -- {type = "item", name = "calcite", amount = 3},
        {type = "fluid", name = "mawslush", amount = 15},
      },
      subgroup = "agriculture-processes",
      order = "b[agriculture]-e[mawpouch-processing]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.65, g = 0.16, b = 0.15, a = 1.000},
        secondary = {r = 0.75, g = 0.26, b = 0.25, a = 1.000}
      }
    },
    {
      type = "recipe",
      name = "frondstalk-processing",
      category = "organic-or-hand-crafting",
      icon = "__outer_moons__/graphics/icons/frondstalk-processing.png",
      enabled = false,
      energy_required = 5,
      ingredients =
      {
        {type = "item", name = "frondstalk", amount = 3},
      },
      results =
      {
		{type = "item", name = "stingfrond-seed", amount = 1, probability = 0.02},
        {type = "item", name = "frondstrand", amount = 5},
      },
      subgroup = "agriculture-processes",
      order = "b[agriculture]-h[frondstalk-processing]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.65, g = 0.66, b = 0.42, a = 1.000},
        secondary = {r = 0.75, g = 0.76, b = 0.52, a = 1.000}
      }
    },
    {
      type = "recipe",
      name = "jellynut-processing",
      category = "organic-or-hand-crafting",
      icon = "__outer_moons__/graphics/icons/cuttlepod-processing.png",
      enabled = false,
      energy_required = 5,
      ingredients =
      {
        {type = "item", name = "cuttlepod", amount = 2},
      },
      results =
      {
		{type = "item", name = "cuttlepop-seed", amount = 1, probability = 0.02},
        {type = "item", name = "jelly", amount = 3},
      },
      subgroup = "agriculture-processes",
      order = "b[agriculture]-c[jellynut-processing]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.405, g = 0.701, b = 0.693, a = 1.000},
		secondary = {r = 0.876, g = 0.406, b = 0.710, a = 1.000}
      }
    },
    {
      type = "recipe",
      name = "boompuff-bulb-processing",
      category = "organic-or-hand-crafting",
      icon = "__outer_moons__/graphics/icons/boompuff-bulb-processing.png",
      enabled = false,
      energy_required = 5,
      ingredients =
      {
        {type = "item", name = "boompuff-bulb", amount = 1},
      },
      results =
      {
		{type = "item", name = "boompuff-seed", amount = 1, probability = 0.02},
        {type = "item", name = "boompowder", amount = 5},
      },
      subgroup = "agriculture-processes",
      order = "b[agriculture]-g[boompuff-bulb-processing]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.65, g = 0.66, b = 0.42, a = 1.000},
        secondary = {r = 0.75, g = 0.76, b = 0.52, a = 1.000}
      }
    },
    {
      type = "recipe",
      name = "sunnycomb-processing",
      category = "organic-or-hand-crafting",
      icon = "__outer_moons__/graphics/icons/sunnycomb-processing.png",
      enabled = false,
      energy_required = 5,
      ingredients =
      {
        {type = "item", name = "sunnycomb", amount = 1},
      },
      results =
      {
		{type = "item", name = "sunnycomb-seed", amount = 1, probability = 0.02},
        {type = "item", name = "sunnylattice", amount = 1},
      },
      subgroup = "agriculture-processes",
      order = "b[agriculture]-b[sunnycomb-processing]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.65, g = 0.66, b = 0.42, a = 1.000},
        secondary = {r = 0.75, g = 0.76, b = 0.52, a = 1.000}
      }
    },  
    {
      type = "recipe",
      name = "glycerol-extraction",
      category = "organic",
      icon = "__outer_moons__/graphics/icons/glycerol-synthesis.png",
      enabled = false,
      energy_required = 12,
      ingredients =
      {
        {type = "item", name = "yumako-mash", amount = 10},
        {type = "item", name = "bioflux", amount = 2},
        {type = "fluid", name = "mawslush", amount = 30, fluidbox_multiplier = 10},
      },
      results =
      {
        {type = "fluid", name = "glycerol", amount = 20},
      },
      subgroup = "agriculture-products",
      order = "b[organic-products]-e[glycerol-extraction]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.62, g = 0.11, b = 0.38, a = 1.000},
        secondary = {r = 0.72, g = 0.21, b = 0.48, a = 1.000}
      }
    },	
    {
      type = "recipe",
      name = "bioflux",
      category = "organic-or-chemistry",
      icon = "__space-age__/graphics/icons/bioflux.png",
      enabled = false,
      energy_required = 12,
      ingredients =
	  {
        {type = "item", name = "sunnylattice", amount = 10},
        {type = "item", name = "jelly", amount = 5},
        {type = "fluid", name = "slipgoo", amount = 20, fluidbox_multiplier = 10},
        {type = "fluid", name = "mawslush", amount = 30, fluidbox_multiplier = 10},
	  },
      results =
      {
        {type = "item", name = "bioflux", amount = 4},
      },
      subgroup = "agriculture-products",
      order = "a[organic-products]-h[bioflux]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.3, g = 0.9, b = 0.8, a = 1.000},
        secondary = {r = 0.8, g = 0.5, b = 0.3, a = 1.000}
      }
    },
	{
      type = "recipe",
      name = "potassium-salt",
      category = "organic-or-chemistry",
      icon = "__outer_moons__/graphics/icons/potassium-salt.png",
      enabled = false,
      energy_required = 12,
      ingredients =
      {
        {type = "fluid", name = "mawslush", amount = 8, fluidbox_multiplier = 10},
        {type = "fluid", name = "water", amount = 5, fluidbox_multiplier = 10},
      },
      results =
      {
        {type = "item", name = "potassium-salt", amount = 2},
      },
      subgroup = "agriculture-products",
      order = "a[organic-products]-d[potassium-salt]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.3, g = 0.9, b = 0.8, a = 1.000},
        secondary = {r = 0.8, g = 0.5, b = 0.3, a = 1.000}
      }
    },
	{
      type = "recipe",
      name = "nitrocalcite",
      category = "organic-or-chemistry",
      icon = "__outer_moons__/graphics/icons/nitrocalcite.png",
      enabled = false,
      energy_required = 12,
      ingredients =
      {
        {type = "fluid", name = "slipgoo", amount = 6, fluidbox_multiplier = 10},
        {type = "fluid", name = "water", amount = 10, fluidbox_multiplier = 10},
      },
      results =
      {
        {type = "item", name = "nitrocalcite", amount = 2},
      },
      subgroup = "agriculture-products",
      order = "a[organic-products]-a[nitrocalcite]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.4, g = 0.2, b = 0.4, a = 1.000},
        secondary = {r = 0.8, g = 0.4, b = 0.8, a = 1.000}
      }
    },
	{
		type = "recipe",
		name = "carbon-fiber",
		category = "organic",
		subgroup = "gleba-general",
		order = "h[carbon-fiber]",
		auto_recycle = false,
		energy_required = 5,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "carbon", amount = 10},
		  {type = "item", name = "frondstrand", amount = 5},
		  {type = "item", name = "plastic-bar", amount = 3},
		  {type = "item", name = "bioflux", amount = 1},
		},
		results = {{type="item", name="carbon-fiber", amount=1}},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 0.306, g = 0.643, b = 0.684, a = 1.000},
		  secondary = {r = 0.684, g = 0.684, b = 0.684, a = 1.000},
		},
	},
	{
		type = "recipe",
		name = "burnt-spoilage",
		icon = "__outer_moons__/graphics/icons/frondstrand-splitting.png",
		category = "organic",
		subgroup = "agriculture-products",
		order = "b[organic-products]-h[burnt-spoilage]",
		auto_recycle = false,
		energy_required = 12,
		ingredients =
		{
		  {type = "item", name = "frondstrand", amount = 2}
		},
		results =
		{
		  {type = "item", name = "carbon", amount = 5}
		},
		allow_productivity = true,
		enabled = false,
		crafting_machine_tint =
		{
		  primary = {r = 0.134, g = 0.009, b = 0.009, a = 1.000}, -- #220202ff
		  secondary = {r = 0.377, g = 0.255, b = 0.255, a = 1.000}, -- #604141ff
		}
	},
	{
		type = "recipe",
		name = "ethanol-synthesis",
		icon = "__outer_moons__/graphics/icons/ethanol-synthesis.png",
		category = "organic",
		subgroup = "agriculture-products",
		order = "b[organic-products]-c[ethanol-synthesis]",
		auto_recycle = false,
		enabled = false,
		allow_productivity = true,
		energy_required = 10,
		ingredients =
		{
		  {type = "fluid", name = "water", amount = 20},
		  {type = "item", name =  "nutrients", amount = 10},
		  {type = "item", name =  "jelly", amount = 5},
		},
		results = {{type="fluid", name="ethanol", amount=25}},
		crafting_machine_tint =
		{
		  primary = {r = 0.47, g = 0.68, b = 0.55, a = 1.000}, 
		  secondary = {r = 0.42, g = 0.63, b = 0.5, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "rocket-fuel-from-jelly",
		icon = "__outer_moons__/graphics/icons/biofuel.png",
		category = "organic",
		subgroup = "gleba-general",
		order = "e[biofuel]",
		auto_recycle = false,
		enabled = false,
		allow_productivity = true,
		energy_required = 10,
		ingredients =
		{
		  {type = "fluid", name = "ethanol", amount = 30},
		  {type = "item", name =  "boompowder", amount = 30},
		  {type = "item", name = "bioflux", amount = 2}
		},
		results = {{type="item", name="rocket-fuel", amount=1}},
		crafting_machine_tint =
		{
		  primary = {r = 0.728, g = 0.116, b = 0.116, a = 1.000}, -- #b91d1dff
		  secondary = {r = 0.3, g = 0.9, b = 0.3, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "biolubricant",
		icon = "__outer_moons__/graphics/icons/fluid/biolubricant.png",
		category = "organic",
		subgroup = "agriculture-products",
		order = "b[organic-products]-a[biolubricant]",
		auto_recycle = false,
		energy_required = 3,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "slipgoo", amount = 20, fluidbox_multiplier = 10},
		  {type = "fluid", name = "water", amount = 5, fluidbox_multiplier = 10},
		  {type = "item", name = "bioflux", amount = 1}
		},
		results =
		{
		  {type = "fluid", name="lubricant", amount = 10}
		},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 0, g = 1, b = 0, a = 1.000},
		  secondary = {r = 0.3, g = 1, b = 0.3, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "bioplastic",
		icon = "__outer_moons__/graphics/icons/bioplastic.png",
		category = "organic",
		subgroup = "agriculture-products",
		order = "b[organic-products]-b[bioplastic]",
		auto_recycle = false,
		enabled = false,
		allow_productivity = true,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "sunnylattice", amount = 4},
		  {type = "item", name = "jelly", amount = 3}
		},
		results = {{type="item", name="plastic-bar", amount=2}},
		crafting_machine_tint =
		{
		  primary = {r = 0.722, g = 0.621, b = 0.655, a = 1.000},
		  secondary = {r = 0.693, g = 0.449, b = 0.449, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "biosulfur",
		icon = "__outer_moons__/graphics/icons/biosulfur.png",
		category = "organic",
		subgroup = "gleba-general",
		order = "g[biosulfur]",
		auto_recycle = false,
		enabled = false,
		allow_productivity = true,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "boompowder", amount = 5},
		  {type = "item", name = "bioflux", amount = 1},
		  {type = "fluid", name = "water", amount = 10},
		},
		results = {{type="fluid", name="sulfuric-acid", amount=2}},
		crafting_machine_tint =
		{
		  primary = {r = 1, g = 1, b = 0, a = 1.000},
		  secondary = {r = 0.693, g = 0.449, b = 0.0, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "biogrenades",
		icon = "__outer_moons__/graphics/icons/biogrenades.png",
		category = "organic",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		auto_recycle = false,
		energy_required = 8,
		subgroup = "agriculture-products",
		order = "b[organic-products]-g[biogrenades]",
		ingredients =
		{
		  {type = "item", name = "boompowder", amount = 12},
		  {type = "item", name = "iron-plate", amount = 5},
		},
		results = {{type="item", name="grenade", amount=1}}
	},
	{
		type = "recipe",
		name = "niter-synthesis",
		icon = "__outer_moons__/graphics/icons/niter-synthesis.png",
		category = "organic",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		auto_recycle = false,
		subgroup = "gleba-general",
		order = "g[niter-synthesis]",
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "potassium-salt", amount = 5},
		  {type = "item", name = "nitrocalcite", amount = 3}
		},
		results = {{type="item", name="niter", amount=2}}
	},
	{
		type = "recipe",
		name = "nitroglycerin-synthesis",
		icon = "__outer_moons__/graphics/icons/nitroglycerin-synthesis.png",
		category = "organic",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		auto_recycle = false,
		subgroup = "gleba-general",
		order = "h[nitroglycerin-synthesis]",
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "niter", amount = 6},
		  {type = "fluid", name = "sulfuric-acid", amount = 5},
		  {type = "fluid", name = "glycerol", amount = 9}
		},
		results = {{type="fluid", name="nitroglycerin", amount=30}}
	},
	{
		type = "recipe",
		name = "bioexplosives",
		icon = "__outer_moons__/graphics/icons/bioexplosives.png",
		category = "organic",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.968, g = 0.381, b = 0.259, a = 1.000}, -- #f66142ff
		  secondary = {r = 0.892, g = 0.664, b = 0.534, a = 1.000}, -- #e3a988ff
		  tertiary = {r = 1.000, g = 0.978, b = 0.513, a = 1.000}, -- #fff982ff
		  quaternary = {r = 0.210, g = 0.170, b = 0.013, a = 1.000}, -- #352b03ff
		},
		enabled = false,
		allow_productivity = true,
		auto_recycle = false,
		energy_required = 4,
		subgroup = "gleba-general",
		order = "i[bioexplosives]",
		ingredients =
		{
		  {type = "fluid", name = "ethanol", amount = 12},
		  {type = "fluid", name = "nitroglycerin", amount = 20}
		},
		results = {{type="item", name="explosives", amount=2}}
	},
	{
		type = "recipe",
		name = "iron-bacteria",
		icon = "__outer_moons__/graphics/icons/funnelbranch-iron.png",
		category = "organic-or-hand-crafting",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		subgroup = "agriculture-products",
		order = "b[organic-products]-d[iron-bacteria]",
		enabled = false,
		allow_productivity = true,
		energy_required = 1,
		ingredients =
		{
		  {type = "item", name = "funnelbranch", amount = 6},
		},
		results =
		{
		  {type = "item", name = "iron-bacteria", amount = 1, probability = 0.1 },
		  {type = "item", name = "spoilage", amount = 4}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.000, g = 0.500, b = 1.000, a = 1.000}, -- #007fffff
		  secondary = {r = 0.095, g = 0.412, b = 0.822, a = 1.000}, -- #1868d1ff
		}
	},
	{
		type = "recipe",
		name = "silicon-extraction",
		icon = "__outer_moons__/graphics/icons/funnelbranch-silicon.png",
		category = "organic",
		subgroup = "gleba-general",
		order = "d[silicon-extraction]",
		enabled = false,
		allow_productivity = true,
		energy_required = 1,
		ingredients =
		{
		  {type = "item", name = "funnelbranch", amount = 10},
		  {type = "item", name = "bioflux", amount = 1},
		},
		results =
		{
		  {type = "item", name = "silicon-ore", amount = 2}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.59, g = 0.54, b = 0.66, a = 1.000}, -- #007fffff
		  secondary = {r = 0.54, g = 0.49, b = 0.61, a = 1.000}, -- #1868d1ff
		}
	},
	--Soils
	{
		type = "recipe",
		name = "fertilizer",
		icon = "__outer_moons__/graphics/icons/fertilizer.png",
		category = "organic",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		auto_recycle = false,
		subgroup = "agriculture-products",
		order = "b[organic-products]-a[fertilizer]",
		energy_required = 4,
		ingredients =
		{
		  {type = "item", name = "phosphate", amount = 10},
		  {type = "item", name = "nitrocalcite", amount = 6},
		  {type = "item", name = "potassium-salt", amount = 4},
		  {type = "item", name = "nutrients", amount = 3}
		},
		results = {{type="item", name="fertilizer", amount=10}}
	},
	{
		type = "recipe",
		name = "stone-synthesis",
		icon = "__outer_moons__/graphics/icons/stone-synthesis.png",
		category = "convecting",
		subgroup = "gleba-general",
		order = "f[stone-synthesis]",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 5000
		  }
		},
		enabled = false,
		allow_productivity = true,
		auto_recycle = false,
		energy_required = 8,
		ingredients =
		{
		  {type = "item", name = "calcite", amount = 3}
		},
		results = {{type="item", name="stone", amount=1}}
	},
	{
		type = "recipe",
		name = "artificial-cuticle-soil",
		icon = "__outer_moons__/graphics/icons/artificial-cuticle-soil.png",
		category = "crafting",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "slipstack-seed", amount = 1},
		  {type = "item", name = "sunnycomb-seed", amount = 1},
		  {type = "item", name = "nutrients", amount = 50},
		  {type = "item", name = "landfill", amount = 5}
		},
		results = {{type="item", name="artificial-cuticle-soil", amount=10}}
	},
	{
		type = "recipe",
		name = "overgrowth-cuticle-soil",
		icon = "__outer_moons__/graphics/icons/overgrowth-cuticle-soil.png",
		category = "crafting-with-fluid",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "artificial-cuticle-soil", amount = 2},
		  {type = "item", name = "fertilizer", amount = 5},
		  {type = "item", name = "spoilage", amount = 50},
		  {type="fluid", name="water", amount=100}
		},
		results = {{type="item", name="overgrowth-cuticle-soil", amount=1}}
	},
	{
		type = "recipe",
		name = "artificial-yumako-soil",
		icon = "__outer_moons__/graphics/icons/artificial-virid-soil.png",
		category = "crafting",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "cuttlepop-seed", amount = 1},
		  {type = "item", name = "funneltrunk-seed", amount = 1},
		  {type = "item", name = "nutrients", amount = 50},
		  {type = "item", name = "landfill", amount = 5}
		},
		results = {{type="item", name="artificial-yumako-soil", amount=10}}
	},
	{
		type = "recipe",
		name = "overgrowth-yumako-soil",
		icon = "__outer_moons__/graphics/icons/overgrowth-virid-soil.png",
		category = "crafting-with-fluid",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "artificial-yumako-soil", amount = 2},
		  {type = "item", name = "fertilizer", amount = 5},
		  {type = "item", name = "spoilage", amount = 50},
		  {type="fluid", name="water", amount=100}
		},
		results = {{type="item", name="overgrowth-yumako-soil", amount=1}}
	},
	{
		type = "recipe",
		name = "artificial-jellynut-soil",
		icon = "__outer_moons__/graphics/icons/artificial-sanguine-soil.png",
		category = "crafting",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "lickmaw-seed", amount = 1},
		  {type = "item", name = "yumako-seed", amount = 1},
		  {type = "item", name = "nutrients", amount = 50},
		  {type = "item", name = "landfill", amount = 5}
		},
		results = {{type="item", name="artificial-jellynut-soil", amount=10}}
	},
	{
		type = "recipe",
		name = "overgrowth-jellynut-soil",
		icon = "__outer_moons__/graphics/icons/overgrowth-sanguine-soil.png",
		category = "crafting-with-fluid",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "artificial-jellynut-soil", amount = 2},
		  {type = "item", name = "fertilizer", amount = 5},
		  {type = "item", name = "spoilage", amount = 50},
		  {type="fluid", name="water", amount=100}
		},
		results = {{type="item", name="overgrowth-jellynut-soil", amount=1}}
	},
	{
		type = "recipe",
		name = "artificial-ochre-soil",
		icon = "__outer_moons__/graphics/icons/artificial-ochre-soil.png",
		category = "crafting",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "boompuff-seed", amount = 2},
		  {type = "item", name = "nutrients", amount = 50},
		  {type = "item", name = "landfill", amount = 5}
		},
		results = {{type="item", name="artificial-ochre-soil", amount=10}}
	},
	{
		type = "recipe",
		name = "overgrowth-ochre-soil",
		icon = "__outer_moons__/graphics/icons/overgrowth-ochre-soil.png",
		category = "crafting-with-fluid",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "artificial-ochre-soil", amount = 2},
		  {type = "item", name = "fertilizer", amount = 5},
		  {type = "item", name = "spoilage", amount = 50},
		  {type="fluid", name="water", amount=100}
		},
		results = {{type="item", name="overgrowth-ochre-soil", amount=1}}
	},
	{
		type = "recipe",
		name = "artificial-cerulean-soil",
		icon = "__outer_moons__/graphics/icons/artificial-cerulean-soil.png",
		category = "crafting",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "stingfrond-seed", amount = 2},
		  {type = "item", name = "nutrients", amount = 50},
		  {type = "item", name = "landfill", amount = 5}
		},
		results = {{type="item", name="artificial-cerulean-soil", amount=10}}
	},
	{
		type = "recipe",
		name = "overgrowth-cerulean-soil",
		icon = "__outer_moons__/graphics/icons/overgrowth-cerulean-soil.png",
		category = "crafting-with-fluid",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2500,
			max = 2500
		  }
		},
		enabled = false,
		allow_productivity = true,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "artificial-jellynut-soil", amount = 2},
		  {type = "item", name = "fertilizer", amount = 5},
		  {type = "item", name = "spoilage", amount = 50},
		  {type="fluid", name="water", amount=100}
		},
		results = {{type="item", name="overgrowth-cerulean-soil", amount=1}}
	},
	
	--Fulgora
	{
      type = "recipe",
      name = "sludge-separation",
      category = "organic-or-chemistry",
      icon = "__outer_moons__/graphics/icons/fluid/fulgoran-sludge.png",
      --icon = "__outer_moons__/graphics/icons/sludge-separation.png",
      enabled = false,
      energy_required = 5,
      ingredients =
      {
        {type = "fluid", name = "sludge", amount = 500, fluidbox_multiplier = 10}
      },
      results =
      {
        {type = "fluid", name = "heavy-oil", amount = 45},
        {type = "fluid", name = "water", amount = 5},
        {type = "item", name = "microplastic", amount = 10},
        {type = "item", name = "sulfur", amount = 1}
      },
      subgroup = "fulgora-processes",
      order = "a[chemistry-fulgora]-a[fulgoran-sludge-separation]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.5, g = 0.4, b = 0.25, a = 1.000},
        secondary = {r = 0, g = 0, b = 0, a = 1.000},
        tertiary = {r = 0.75, g = 0.5, b = 0.5},
        quaternary = {r = 0.24, g = 0.16, b = 0.16}
      }
    },
	{
      type = "recipe",
      name = "amalgamate-microplastic",
      category = "convecting",
      icon = "__outer_moons__/graphics/icons/amalgamate-microplastic.png",
      enabled = false,
      energy_required = 5,
      ingredients =
      {
        {type = "item", name = "microplastic", amount = 5}
      },
      results =
      {
        {type = "item", name = "plastic-bar", amount = 1}
      },
      subgroup = "fulgora-processes",
      order = "a[chemistry-fulgora]-c[amalgamate-microplastic]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.69, g = 0.55, b = 0.42, a = 1.000}, -- #fefeffff
		secondary = {r = 0.86, g = 0.85, b = 0.30, a = 1.000}, -- #c4c4c4ff
		tertiary = {r = 0.768, g = 0.665, b = 0.762, a = 1.000}, -- #c3a9c2ff
		quaternary = {r = 0.000, g = 0.000, b = 0.000, a = 1.000}, -- #000000ff
      }
    },
	--overwrite
	
	{
		type = "recipe",
		name = "stack-inserter",
		category = "advanced-assembly",
		enabled = false,
		energy_required = 0.5,
		ingredients =
		{
		  {type = "item", name = "bulk-inserter", amount = 1},
		  {type = "item", name = "processing-unit", amount = 1},
		  {type = "item", name = "aluminum-plate", amount = 4},
		  {type = "item", name = "titanium-plate", amount = 8}
		},
		results = {{type="item", name="stack-inserter", amount=1}}
	},
	{
		type = "recipe",
		name = "productivity-module-3",
		category = "electronics",
		enabled = false,
		energy_required = 60,
		ingredients =
		{
		  {type = "item", name = "productivity-module-2", amount = 4},
		  {type = "item", name = "advanced-circuit", amount = 5},
		  {type = "item", name = "processing-unit", amount = 5},
		  {type = "item", name = "uranium-fuel-cell", amount = 1}
		},
		results = {{type="item", name="productivity-module-3", amount=1}}
	},
	{
		type = "recipe",
		name = "scrap-recycling",
		icons = {
		  {
			icon = "__quality__/graphics/icons/recycling.png"
		  },
		  {
			icon = "__space-age__/graphics/icons/scrap.png",
			scale = 0.4
		  },
		  {
			icon = "__quality__/graphics/icons/recycling-top.png"
		  }
		},
		category = "recycling-or-hand-crafting",
		subgroup = "fulgora-processes",
		order = "a[trash]-a[trash-recycling]",
		enabled = false,
		auto_recycle = false,
		energy_required = 0.2,
		ingredients = {{type = "item", name = "scrap", amount = 1}},
		results =
		{
		  {type = "item", name = "iron-gear-wheel",        amount = 1, probability = 0.20, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "concrete",               amount = 1, probability = 0.06, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "stone",                  amount = 1, probability = 0.04, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "steel-plate",            amount = 1, probability = 0.04, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "battery",                amount = 1, probability = 0.04, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "copper-cable",           amount = 1, probability = 0.03, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "advanced-circuit",       amount = 1, probability = 0.03, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "processing-unit",        amount = 1, probability = 0.02, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "solid-fuel",             amount = 1, probability = 0.02, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "low-density-structure",  amount = 1, probability = 0.01, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "holmium-ore",            amount = 1, probability = 0.01, show_details_in_recipe_tooltip = false},
		}
	},
})
