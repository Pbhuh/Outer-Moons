data:extend({
	{
		type = "recipe",
		name = "naphtha-distillation",
		icon = "__outer_moons__/graphics/icons/naphtha-distillation.png",
		category = "chemistry",
		order = "b[fluid-chemistry]-g[naphtha-distillation]",
		energy_required = 1,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "light-oil", amount = 30 },
		  {type = "fluid", name = "water", amount = 10},
		},
		results =
		{
		  {type = "fluid", name = "naphtha", amount = 2 },
		  {type = "item", name = "sulfur", amount = 1 }
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
		icon = "__outer_moons__/graphics/icons/water-electrolysis.png",
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
		name = "ethylene-synthesis",
		icon = "__outer_moons__/graphics/icons/ethylene-synthesis.png",
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
		  {type = "fluid", name = "ethylene", amount = 10},
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
			{type="item", name="copper-ore", amount=1, probability=0.1, show_details_in_recipe_tooltip = false},
			{type="item", name="sulfur", amount=1, probability=0.05, show_details_in_recipe_tooltip = false},
			{type="item", name="carbon", amount=1, probability=0.2, show_details_in_recipe_tooltip = false},
			--{type="item", name="aluminum-ore", amount=1, probability=0.03},
			--{type="item", name="titanium-ore", amount=1, probability=0.02},
			{type="item", name="uranium-ore", amount=1, probability=0.01, show_details_in_recipe_tooltip = false}
		},
		allow_productivity = true,
		enabled = false
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
      subgroup = "fluid-recipes",
      order = "b[fluid-chemistry]-a[fulgoran-sludge-separation]",
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
      icon = "__outer_moons__/graphics/icons/microplastic.png",
      --icon = "__outer_moons__/graphics/icons/amalgamate-microplastic.png",
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
      subgroup = "fluid-recipes",
      order = "b[fluid-chemistry]-a[amalgamate-microplastic]",
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
		name = "plastic-bar",
		category = "chemistry",
		energy_required = 1,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "petroleum-gas", amount = 15 },
		  {type = "fluid", name = "naphtha", amount = 20 },
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
		category = "chemistry",
		enabled = false,
		energy_required = 24,
		ingredients =
		{
		  {type = "item", name = "engine-unit", amount = 2},
		  {type = "item", name = "advanced-circuit", amount = 3},
		  {type = "item", name = "sulfur", amount = 1}
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
		  {type = "item", name = "processing-unit",        amount = 1, probability = 0.02, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "advanced-circuit",       amount = 1, probability = 0.03, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "low-density-structure",  amount = 1, probability = 0.01, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "solid-fuel",             amount = 1, probability = 0.02, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "steel-plate",            amount = 1, probability = 0.04, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "concrete",               amount = 1, probability = 0.06, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "battery",                amount = 1, probability = 0.04, show_details_in_recipe_tooltip = false},
		  --{type = "item", name = "ice",                    amount = 1, probability = 0.05, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "stone",                  amount = 1, probability = 0.04, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "holmium-ore",            amount = 1, probability = 0.01, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "iron-gear-wheel",        amount = 1, probability = 0.20, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "copper-cable",           amount = 1, probability = 0.03, show_details_in_recipe_tooltip = false}
		}
	},
})
