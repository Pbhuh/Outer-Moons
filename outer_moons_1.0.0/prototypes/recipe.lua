data:extend({
	--- Logistics
	-- Pipes
	{
		type = "recipe",
		name = "pipe",
		ingredients = {
			{type = "item", name = "lead-plate", amount = 2},
			{type = "item", name = "iron-plate", amount = 1},
		},
		results = {{type="item", name="pipe", amount=2}},
		enabled = false
	},
	{
		type = "recipe",
		name = "pipe-to-ground",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "pipe", amount = 10},
		  {type = "item", name = "lead-plate", amount = 4},
		  {type = "item", name = "iron-plate", amount = 1}
		},
		results = {{type="item", name="pipe-to-ground", amount=2}}
	},
	{
		type = "recipe",
		name = "pump",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "engine-unit", amount = 1},
		  {type = "item", name = "nickel-plate", amount = 2},
		  {type = "item", name = "pipe", amount = 1},
		  {type = "item", name = "spark-plug", amount = 1},
		},
		results = {{type="item", name="pump", amount=1}}
	},
	{
		type = "recipe",
		name = "gas-vent",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "engine-unit", amount = 1},
		  {type = "item", name = "nickel-plate", amount = 1},
		  {type = "item", name = "pipe", amount = 1},
		  {type = "item", name = "iron-gear-wheel", amount = 2}
		},
		results = {{type="item", name="gas-vent", amount=1}}
	},
	{
		type = "recipe",
		name = "flare-stack",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "spark-plug", amount = 1},
		  {type = "item", name = "pump", amount = 1},
		  {type = "item", name = "pipe", amount = 4}
		},
		results = {{type="item", name="flare-stack", amount=1}}
	},
	-- Power
	{
		type = "recipe",
		name = "medium-electric-pole",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "iron-stick", amount = 4},
		  {type = "item", name = "steel-plate", amount = 2},
		  {type = "item", name = "aluminum-cable", amount = 2}
		},
		results = {{type="item", name="medium-electric-pole", amount=1}}
	},
	{
		type = "recipe",
		name = "big-electric-pole",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "iron-stick", amount = 8},
		  {type = "item", name = "steel-plate", amount = 5},
		  {type = "item", name = "aluminum-cable", amount = 4}
		},
		results = {{type="item", name="big-electric-pole", amount=1}}
	},
	{
		type = "recipe",
		name = "substation",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 10},
		  {type = "item", name = "advanced-circuit", amount = 5},
		  {type = "item", name = "fiber-optic", amount = 3},
		  {type = "item", name = "aluminum-cable", amount = 6}
		},
		results = {{type="item", name="substation", amount=1}}
	},
	-- Bots
	{
		type = "recipe",
		name = "logistic-robot",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "flying-robot-frame", amount = 1},
		  {type = "item", name = "processing-unit", amount = 2},
		  {type = "item", name = "duralumin-plate", amount = 1}
		},
		results = {{type="item", name="logistic-robot", amount=1}}
	},
	{
		type = "recipe",
		name = "construction-robot",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "flying-robot-frame", amount = 1},
		  {type = "item", name = "advanced-circuit", amount = 2},
		  {type = "item", name = "duralumin-plate", amount = 1},
		},
		results = {{type="item", name="construction-robot", amount=1}}
	},
	{
		type = "recipe",
		name = "passive-provider-chest",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "steel-chest", amount = 1},
		  {type = "item", name = "electronic-circuit", amount = 3},
		  {type = "item", name = "integrated-circuit", amount = 1}
		},
		results = {{type="item", name="passive-provider-chest", amount=1}}
	},
	{
		type = "recipe",
		name = "active-provider-chest",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "steel-chest", amount = 1},
		  {type = "item", name = "integrated-circuit", amount = 3},
		  {type = "item", name = "advanced-circuit", amount = 1}
		},
		results = {{type="item", name="active-provider-chest", amount=1}}
	},
	{
		type = "recipe",
		name = "storage-chest",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "steel-chest", amount = 1},
		  {type = "item", name = "electronic-circuit", amount = 3},
		  {type = "item", name = "integrated-circuit", amount = 1}
		},
		results = {{type="item", name="storage-chest", amount=1}}
	},
	{
		type = "recipe",
		name = "buffer-chest",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "steel-chest", amount = 1},
		  {type = "item", name = "integrated-circuit", amount = 3},
		  {type = "item", name = "advanced-circuit", amount = 1}
		},
		results = {{type="item", name="buffer-chest", amount=1}}
	},
	{
		type = "recipe",
		name = "requester-chest",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "steel-chest", amount = 1},
		  {type = "item", name = "integrated-circuit", amount = 3},
		  {type = "item", name = "advanced-circuit", amount = 1}
		},
		results = {{type="item", name="requester-chest", amount=1}}
	},
	{
		type = "recipe",
		name = "roboport",
		enabled = false,
		energy_required = 5,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 45},
		  {type = "item", name = "iron-gear-wheel", amount = 45},
		  {type = "item", name = "processing-unit", amount = 25}
		},
		results = {{type="item", name="roboport", amount=1}}
	},
	{
		type = "recipe",
		name = "offshore-pump",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "pipe", amount = 3},
		  {type = "item", name = "iron-gear-wheel", amount = 2},
		  {type = "item", name = "electronic-circuit", amount = 1},
		},
		results = {{type="item", name="offshore-pump", amount=1}}
	},
	{
		type = "recipe",
		name = "pumpjack",
		energy_required = 5,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 5},
		  {type = "item", name = "iron-gear-wheel", amount = 10},
		  {type = "item", name = "electronic-circuit", amount = 5},
		  {type = "item", name = "pipe", amount = 10}
		},
		results = {{type="item", name="pumpjack", amount=1}},
		enabled = false
	},
	--Concrete
	{
		type = "recipe",
		name = "concrete",
		energy_required = 10,
		enabled = false,
		category = "crafting-with-fluid",
		ingredients =
		{
		  {type = "item", name = "stone-brick", amount = 5},
		  {type = "item", name = "silicon-ore", amount = 1},
		  {type = "fluid", name = "water", amount = 100}
		},
		results = {{type="item", name="concrete", amount=10}}
	},
	---Chemistry
	--Basic
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
	--Advanced
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
		order = "a[oil-processing]-b[advanced-oil-processing]"
	},	
	{
		type = "recipe",
		name = "petroleum-gas-processing",
		icon = "__outer_moons__/graphics/icons/fluid/petroleum-gas-processing.png",
		category = "chemistry-or-cryogenics",
		subgroup = "fluid-recipes",
		order = "b[fluid-chemistry]-a[petroleum-gas-processing]",
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
		order = "b[fluid-chemistry]-b[heavy-oil-cracking]",
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
		  {type = "fluid", name = "olefins", amount = 15 },
		},
		allow_productivity = true,
		main_product = "",
		icon = "__outer_moons__/graphics/icons/fluid/light-oil-cracking.png",
		subgroup = "fluid-recipes",
		order = "b[fluid-chemistry]-c[light-oil-cracking]",
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
		name = "olefins-reforming",
		icon = "__outer_moons__/graphics/icons/fluid/olefins-reforming.png",
		category = "chemistry-or-cryogenics",
		subgroup = "fluid-recipes",
		order = "b[fluid-chemistry]-d[olefins-reforming]",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "steam", amount = 50 },
		  {type = "fluid", name = "olefins", amount = 25 },
		  {type = "item", name = "nickel-plate", amount = 1 },
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
	-- Natural Gas	
	{
		type = "recipe",
		name = "natural-gas-cracking",
		category = "oil-processing",
		enabled = false,
		energy_required = 5,
		ingredients =
		{
		  {type = "fluid", name = "natural-gas", amount = 100},
		  {type = "fluid", name = "water", amount = 50},
		  {type = "item", name = "silicon-ore", amount = 1},
		},
		results =
		{
		  {type = "fluid", name = "carbon-dioxide", amount = 30},
		  {type = "fluid", name = "methane", amount = 60},
		  {type = "fluid", name = "nitrogen", amount = 25}
		},
		allow_productivity = true,
		icon = "__outer_moons__/graphics/icons/fluid/natural-gas-cracking.png",
		subgroup = "hydrocarbon-recipes",
		order = "a[oil-processing]-a[natural-gas-cracking]"
	},		
	-- Wood 
	{
		type = "recipe",
		name = "wood-gasification",
		category = "oil-processing",
		enabled = false,
		energy_required = 5,
		ingredients =
		{
		  {type = "fluid", name = "steam", amount = 50},
		  {type = "item", name = "wood", amount = 15},
		  {type = "item", name = "nickel-plate", amount = 1},
		},
		results =
		{
		  {type = "fluid", name = "hydrogen", amount = 30},
		  {type = "fluid", name = "carbon-monoxide", amount = 50},
		  {type = "fluid", name = "nitrogen", amount = 35}
		},
		allow_productivity = true,
		icon = "__outer_moons__/graphics/icons/fluid/wood-gasification.png",
		subgroup = "hydrocarbon-recipes",
		order = "a[oil-processing]-b[wood-gasification]"
	},
	{
		type = "recipe",
		name = "methane-reforming",
		category = "chemistry-or-cryogenics",
		enabled = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "fluid", name = "methane", amount = 35},
		  {type = "fluid", name = "steam", amount = 50},
		  {type = "item", name = "nickel-plate", amount = 1},
		},
		results =
		{
		  {type = "fluid", name = "carbon-monoxide", amount = 30},
		  {type = "fluid", name = "hydrogen", amount = 120}
		},
		allow_productivity = true,
		icon = "__outer_moons__/graphics/icons/fluid/methane-reforming.png",
		
		subgroup = "hydrocarbon-recipes",
		order = "b[hydrocarbons]-a[methane-reforming]",		
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
		name = "methanol",
		category = "chemistry-or-cryogenics",
		enabled = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "fluid", name = "carbon-monoxide", amount = 20},
		  {type = "fluid", name = "hydrogen", amount = 80},
		  {type = "item", name = "copper-plate", amount = 1},
		},
		results =
		{
		  {type = "fluid", name = "methanol", amount = 20},
		},
		allow_productivity = true,
		icon = "__outer_moons__/graphics/icons/fluid/methanol.png",
		
		subgroup = "hydrocarbon-recipes",
		order = "b[hydrocarbons]-b[methanol]",		
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
		name = "methanol-processing",
		category = "oil-processing",
		enabled = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "fluid", name = "methanol", amount = 30},
		  {type = "fluid", name = "steam", amount = 80},
		  {type = "item", name = "alumina", amount = 1},
		  {type = "item", name = "silicon-ore", amount = 1},
		},
		results =
		{
		  {type = "fluid", name = "heavy-oil", amount = 80},
		  {type = "fluid", name = "petroleum-gas", amount = 35},
		  {type = "fluid", name = "light-oil", amount = 20},
		},
		allow_productivity = true,
		icon = "__outer_moons__/graphics/icons/fluid/methanol-processing.png",
		
		subgroup = "hydrocarbon-recipes",
		order = "b[hydrocarbons]-d[methanol-processing]",		
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
		name = "hydrogen-peroxide",
		category = "chemistry-or-cryogenics",
		enabled = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "fluid", name = "hydrogen", amount = 15},
		  {type = "fluid", name = "oxygen", amount = 15},
		  {type = "item", name = "titanium-plate", amount = 1},
		},
		results =
		{
		  {type = "fluid", name = "hydrogen-peroxide", amount = 15},
		},
		allow_productivity = true,
		icon = "__outer_moons__/graphics/icons/fluid/hydrogen-peroxide.png",
		
		subgroup = "hydrocarbon-recipes",
		order = "b[hydrocarbons]-z[hydrogen-peroxide]",		
		crafting_machine_tint =
		{
		  primary = {r = 0.79, g = 0.55, b = 0.42, a = 1.000}, -- #fefeffff
		  secondary = {r = 0.96, g = 0.85, b = 0.30, a = 1.000}, -- #c4c4c4ff
		  tertiary = {r = 0.868, g = 0.665, b = 0.762, a = 1.000}, -- #c3a9c2ff
		  quaternary = {r = 0.500, g = 0.500, b = 0.500, a = 1.000}, -- #000000ff
		}
	},
	{
		type = "recipe",
		name = "formaldehyde",
		category = "chemistry-or-cryogenics",
		enabled = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "fluid", name = "methanol", amount = 20},
		  {type = "item", name = "iron-plate", amount = 1},
		},
		results =
		{
		  {type = "fluid", name = "formaldehyde", amount = 20},
		  --{type = "fluid", name = "hydrogen", amount = 10},
		},
		allow_productivity = true,
		icon = "__outer_moons__/graphics/icons/fluid/formaldehyde.png",
		main_product = "",
		subgroup = "hydrocarbon-recipes",
		order = "b[hydrocarbons]-f[formaldehyde]",		
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
		name = "phenol",
		category = "chemistry-or-cryogenics",
		enabled = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "fluid", name = "aromatics", amount = 30},
		  {type = "fluid", name = "oxygen", amount = 15},
		  {type = "item", name = "iron-plate", amount = 1},
		},
		results =
		{
		  {type = "fluid", name = "phenol", amount = 30},
		},
		allow_productivity = true,
		icon = "__outer_moons__/graphics/icons/fluid/phenol.png",
		subgroup = "hydrocarbon-recipes",
		order = "b[hydrocarbons]-g[phenol]",		
		crafting_machine_tint =
		{
		  primary = {r = 0.69, g = 0.55, b = 0.42, a = 1.000}, -- #fefeffff
		  secondary = {r = 0.86, g = 0.85, b = 0.30, a = 1.000}, -- #c4c4c4ff
		  tertiary = {r = 0.768, g = 0.665, b = 0.762, a = 1.000}, -- #c3a9c2ff
		  quaternary = {r = 0.000, g = 0.000, b = 0.000, a = 1.000}, -- #000000ff
		}
	},
	-- Liquefaction
	{
		type = "recipe",
		name = "coal-liquefaction",
		category = "oil-processing",
		enabled = false,
		energy_required = 5,
		ingredients =
		{
		  {type = "item", name = "coal", amount = 10},
		  {type = "item", name = "iron-plate", amount = 1},
		  {type = "fluid", name = "steam", amount = 50}
		},
		results =
		{
		  {type = "fluid", name = "carbon-monoxide", amount = 90},
		  {type = "fluid", name = "sulfane", amount = 55},
		  {type = "fluid", name = "nitrogen", amount = 20},
		},
		allow_productivity = true,
		icon = "__outer_moons__/graphics/icons/fluid/coal-liquefaction.png",
		subgroup = "hydrocarbon-recipes",
		order = "a[oil-processing]-c[coal-liquefaction]",
		allow_decomposition = false
	},
	
	-- Sulfur chemistry
	{
		type = "recipe",
		name = "sulfur",
		category = "chemistry-or-cryogenics",
        subgroup = "chemical",
		order = "b[sulfur]",
		icon = "__base__/graphics/icons/sulfur.png",
		energy_required = 1,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "sulfane", amount = 20},
		  {type = "item", name = "aluminum-plate", amount = 1}
		},
		results =
		{
		  {type = "fluid", name = "hydrogen", amount = 40},
		  {type = "item", name = "sulfur", amount = 4}
		},
		allow_productivity = true,
		main_product = "sulfur",
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
		name = "sulfur-dioxide",
		category = "chemistry-or-cryogenics",
		subgroup = "sulfur-recipes",
		order = "c[sulfur]-a[sulfur-dioxide]",
		energy_required = 1,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "sulfur", amount = 50},
		  {type = "fluid", name = "oxygen", amount = 50}
		},
		results =
		{
		  {type = "fluid", name = "sulfur-dioxide", amount = 50}
		},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 1.000, g = 0.908, b = 0.000, a = 1.000}, -- #fff400ff
		  secondary = {r = 1.000, g = 0.802, b = 0.122, a = 1.000}, -- #ffd92bff
		  tertiary = {r = 0.816, g = 0.809, b = 0.547, a = 1.000}, -- #dfdd98ff
		  quaternary = {r = 0.969, g = 1.000, b = 0.019, a = 1.000}, -- #f7ff04ff
		}
	},	
	{
		type = "recipe",
		name = "sulfuric-acid",
		category = "chemistry-or-cryogenics",
		subgroup = "sulfur-recipes",
		order = "c[sulfur]-b[sulfuric-acid]",
		energy_required = 1,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "sulfur-dioxide", amount = 50},
		  {type = "fluid", name = "water", amount = 50},
		  {type = "item", name = "iron-plate", amount = 1},
		},
		results =
		{
		  {type = "fluid", name = "sulfuric-acid", amount = 50}
		},
		allow_productivity = true,
		crafting_machine_tint =
		{
		  primary = {r = 1.000, g = 0.958, b = 0.000, a = 1.000}, -- #fff400ff
		  secondary = {r = 1.000, g = 0.852, b = 0.172, a = 1.000}, -- #ffd92bff
		  tertiary = {r = 0.876, g = 0.869, b = 0.597, a = 1.000}, -- #dfdd98ff
		  quaternary = {r = 0.969, g = 1.000, b = 0.019, a = 1.000}, -- #f7ff04ff
		}
	},
	-- Nitrogen chemistry
	{
		type = "recipe",
		name = "ammonia",
		icon = "__outer_moons__/graphics/icons/fluid/ammonia.png",
		category = "chemistry-or-cryogenics",
		subgroup = "nitrogen-recipes",
		order = "d[nitrogen]-a[ammonia]",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "nitrogen", amount = 10 },
		  {type = "fluid", name = "hydrogen", amount = 30 },
		  {type = "item", name = "iron-plate", amount = 1 },
		},
		results =
		{
		  {type = "fluid", name = "ammonia", amount = 10 },
		},
		allow_productivity = true,
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
		name = "nitric-acid",
		icon = "__outer_moons__/graphics/icons/fluid/nitric-acid.png",
		category = "chemistry-or-cryogenics",
		subgroup = "nitrogen-recipes",
		order = "d[nitrogen]-b[nitric-acid]",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "ammonia", amount = 15 },
		  {type = "fluid", name = "oxygen", amount = 30 },
		  {type = "item", name = "iron-plate", amount = 1 },
		},
		results =
		{
		  {type = "fluid", name = "nitric-acid", amount = 15 },
		  --{type = "fluid", name = "water", amount = 15 },
		},
		allow_productivity = true,
		main_product = "nitric-acid",
		crafting_machine_tint =
		{
		  primary = {r = 0.596, g = 0.764, b = 0.780, a = 1.000},
		  secondary = {r = 0.551, g = 0.762, b = 0.844, a = 1.000},
		  tertiary = {r = 0.596, g = 0.773, b = 0.895, a = 1.000},
		  quaternary = {r = 0.290, g = 0.734, b = 1, a = 1.000},
		}
	},
	-- Chlorine chemistry
	{
		type = "recipe",
		name = "hydrochloric-acid",
		icon = "__outer_moons__/graphics/icons/fluid/hydrochloric-acid.png",
		category = "chemistry-or-cryogenics",
		subgroup = "chlorine-recipes",
		order = "e[chlorine]-a[hydrochloric-acid]",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "chlorine", amount = 10 },
		  {type = "fluid", name = "hydrogen", amount = 10 },
		  {type = "item", name = "copper-plate", amount = 1 },
		},
		results =
		{
		  {type = "fluid", name = "hydrochloric-acid", amount = 20 },
		},
		allow_productivity = true,
		main_product = "hydrochloric-acid",
		crafting_machine_tint =
		{
		  primary = {r = 0.378, g = 0.677, b = 0.359, a = 1.000},
		  secondary = {r = 0.378, g = 0.851, b = 0.341, a = 1.000},
		  tertiary = {r = 0.478, g = 0.741, b = 0.571, a = 1.000},
		  quaternary = {r = 0.290, g = 0.734, b = 0.455, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "vinyl-chloride",
		icon = "__outer_moons__/graphics/icons/fluid/vinyl-chloride.png",
		category = "chemistry-or-cryogenics",
		subgroup = "chlorine-recipes",
		order = "e[chlorine]-b[vinyl-chloride]",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "olefins", amount = 20 },
		  {type = "fluid", name = "hydrochloric-acid", amount = 10 },
		  {type = "item", name = "titanium-plate", amount = 1 },
		},
		results =
		{
		  {type = "fluid", name = "vinyl-chloride", amount = 20 },
		},
		allow_productivity = true,
		main_product = "vinyl-chloride",
		crafting_machine_tint =
		{
		  primary = {r = 0.378, g = 0.677, b = 0.359, a = 1.000},
		  secondary = {r = 0.378, g = 0.851, b = 0.341, a = 1.000},
		  tertiary = {r = 0.478, g = 0.741, b = 0.571, a = 1.000},
		  quaternary = {r = 0.290, g = 0.734, b = 0.455, a = 1.000},
		}
	},
	-- Chemical products
	{
		type = "recipe",
		name = "polyethlyene-plastic",
		icon = "__outer_moons__/graphics/icons/fluid/polyethylene-plastic.png",
		category = "chemistry-or-cryogenics",
		subgroup = "plastic-recipes",
		order = "a[polyethlyene-plastic]",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "olefins", amount = 20 },
		  {type = "fluid", name = "hydrogen-peroxide", amount = 10 },
		  {type = "item", name = "aluminum-plate", amount = 1 }
		},
		results =
		{
		  {type = "item", name = "plastic-bar", amount = 1}
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
		name = "polystyrene-plastic",
		icon = "__outer_moons__/graphics/icons/fluid/polystyrene-plastic.png",
		category = "chemistry-or-cryogenics",
		subgroup = "plastic-recipes",
		order = "b[polystyrene-plastic]",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "olefins", amount = 10 },
		  {type = "fluid", name = "aromatics", amount = 20 },
		  {type = "item", name = "iron-plate", amount = 1 }
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
		name = "polyvinyl-chloride-plastic",
		icon = "__outer_moons__/graphics/icons/fluid/polyvinyl-chloride-plastic.png",
		category = "chemistry-or-cryogenics",
		subgroup = "plastic-recipes",
		order = "c[polyvinyl-chloride-plastic]",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "vinyl-chloride", amount = 15 },
		  {type = "fluid", name = "hydrogen-peroxide", amount = 10 },
		  {type = "item", name = "magnesium-plate", amount = 1 }
		},
		results =
		{
		  {type = "item", name = "plastic-bar", amount = 3}
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
		name = "phenolic-plastic",
		icon = "__outer_moons__/graphics/icons/fluid/phenolic-plastic.png",
		category = "chemistry-or-cryogenics",
		subgroup = "plastic-recipes",
		order = "d[phenolic-plastic]",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "phenol", amount = 25 },
		  {type = "fluid", name = "formaldehyde", amount = 25 },
		  {type = "item", name = "iridium-plate", amount = 1 },
		},
		results =
		{
		  {type = "item", name = "plastic-bar", amount = 4}
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
		name = "solid-fuel",
		category = "chemistry-or-cryogenics",
		energy_required = 1,
		ingredients =
		{
		  {type = "fluid", name = "petroleum-gas", amount = 20}
		},
		results =
		{
		  {type = "item", name = "solid-fuel", amount = 1}
		},
		allow_productivity = true,
		icon = "__base__/graphics/icons/solid-fuel-from-petroleum-gas.png",
		subgroup = "raw-material",
		order = "b[chemistry]-a[solid-fuel]",
		enabled = false,
		crafting_machine_tint =
		{
		  primary = {r = 0.768, g = 0.631, b = 0.768, a = 1.000}, -- #c3a0c3ff
		  secondary = {r = 0.659, g = 0.592, b = 0.678, a = 1.000}, -- #a896acff
		  tertiary = {r = 0.774, g = 0.631, b = 0.766, a = 1.000}, -- #c5a0c3ff
		  quaternary = {r = 0.564, g = 0.364, b = 0.564, a = 1.000}, -- #8f5c8fff
		}
	},
	{
		type = "recipe",
		name = "niter",
		category = "chemistry-or-cryogenics",
        subgroup = "chemical",
		order = "g[niter]",
		crafting_machine_tint =
		{
		  primary = {r = 0.968, g = 0.381, b = 0.259, a = 1.000}, -- #f66142ff
		  secondary = {r = 0.892, g = 0.664, b = 0.534, a = 1.000}, -- #e3a988ff
		  tertiary = {r = 1.000, g = 0.978, b = 0.513, a = 1.000}, -- #fff982ff
		  quaternary = {r = 0.210, g = 0.170, b = 0.013, a = 1.000}, -- #352b03ff
		},
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "ammonia", amount = 5},
		  {type = "fluid", name = "nitric-acid", amount = 5},
		  {type = "item", name = "potassium-salt", amount = 2}
		},
		results = {{type="item", name="niter", amount=2}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "battery",
		category = "chemistry-or-cryogenics",
		energy_required = 4,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "sulfuric-acid", amount = 20},
		  {type = "item", name = "lead-plate", amount = 2},
		},
		results = {{type="item", name="battery", amount=1}},
		crafting_machine_tint =
		{
		  primary = {r = 0.965, g = 0.482, b = 0.338, a = 1.000}, -- #f67a56ff
		  secondary = {r = 0.831, g = 0.560, b = 0.222, a = 1.000}, -- #d38e38ff
		  tertiary = {r = 0.728, g = 0.818, b = 0.443, a = 1.000}, -- #b9d070ff
		  quaternary = {r = 0.939, g = 0.763, b = 0.191, a = 1.000}, -- #efc230ff
		},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "explosives",
		category = "chemistry-or-cryogenics",
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
	-- Smelting
	{
		type = "recipe",
		name = "lead-plate",
		category = "smelting",
		auto_recycle = false,
		energy_required = 3.2,
		ingredients = {
			{type = "item", name = "lead-ore", amount = 1},
		},
		results = {{type="item", name="lead-plate", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "nickel-plate",
		category = "smelting",
		auto_recycle = false,
		energy_required = 3.2,
		ingredients = {
			{type = "item", name = "nickel-ore", amount = 1},
		},
		results = {{type="item", name="nickel-plate", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "silicon-wafer",
		icon = "__outer_moons__/graphics/icons/silicon-wafer.png",
		category = "electrolysis",
		auto_recycle = false,
		enabled = false,
		energy_required = 5,
		ingredients = {
			{type = "item", name = "silicon-ore", amount = 4},
			{type = "item", name = "carbon", amount = 4},
			{type = "fluid", name = "hydrochloric-acid", amount = 5},
		},
		results = {
			{type="item", name="silicon-wafer", amount=1},
			{type="fluid", name="carbon-monoxide", amount=4},
		},
		allow_productivity = true,
		main_product = "silicon-wafer"
	},
	{
		type = "recipe",
		name = "aluminum-plate",
		icon = "__outer_moons__/graphics/icons/aluminum-plate.png",
		category = "electrolysis",
		auto_recycle = false,
		enabled = false,
		energy_required = 5,
		ingredients = {
			{type = "item", name = "alumina", amount = 4},
			{type = "item", name = "carbon", amount = 4},
		},
		results = {
			{type="item", name="aluminum-plate", amount=2},
			{type="fluid", name="carbon-monoxide", amount=4},
		},
		allow_productivity = true,
		main_product = "aluminum-plate"
	},
	{
		type = "recipe",
		name = "titanium-plate",
		icon = "__outer_moons__/graphics/icons/titanium-plate.png",
		category = "electrolysis",
		auto_recycle = false,
		enabled = false,
		energy_required = 5,
		ingredients = {
			{type = "item", name = "titanium-ore", amount = 4},
			{type = "fluid", name = "carbon-monoxide", amount = 4},
		},
		results = {
			{type="item", name="titanium-plate", amount=2},
			{type="fluid", name="carbon-dioxide", amount=4},
		},
		allow_productivity = true,
		main_product = "titanium-plate"
	},	
	{
		type = "recipe",
		name = "magnesium-plate",
		icon = "__outer_moons__/graphics/icons/magnesium-plate.png",
		category = "electrolysis",
		order = "e[magnesium-plate]",
		auto_recycle = false,
		enabled = false,
		energy_required = 5,
		ingredients = {
			{type = "item", name = "magnesium-ore", amount = 4},
			{type = "fluid", name = "chlorine", amount = 4},
		},
		results = {
			{type="item", name="magnesium-plate", amount=2},
			{type="fluid", name="oxygen", amount=4},
			{type="fluid", name="chlorine", amount=4},
		},
		allow_productivity = true,
		main_product = "magnesium-plate"
	},
	--Alloys
	{
		type = "recipe",
		name = "invar-plate",
		category = "alloying",
		auto_recycle = false,
		energy_required = 4,
		ingredients = {
			{type = "item", name = "iron-plate", amount = 6},
			{type = "item", name = "nickel-plate", amount = 4},
		},
		results = {{type="item", name="invar-plate", amount=4}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "steel-plate",
		category = "alloying",
		auto_recycle = false,
		energy_required = 4,
		ingredients = {
			{type = "item", name = "iron-plate", amount = 5},
			{type = "item", name = "nickel-plate", amount = 4},
			{type = "item", name = "copper-plate", amount = 1},
		},
		results = {{type="item", name="steel-plate", amount=4}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "steel-titanium-plate",
		icon = "__outer_moons__/graphics/icons/steel-titanium-plate.png",
		category = "alloying",
		subgroup = "selene-resources",
		auto_recycle = false,
		energy_required = 4,
		ingredients = {
			{type = "item", name = "iron-plate", amount = 8},
			{type = "item", name = "titanium-plate", amount = 2},
		},
		results = {{type="item", name="steel-plate", amount=5}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "duralumin-plate",
		category = "alloying",
		auto_recycle = false,
		energy_required = 4,
		ingredients = {
			{type = "item", name = "aluminum-plate", amount = 7},
			{type = "item", name = "copper-plate", amount = 3},
		},
		results = {{type="item", name="duralumin-plate", amount=4}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "caelium-plate",
		category = "alloying",
		auto_recycle = false,
		energy_required = 4,
		ingredients = {
			{type = "item", name = "aluminum-plate", amount = 6},
			{type = "item", name = "titanium-plate", amount = 4},
		},
		results = {{type="item", name="caelium-plate", amount=4}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "magnalium-plate",
		category = "alloying",
		auto_recycle = false,
		energy_required = 4,
		ingredients = {
			{type = "item", name = "magnesium-plate", amount = 5},
			{type = "item", name = "titanium-plate", amount = 5},
		},
		results = {{type="item", name="magnalium-plate", amount=4}},
		allow_productivity = true
	},
	--Metal Chemistry
	{
		type = "recipe",
		name = "aluminate",
		icon = "__outer_moons__/graphics/icons/aluminate.png",
		category = "chemistry-or-cryogenics",
		subgroup = "chemical",
		order = "b[aluminate]",
		auto_recycle = false,
		energy_required = 5,
		ingredients =
		{
		  {type = "item", name = "aluminum-ore", amount = 1 },
		  {type = "item", name = "lye", amount = 2 },
		},
		results =
		{
		  {type = "item", name = "aluminate", amount = 1},
		  {type = "fluid", name = "red-mud", amount = 8},
		},
		allow_productivity = true,
		enabled = false,
		main_product = "aluminate"
	},
	{
		type = "recipe",
		name = "alumina",
		icon = "__outer_moons__/graphics/icons/alumina.png",
		category = "chemistry-or-cryogenics",
		subgroup = "chemical",
		order = "b[selene]-d[alumina]",
		auto_recycle = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "aluminate", amount = 1},
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
	--Phase shift
	{
		type = "recipe",
		name = "dry-ice-sublimation",
		icon = "__outer_moons__/graphics/icons/fluid/dry-ice-sublimation.png",
		category = "chemistry",
		subgroup = "phase-recipes",
		order = "d[other-chemistry]-d[dry-ice-sublimation]",
		auto_recycle = false,
		enabled = false,
		ingredients = {{type = "item", name = "dry-ice", amount = 1}},
		energy_required = 1,
		results = {{type = "fluid", name = "carbon-dioxide", amount = 20}},
		allow_productivity = true,
		allow_decomposition = false,
		crafting_machine_tint =
		{
		  primary = {r = 0.982, g = 1, b = 0.758, a = 1.000}, -- #6ec5ffff
		  secondary = {r = 1, g = 0.982, b = 0.758, a = 1.000}, -- #96daffff
		  tertiary = {r = 0.381, g = 0.428, b = 0.436, a = 0.502}, -- #616d6f80
		  quaternary = {r = 0.653, g = 0.726, b = 0.726, a = 0.733}, -- #7fcbcabb
		},
		show_amount_in_title = false
	},
	-- Products
	{
		type = "recipe",
		name = "aluminum-cable",
		category = "electronics-or-assembling",
		enabled = false,
		ingredients = {{type = "item", name = "aluminum-plate", amount = 1}},
		results = {{type="item", name="aluminum-cable", amount=2}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "fiber-optic",
		category = "electronics-or-convecting",
		enabled = false,
		ingredients = {{type = "item", name = "silicon-ore", amount = 1}},
		results = {{type="item", name="fiber-optic", amount=2}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "glass-lens",
		category = "convecting",
		enabled = false,
		ingredients = {
			{type = "item", name = "silicon-ore", amount = 3},
			{type = "item", name = "salt", amount = 2},
			{type = "item", name = "plastic-bar", amount = 1},
		},
		results = {{type="item", name="glass-lens", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "spark-plug",
		category = "advanced-crafting",
		enabled = false,
		ingredients = {
			{type = "item", name = "copper-cable", amount = 1},
			{type = "item", name = "silicon-ore", amount = 1},
			{type = "item", name = "aluminum-plate", amount = 1},
		},
		results = {{type="item", name="spark-plug", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "engine-unit",
		energy_required = 10,
		category = "advanced-crafting",
		ingredients =
		{
		  {type = "item", name = "nickel-plate", amount = 1},
		  {type = "item", name = "iron-gear-wheel", amount = 1},
		  {type = "item", name = "pipe", amount = 2},
		  {type = "item", name = "spark-plug", amount = 1},
		},
		results = {{type="item", name="engine-unit", amount=1}},
		enabled = false,
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "electric-engine-unit",
		category = "crafting-with-fluid",
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "iron-stick", amount = 1},
		  {type = "item", name = "aluminum-cable", amount = 2},
		  {type = "fluid", name = "lubricant", amount = 15},
		  {type = "item", name = "integrated-circuit", amount = 1},
		  {type = "item", name = "nickel-plate", amount = 1}
		},
		results = {{type="item", name="electric-engine-unit", amount=1}},
		enabled = false,
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "flying-robot-frame",
		energy_required = 20,
		ingredients =
		{
		  {type = "item", name = "electric-engine-unit", amount = 1},
		  {type = "item", name = "battery", amount = 2},
		  {type = "item", name = "duralumin-plate", amount = 1},
		  {type = "item", name = "advanced-circuit", amount = 3}
		},
		results = {{type="item", name="flying-robot-frame", amount=1}},
		enabled = false,
		allow_productivity = true
	},
	--Circuit parts
	--Circuits
	{
		type = "recipe",
		name = "electronic-circuit",
		category = "electronics-or-assembling",
		ingredients =
		{
		  {type = "item", name = "iron-plate", amount = 2},
		  {type = "item", name = "copper-cable", amount = 3},
		  {type = "item", name = "lead-plate", amount = 1},
		},
		results = {{type="item", name="electronic-circuit", amount=1}},
		enabled = false,
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "integrated-circuit",
		category = "electronics-or-assembling",
		enabled = false,
		energy_required = 6,
		ingredients =
		{
		  {type = "item", name = "electronic-circuit", amount = 2},
		  {type = "item", name = "silicon-wafer", amount = 2},
		  {type = "item", name = "aluminum-cable", amount = 4}
		},
		results = {{type="item", name="integrated-circuit", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "advanced-circuit",
		category = "electronics-or-assembling",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "integrated-circuit", amount = 3},
		  {type = "item", name = "semiconductor", amount = 2},
		  {type = "item", name = "capacitor", amount = 2}
		},
		results = {{type="item", name="advanced-circuit", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "processing-unit",
		category = "electronics-or-assembling",
		enabled = false,
		energy_required = 20,
		ingredients =
		{
		  {type = "item", name = "advanced-circuit", amount = 4},
		  {type = "item", name = "titanium-plate", amount = 2},
		  {type = "item", name = "fiber-optic", amount = 5}
		},
		results = {{type="item", name="processing-unit", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "computing-core",
		category = "electromagnetics",
		enabled = false,
		energy_required = 35,
		ingredients =
		{
		  {type = "item", name = "processing-unit", amount = 8},
		  {type = "item", name = "carbon-fiber", amount = 4},
		  {type = "item", name = "tungsten-carbide", amount = 8},
		  {type = "item", name = "supercapacitor", amount = 3},
		},
		results = {{type="item", name="computing-core", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "quantum-supercomputer",
		category = "electromagnetics",
		enabled = false,
		energy_required = 50,
		ingredients =
		{
		  {type = "item", name = "computing-core", amount = 12},
		  {type = "item", name = "quantum-processor", amount = 20},
		},
		results = {{type="item", name="quantum-supercomputer", amount=1}},
		allow_productivity = true
	},
	--Rocket parts
	{
		type = "recipe",
		name = "low-density-structure",
		category = "crafting",
		energy_required = 15,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "aluminum-plate", amount = 5},
		  {type = "item", name = "plastic-bar", amount = 15}
		},
		results = {{type="item", name="low-density-structure", amount=1}},
		allow_productivity = true
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
	-- Space
	{
		type = "recipe",
		name = "space-platform-foundation",
		energy_required = 10,
		enabled = false,
		category = "crafting",
		ingredients =
		{
		  {type = "item", name = "caelium-plate", amount = 20},
		  {type = "item", name = "aluminum-cable", amount = 20},
		  {type = "item", name = "fiber-optic", amount = 20},
		},
		results = {{type="item", name="space-platform-foundation", amount=1}}
	},
	{
		type = "recipe",
		name = "space-platform-starter-pack",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "space-platform-foundation", amount = 60},
		  {type = "item", name = "caelium-plate", amount = 20},
		  {type = "item", name = "processing-unit", amount = 20}
		},
		energy_required = 60,
		results = {{type="item", name="space-platform-starter-pack", amount=1}}
	},
	{
		type = "recipe",
		name = "cargo-bay",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "caelium-plate", amount = 20},
		  {type = "item", name = "low-density-structure", amount = 20},
		  {type = "item", name = "processing-unit", amount = 5}
		},
		energy_required = 10,
		results = {{type="item", name="cargo-bay", amount=1}}
	},
	{
		type = "recipe",
		name = "asteroid-collector",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "low-density-structure", amount = 20},
		  {type = "item", name = "electric-engine-unit", amount = 8},
		  {type = "item", name = "processing-unit", amount = 5}
		},
		energy_required = 10,
		results = {{type="item", name="asteroid-collector", amount=1}}
	},
	{
		type = "recipe",
		name = "crusher",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "low-density-structure", amount = 20},
		  {type = "item", name = "caelium-plate", amount = 10},
		  {type = "item", name = "electric-engine-unit", amount = 10}
		},
		energy_required = 10,
		results = {{type="item", name="crusher", amount=1}}
	},
	{
		type = "recipe",
		name = "thruster",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "caelium-plate", amount = 10},
		  {type = "item", name = "processing-unit", amount = 10},
		  {type = "item", name = "electric-engine-unit", amount = 5}
		},
		energy_required = 10,
		results = {{type="item", name="thruster", amount=1}}
	},
	--Vulcanus fluids
	{
      type = "recipe",
      name = "volcanic-gas-separation",
      category = "oil-processing",
      icon = "__outer_moons__/graphics/icons/fluid/volcanic-gas-separation.png",
      enabled = false,
      energy_required = 5,
      ingredients =
      {
        {type = "fluid", name = "volcanic-gas", amount = 150, fluidbox_multiplier = 10},
        {type = "item", name = "calcite", amount = 1},
      },
      results =
      {
        {type = "fluid", name = "sulfur-dioxide", amount = 45},
        {type = "fluid", name = "steam", amount = 75},
        {type = "fluid", name = "carbon-dioxide", amount = 30},
      },
      subgroup = "separation-recipes",
      order = "a[separation]-a[volcanic-gas-separation]",
      allow_productivity = true,
      auto_recycle = false,
      crafting_machine_tint =
      {
        primary = {r = 0.5, g = 0.4, b = 0.25, a = 1.000},
        secondary = {r = 0, g = 0, b = 0, a = 1.000},
        tertiary = {r = 0.75, g = 0.5, b = 0.25},
        quaternary = {r = 0.54, g = 0.48, b = 0.42}
      }
    },
	{
		type = "recipe",
		name = "molten-copper-from-lava",
		icon = "__space-age__/graphics/icons/fluid/molten-copper-from-lava.png",
		category = "metallurgy",
		subgroup = "lava-fluid",
		order = "a[melting]-a[lava-b]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "lava", amount = 500},
		  {type = "item", name = "calcite", amount = 1},
		},
		energy_required = 16,
		results =
		{
		  {type = "fluid", name = "molten-copper", amount = 250},
		  {type = "item", name = "stone", amount = 10},
		},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "molten-lead-from-lava",
		icon = "__outer_moons__/graphics/icons/fluid/molten-lead-from-lava.png",
		category = "metallurgy",
		subgroup = "lava-fluid",
		order = "a[melting]-a[lava-c]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "lava", amount = 500},
		  {type = "item", name = "calcite", amount = 1},
		},
		energy_required = 16,
		results =
		{
		  {type = "fluid", name = "molten-lead", amount = 250},
		  {type = "item", name = "stone", amount = 10},
		},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "molten-nickel-from-lava",
		icon = "__outer_moons__/graphics/icons/fluid/molten-nickel-from-lava.png",
		category = "metallurgy",
		subgroup = "lava-fluid",
		order = "a[melting]-a[lava-d]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "lava", amount = 500},
		  {type = "item", name = "calcite", amount = 1},
		},
		energy_required = 16,
		results =
		{
		  {type = "fluid", name = "molten-nickel", amount = 250},
		  {type = "item", name = "stone", amount = 10},
		},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "molten-aluminum-from-lava",
		icon = "__outer_moons__/graphics/icons/fluid/molten-aluminum-from-lava.png",
		category = "metallurgy",
		subgroup = "lava-fluid",
		order = "a[melting]-a[lava-e]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "lava", amount = 500},
		  {type = "item", name = "calcite", amount = 1},
		},
		energy_required = 16,
		results =
		{
		  {type = "fluid", name = "molten-aluminum", amount = 250},
		  {type = "item", name = "stone", amount = 10},
		},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "molten-silicon-from-lava",
		icon = "__outer_moons__/graphics/icons/fluid/molten-silicon-from-lava.png",
		category = "metallurgy",
		subgroup = "lava-fluid",
		order = "a[melting]-a[lava-e]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "lava", amount = 500},
		  {type = "item", name = "calcite", amount = 1},
		},
		energy_required = 16,
		results =
		{
		  {type = "fluid", name = "molten-silicon", amount = 250},
		  {type = "item", name = "stone", amount = 10},
		},
		allow_productivity = true
	},
	
	
	{
		type = "recipe",
		name = "molten-lead",
		category = "metallurgy",
		subgroup = "vulcanus-fluid",
		order = "a[melting]-d[molten-lead]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "lead-ore", amount = 50},
		  {type = "item", name = "calcite", amount = 1},
		},
		energy_required = 32,
		results =
		{
		  {type = "fluid", name = "molten-lead", amount = 500},
		},
		hide_from_signal_gui = false,
		allow_productivity = true,
		main_product =  "molten-lead"
	},
	{
		type = "recipe",
		name = "molten-nickel",
		category = "metallurgy",
		subgroup = "vulcanus-fluid",
		order = "a[melting]-e[molten-nickel]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "nickel-ore", amount = 50},
		  {type = "item", name = "calcite", amount = 1},
		},
		energy_required = 32,
		results =
		{
		  {type = "fluid", name = "molten-nickel", amount = 500},
		},
		hide_from_signal_gui = false,
		allow_productivity = true,
		main_product =  "molten-nickel"
	},
	{
		type = "recipe",
		name = "molten-aluminum",
		category = "metallurgy",
		subgroup = "vulcanus-fluid",
		order = "a[melting]-f[molten-aluminum]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "alumina", amount = 50},
		  {type = "item", name = "calcite", amount = 1},
		},
		energy_required = 32,
		results =
		{
		  {type = "fluid", name = "molten-aluminum", amount = 500},
		},
		hide_from_signal_gui = false,
		allow_productivity = true,
		main_product =  "molten-aluminum"
	},
	{
		type = "recipe",
		name = "molten-silicon",
		category = "metallurgy",
		subgroup = "vulcanus-fluid",
		order = "a[melting]-g[molten-silicon]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "silicon-ore", amount = 50},
		  {type = "item", name = "calcite", amount = 1},
		},
		energy_required = 32,
		results =
		{
		  {type = "fluid", name = "molten-silicon", amount = 500},
		},
		hide_from_signal_gui = false,
		allow_productivity = true,
		main_product =  "molten-silicon"
	},
	{
		type = "recipe",
		name = "molten-titanium",
		category = "metallurgy",
		subgroup = "vulcanus-fluid",
		order = "a[melting]-h[molten-titanium]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "titanium-ore", amount = 50},
		  {type = "item", name = "calcite", amount = 1},
		},
		energy_required = 32,
		results =
		{
		  {type = "fluid", name = "molten-titanium", amount = 500},
		},
		hide_from_signal_gui = false,
		allow_productivity = true,
		main_product =  "molten-titanium"
	},
	{
		type = "recipe",
		name = "molten-magnesium",
		category = "metallurgy",
		subgroup = "vulcanus-fluid",
		order = "a[melting]-i[molten-magnesium]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "magnesium-ore", amount = 50},
		  {type = "item", name = "calcite", amount = 1},
		},
		energy_required = 32,
		results =
		{
		  {type = "fluid", name = "molten-magnesium", amount = 500},
		},
		hide_from_signal_gui = false,
		allow_productivity = true,
		main_product =  "molten-magnesium"
	},
	{
		type = "recipe",
		name = "molten-tungsten",
		category = "metallurgy",
		subgroup = "vulcanus-fluid",
		order = "a[melting]-j[molten-tungsten]",
		auto_recycle = false,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "tungsten-ore", amount = 50},
		  {type = "item", name = "calcite", amount = 1},
		},
		energy_required = 32,
		results =
		{
		  {type = "fluid", name = "molten-tungsten", amount = 500},
		},
		hide_from_signal_gui = false,
		allow_productivity = true,
		main_product =  "molten-tungsten"
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
		  {type = "fluid", name = "molten-titanium", amount = 20, fluidbox_multiplier = 10},
		},
		energy_required = 3.2,
		results = {{type="item", name="titanium-plate", amount=1}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "tungsten-plate",
		category = "metallurgy",
		subgroup = "vulcanus-processes",
		order = "c[tungsten]-c[tungsten-plate]",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "molten-tungsten", amount = 20},
		},
		energy_required = 3.2,
		results = {{type="item", name="tungsten-plate", amount=2}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "casting-invar",
		category = "metallurgy",
		subgroup = "vulcanus-processes",
		order = "b[casting]-c[casting-invar]",
		icon = "__space-age__/graphics/icons/casting-steel.png",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "molten-iron", amount = 12, fluidbox_multiplier = 10},
		  {type = "fluid", name = "molten-tungsten", amount = 8, fluidbox_multiplier = 10}
		},
		energy_required = 5,
		allow_decomposition = false,
		results = {{type = "item", name = "invar-plate", amount = 2}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "casting-steel",
		category = "metallurgy",
		subgroup = "vulcanus-processes",
		order = "b[casting]-c[casting-steel]",
		icon = "__space-age__/graphics/icons/casting-steel.png",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "molten-iron", amount = 15, fluidbox_multiplier = 10},
		  {type = "fluid", name = "molten-tungsten", amount = 5, fluidbox_multiplier = 10}
		},
		energy_required = 5,
		allow_decomposition = false,
		results = {{type = "item", name = "steel-plate", amount = 2}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "casting-duralumin",
		category = "metallurgy",
		subgroup = "vulcanus-processes",
		order = "b[casting]-c[casting-duralumin]",
		icon = "__space-age__/graphics/icons/casting-steel.png",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "molten-copper", amount = 6, fluidbox_multiplier = 10},
		  {type = "fluid", name = "molten-aluminum", amount = 14, fluidbox_multiplier = 10}
		},
		energy_required = 5,
		allow_decomposition = false,
		results = {{type = "item", name = "duralumin-plate", amount = 2}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "casting-caelium",
		category = "metallurgy",
		subgroup = "vulcanus-processes",
		order = "b[casting]-c[casting-caelium]",
		icon = "__space-age__/graphics/icons/casting-steel.png",
		enabled = false,
		ingredients =
		{
		  {type = "fluid", name = "molten-aluminum", amount = 16, fluidbox_multiplier = 10},
		  {type = "fluid", name = "molten-titanium", amount = 4, fluidbox_multiplier = 10}
		},
		energy_required = 5,
		allow_decomposition = false,
		results = {{type = "item", name = "caelium-plate", amount = 2}},
		allow_productivity = true
	},
	
	-- Fluid Electrolysis		
	{
		type = "recipe",
		name = "water-evaporation",
		icon = "__outer_moons__/graphics/icons/fluid/water-evaporation.png",
		category = "electrolysis",
		subgroup = "electrolytic-recipes",
		order = "a[electrolysis]-a[water-evaporation]",
		auto_recycle = false,
		energy_required = 10,
		surface_conditions = {
			{
				property = "pressure",
				min = 500,
				max = 5000
			}
		},
		ingredients =
		{
		  {type = "fluid", name = "water", amount = 50},
		},
		results =
		{
		  {type = "item", name = "salt", amount = 5},
		  {type = "item", name = "potassium-salt", amount = 3},
		},
		allow_productivity = false,
		enabled = false,
		always_show_made_in = true,
		show_amount_in_title = false,
		always_show_products = true,
		allow_decomposition = false,
	},
	{
		type = "recipe",
		name = "water-electrolysis",
		icon = "__outer_moons__/graphics/icons/fluid/water-electrolysis.png",
		category = "electrolysis",
		subgroup = "electrolytic-recipes",
		order = "a[electrolysis]-b[water-electrolysis]",
		auto_recycle = false,
		energy_required = 50,
		ingredients =
		{
		  {type = "fluid", name = "water", amount = 20},
		},
		results =
		{
		  {type = "fluid", name = "hydrogen", amount = 20},
		  {type = "fluid", name = "oxygen", amount = 20},
		},
		allow_productivity = false,
		enabled = false,
		always_show_made_in = true,
		show_amount_in_title = false,
		always_show_products = true,
		allow_decomposition = false,
	},
	{
		type = "recipe",
		name = "brine",
		icon = "__outer_moons__/graphics/icons/fluid/brine.png",
		category = "electrolysis",
		subgroup = "electrolytic-recipes",
		order = "a[electrolysis]-e[brine]",
		auto_recycle = false,
		energy_required = 25,
		surface_conditions = {
			{
				property = "pressure",
				min = 500,
				max = 5000
			}
		},
		ingredients =
		{
		  {type = "fluid", name = "water", amount = 40},
		},
		results =
		{
		  {type = "fluid", name = "brine", amount = 20},
		},
		allow_productivity = false,
		enabled = false,
		always_show_made_in = true,
		show_amount_in_title = false,
		always_show_products = true,
		allow_decomposition = false,
	},
	{
		type = "recipe",
		name = "chloralkali-process",
		icon = "__outer_moons__/graphics/icons/fluid/chloralkali-process.png",
		category = "electrolysis",
		subgroup = "electrolytic-recipes",
		order = "a[electrolysis]-f[chloralkali-process]",
		auto_recycle = false,
		energy_required = 40,
		ingredients =
		{
		  {type = "fluid", name = "brine", amount = 30},
		},
		results =
		{
		  {type = "item", name = "lye", amount = 10},
		  {type = "fluid", name = "hydrogen", amount = 25},
		  {type = "fluid", name = "chlorine", amount = 20},
		},
		allow_productivity = true,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		allow_decomposition = false,
	},
	{
		type = "recipe",
		name = "red-mud-reprocessing",
		icon = "__outer_moons__/graphics/icons/red-mud-reprocessing.png",
		category = "electrolysis",
		subgroup = "electrolytic-recipes",
		order = "a[electrolysis]-d[red-mud-reprocessing]",
		auto_recycle = false,
		energy_required = 30,
		ingredients =
		{
		  {type = "fluid", name = "water", amount = 20},
		  {type = "fluid", name = "red-mud", amount = 5},
		},
		results =
		{
		  {type = "item", name = "iron-ore", amount = 1, probability = 0.6, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "silicon-ore", amount = 1, probability = 0.5, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "alumina", amount = 1, probability = 0.3, show_details_in_recipe_tooltip = false},
		  {type = "item", name = "titanium-ore", amount = 1, probability = 0.15, show_details_in_recipe_tooltip = false},
		},
		allow_productivity = true,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		allow_decomposition = false,
	},
	{
		type = "recipe",
		name = "brine-extraction",
		icon = "__outer_moons__/graphics/icons/fluid/brine-extraction.png",
		category = "electrolysis",
		subgroup = "electrolytic-recipes",
		order = "a[electrolysis]-g[brine-extraction]",
		auto_recycle = false,
		energy_required = 10,
		surface_conditions = {
			{
				property = "pressure",
				min = 150,
				max = 150
			}
		},
		ingredients =
		{
		  {type = "fluid", name = "brine", amount = 50},
		},
		results =
		{
		  {type = "item", name = "magnesium-ore", amount = 5},
		  {type = "item", name = "calcite", amount = 5},
		  {type = "fluid", name = "water", amount = 35},
		},
		allow_productivity = false,
		enabled = false,
		always_show_made_in = true,
		show_amount_in_title = false,
		always_show_products = true,
		allow_decomposition = false,
	},
	{
		type = "recipe",
		name = "carbon-dioxide-electrolysis",
		icon = "__outer_moons__/graphics/icons/fluid/carbon-dioxide-electrolysis.png",
		category = "electrolysis",
		subgroup = "electrolytic-recipes",
		order = "a[electrolysis]-c[carbon-dioxide-electrolysis]",
		auto_recycle = false,
		energy_required = 50,
		ingredients =
		{
		  {type = "fluid", name = "carbon-dioxide", amount = 20},
		  {type = "fluid", name = "hydrogen", amount = 20},
		},
		results =
		{
		  {type = "item", name = "carbon", amount = 8},
		  {type = "fluid", name = "carbon-monoxide", amount = 12},
		  {type = "fluid", name = "water", amount = 20},
		},
		allow_productivity = true,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		allow_decomposition = false,
	},
	-- Selene
	{
		type = "recipe",
		name = "amalgamate-regolith",
		icon = "__outer_moons__/graphics/icons/amalgamate-regolith.png",
		category = "convecting",
		subgroup = "selene-processes",
		order = "a[selene]-a[amalgamate-regolith]",
		auto_recycle = false,
		energy_required = 5,
		ingredients = {{type = "item", name = "metallic-regolith", amount = 3}},
		results = {
			{type="item", name="stone", amount=1, probability=0.5, show_details_in_recipe_tooltip = false},
			{type="item", name="silicon-ore", amount=1, probability=0.45, show_details_in_recipe_tooltip = false},
			{type="item", name="alumina", amount=1, probability=0.4, show_details_in_recipe_tooltip = false},
			{type="item", name="iron-ore", amount=1, probability=0.35, show_details_in_recipe_tooltip = false},
			{type="item", name="copper-ore", amount=1, probability=0.3, show_details_in_recipe_tooltip = false},
			{type="item", name="magnesium-ore", amount=1, probability=0.25, show_details_in_recipe_tooltip = false},
			{type="item", name="sulfur", amount=1, probability=0.2, show_details_in_recipe_tooltip = false},
			--{type="item", name="aluminum-ore", amount=1, probability=0.03},
			--{type="item", name="titanium-ore", amount=1, probability=0.02},
			{type="item", name="uranium-ore", amount=1, probability=0.05, show_details_in_recipe_tooltip = false}
		},
		allow_productivity = true,
		enabled = false
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
		name = "stone-furnace-new",
		ingredients = {{type = "item", name = "stone", amount = 5}},
		results = {{type="item", name="stone-furnace-new", amount=1}}
	},
	{
		type = "recipe",
		name = "steel-furnace-new",
		ingredients = {{type = "item", name = "invar-plate", amount = 6}, {type = "item", name = "electronic-circuit", amount = 5}, {type = "item", name = "stone-brick", amount = 10}},
		results = {{type="item", name="steel-furnace-new", amount=1}},
		energy_required = 3,
		enabled = false
	},
	{
		type = "recipe",
		name = "electric-furnace-new",
		ingredients = {{type = "item", name = "invar-plate", amount = 10}, {type = "item", name = "integrated-circuit", amount = 5}, {type = "item", name = "concrete", amount = 10}},
		results = {{type="item", name="electric-furnace-new", amount=1}},
		energy_required = 5,
		enabled = false
	},
	{
		type = "recipe",
		name = "industrial-furnace",
		ingredients = {{type = "item", name = "invar-plate", amount = 20}, {type = "item", name = "advanced-circuit", amount = 5}, {type = "item", name = "refined-concrete", amount = 10}},
		results = {{type="item", name="industrial-furnace", amount=1}},
		energy_required = 10,
		enabled = false
	},
	{
		type = "recipe",
		name = "boiler",
		enabled = false,
		ingredients = {{type = "item", name = "stone-furnace-new", amount = 1}, {type = "item", name = "pipe", amount = 4}},
		results = {{type="item", name="boiler", amount=1}}
	},
	{
		type = "recipe",
		name = "burner-mining-drill",
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "iron-gear-wheel", amount = 3},
		  {type = "item", name = "stone-furnace-new", amount = 1},
		  {type = "item", name = "iron-plate", amount = 3}
		},
		results = {{type="item", name="burner-mining-drill", amount=1}}
	},
	{
		type = "recipe",
		name = "beacon",
		enabled = false,
		energy_required = 15,
		ingredients =
		{
		  {type = "item", name = "processing-unit", amount = 20},
		  {type = "item", name = "advanced-circuit", amount = 20},
		  {type = "item", name = "aluminum-plate", amount = 10},
		  {type = "item", name = "fiber-optic", amount = 10}
		},
		results = {{type="item", name="beacon", amount=1}}
	},
	{
		type = "recipe",
		name = "solar-panel",
		energy_required = 10,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 4},
		  {type = "item", name = "electronic-circuit", amount = 10},
		  {type = "item", name = "silicon-wafer", amount = 16}
		},
		results = {{type="item", name="solar-panel", amount=1}}
	},
	{
		type = "recipe",
		name = "electric-boiler",
		energy_required = 3,
		enabled = false,
		ingredients = {
			{type = "item", name = "steel-plate", amount = 10}, 
			{type = "item", name = "copper-cable", amount = 20}, 
			{type = "item", name = "electronic-circuit", amount = 5}, 
			{type = "item", name = "pipe", amount = 10}
		},
		results = {{type="item", name="electric-boiler", amount=1}}
	},
	{
		type = "recipe",
		name = "nuclear-reactor",
		energy_required = 8,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "concrete", amount = 500},
		  {type = "item", name = "steel-plate", amount = 500},
		  {type = "item", name = "advanced-circuit", amount = 500},
		  {type = "item", name = "lead-plate", amount = 500}
		},
		results = {{type="item", name="nuclear-reactor", amount=1}},
		requester_paste_multiplier = 1
	},
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
		name = "foundry",
		category = "metallurgy-or-assembling",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2000,
			max = 2000
		  }
		},
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "tungsten-carbide", amount = 50},
		  {type = "item", name = "invar-plate", amount = 50},
		  {type = "item", name = "electronic-circuit", amount = 30},
		  {type = "item", name = "refined-concrete", amount = 20},
		  {type = "fluid", name = "lubricant", amount = 20}
		},
		energy_required = 10,
		results = {{type="item", name="foundry", amount=1}}
	},
	{
		type = "recipe",
		name = "megafoundry",
		category = "metallurgy-or-adv-metallurgy",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 500,
			max = 500
		  }
		},
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "foundry", amount = 1},
		  {type = "item", name = "tungsten-plate", amount = 15},
		  {type = "item", name = "superconductor", amount = 20},
		  {type = "item", name = "computing-core", amount = 30},
		  {type = "item", name = "carbon-fiber", amount = 10}
		},
		energy_required = 20,
		results = {{type="item", name="megafoundry", amount=1}}
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
	-- Science	
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
		  {type = "item", name = "sulfur", amount = 5},
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
		name = "production-science-pack",
		enabled = false,
		energy_required = 21,
		ingredients =
		{
		  {type = "item", name = "electric-furnace-new", amount = 1},
		  {type = "item", name = "productivity-module", amount = 1},
		  {type = "item", name = "rail", amount = 30}
		},
		results = {{type="item", name="production-science-pack", amount=3}},
		crafting_machine_tint =
		{
		  primary = {r = 0.8, g = 0.0, b = 1.0, a = 1.000},
		  secondary = {r = 0.8, g = 0.0, b = 1.0, a = 1.000},
		},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "lunar-science-pack",
		category = "robotics",
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
	-- Military
	
	{
		type = "recipe",
		name = "gun-turret",
		enabled = false,
		energy_required = 8,
		ingredients =
		{
		  {type = "item", name = "iron-gear-wheel", amount = 10},
		  {type = "item", name = "copper-plate", amount = 10},
		  {type = "item", name = "iron-plate", amount = 20},
		  {type = "item", name = "electronic-circuit", amount = 3},		  
		},
		results = {{type="item", name="gun-turret", amount=1}}
	},
	{
		type = "recipe",
		name = "laser-turret",
		enabled = false,
		energy_required = 20,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 20},
		  {type = "item", name = "advanced-circuit", amount = 10},
		  {type = "item", name = "battery", amount = 12},
		  {type = "item", name = "glass-lens", amount = 8}
		},
		results = {{type="item", name="laser-turret", amount=1}}
	},
	{
		type = "recipe",
		name = "flamethrower-turret",
		enabled = false,
		energy_required = 20,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 30},
		  {type = "item", name = "spark-plug", amount = 2},
		  {type = "item", name = "pump", amount = 2},
		  {type = "item", name = "integrated-circuit", amount = 5}
		},
		results = {{type="item", name="flamethrower-turret", amount=1}}
	},
	
	{
		type = "recipe",
		name = "defender-capsule",
		enabled = false,
		energy_required = 8,
		ingredients =
		{
		  {type = "item", name = "piercing-rounds-magazine", amount = 3},
		  {type = "item", name = "electronic-circuit", amount = 3},
		  {type = "item", name = "duralumin-plate", amount = 1},
		  {type = "item", name = "flying-robot-frame", amount = 1},
		},
		results = {{type="item", name="defender-capsule", amount=1}}
	},
	{
		type = "recipe",
		name = "distractor-capsule",
		enabled = false,
		energy_required = 15,
		ingredients =
		{
		  {type = "item", name = "integrated-circuit", amount = 3},
		  {type = "item", name = "glass-lens", amount = 4},
		  {type = "item", name = "duralumin-plate", amount = 1},
		  {type = "item", name = "flying-robot-frame", amount = 1},
		},
		results = {{type="item", name="distractor-capsule", amount=1}}
	},
	{
		type = "recipe",
		name = "destroyer-capsule",
		enabled = false,
		energy_required = 15,
		ingredients =
		{
		  {type = "item", name = "aluminum-cable", amount = 4},
		  {type = "item", name = "advanced-circuit", amount = 1},
		  {type = "item", name = "duralumin-plate", amount = 1},
		  {type = "item", name = "flying-robot-frame", amount = 1},
		},
		results = {{type="item", name="destroyer-capsule", amount=1}}
	},
	
	
	{
		type = "recipe",
		name = "pistol",
		enabled = false,
		energy_required = 5,
		ingredients =
		{
		  {type = "item", name = "copper-plate", amount = 2},
		  {type = "item", name = "iron-gear-wheel", amount = 2},
		  {type = "item", name = "iron-plate", amount = 4}
		},
		results = {{type="item", name="pistol", amount=1}}
	},
	{
		type = "recipe",
		name = "combat-shotgun",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 15},
		  {type = "item", name = "iron-gear-wheel", amount = 5},
		  {type = "item", name = "copper-plate", amount = 10},
		  {type = "item", name = "plastic-bar", amount = 10}
		},
		results = {{type="item", name="combat-shotgun", amount=1}}
	},
	{
		type = "recipe",
		name = "flamethrower",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 5},
		  {type = "item", name = "iron-gear-wheel", amount = 10},
		  {type = "item", name = "spark-plug", amount = 2},
		},
		results = {{type="item", name="flamethrower", amount=1}}
	},
	
	{
		type = "recipe",
		name = "shotgun-shell",
		enabled = false,
		energy_required = 3,
		ingredients =
		{
		  {type = "item", name = "lead-plate", amount = 2},
		  {type = "item", name = "wood", amount = 1}
		},
		results = {{type="item", name="shotgun-shell", amount=1}}
	},
	{
		type = "recipe",
		name = "piercing-shotgun-shell",
		enabled = false,
		energy_required = 8,
		ingredients =
		{
		  {type = "item", name = "shotgun-shell", amount = 2},
		  {type = "item", name = "plastic-bar", amount = 5},
		  {type = "item", name = "steel-plate", amount = 2}
		},
		results = {{type="item", name="piercing-shotgun-shell", amount=1}}
	},
	{
		type = "recipe",
		name = "firearm-magazine",
		energy_required = 1,
		ingredients = {{type = "item", name = "lead-plate", amount = 4}},
		results = {{type="item", name="firearm-magazine", amount=1}}
	},
	
	{
		type = "recipe",
		name = "rocket",
		enabled = false,
		energy_required = 4,
		ingredients =
		{
		  {type = "item", name = "explosives", amount = 1},
		  {type = "item", name = "iron-plate", amount = 2},
		  {type = "item", name = "electronic-circuit", amount = 1},
		},
		results = {{type="item", name="rocket", amount=1}}
	},
	{
		type = "recipe",
		name = "explosive-rocket",
		enabled = false,
		energy_required = 8,
		ingredients =
		{
		  {type = "item", name = "rocket", amount = 1},
		  {type = "item", name = "explosives", amount = 2},
		  {type = "item", name = "integrated-circuit", amount = 2}
		},
		results = {{type="item", name="explosive-rocket", amount=1}}
	},
	{
		type = "recipe",
		name = "atomic-bomb",
		enabled = false,
		energy_required = 50,
		ingredients =
		{
		  {type = "item", name = "processing-unit", amount = 10},
		  {type = "item", name = "explosives", amount = 10},
		  {type = "item", name = "uranium-235", amount = 30}
		},
		results = {{type="item", name="atomic-bomb", amount=1}}
	},
	
	--Armor	
	{
		type = "recipe",
		name = "light-armor",
		enabled = true,
		energy_required = 3,
		ingredients = {{type = "item", name = "iron-plate", amount = 40}},
		results = {{type="item", name="light-armor", amount=1}}
	},
	{
		type = "recipe",
		name = "heavy-armor",
		enabled = false,
		energy_required = 8,
		ingredients = {
			{type = "item", name = "nickel-plate", amount = 100}, 
			{type = "item", name = "steel-plate", amount = 50},
			{type = "item", name = "light-armor", amount = 1},
		},
		results = {{type="item", name="heavy-armor", amount=1}}
	},
	{
		type = "recipe",
		name = "modular-armor",
		enabled = false,
		energy_required = 15,
		ingredients =
		{
		  {type = "item", name = "integrated-circuit", amount = 30},
		  {type = "item", name = "plastic-bar", amount = 50},
		  {type = "item", name = "heavy-armor", amount = 1},
		},
		results = {{type="item", name="modular-armor", amount=1}}
	},
	{
		type = "recipe",
		name = "power-armor",
		enabled = false,
		energy_required = 20,
		ingredients = {
			{type = "item", name = "advanced-circuit", amount = 40}, 
			{type = "item", name = "electric-engine-unit", amount = 20}, 
			{type = "item", name = "titanium-plate", amount = 40},
		    {type = "item", name = "modular-armor", amount = 1},
		},
		results = {{type="item", name="power-armor", amount=1}},
		requester_paste_multiplier = 1
	},
	{
		type = "recipe",
		name = "power-armor-mk2",
		enabled = false,
		energy_required = 25,
		ingredients =
		{
		  {type = "item", name = "efficiency-module-2", amount = 100},
		  {type = "item", name = "speed-module-2", amount = 100},
		  {type = "item", name = "processing-unit", amount = 60},
		  {type = "item", name = "electric-engine-unit", amount = 40},
		  {type = "item", name = "low-density-structure", amount = 30},
		  {type = "item", name = "power-armor", amount = 1},
		},
		results = {{type="item", name="power-armor-mk2", amount=1}},
		requester_paste_multiplier = 1
	},
    {
		type = "recipe",
		name = "mech-armor",
		enabled = false,
		energy_required = 60,
		ingredients =
		{
		  {type = "item", name = "power-armor-mk2", amount = 1},
		  {type = "item", name = "computing-core", amount = 100},
		  {type = "item", name = "tungsten-carbide", amount = 50},
		  {type = "item", name = "carbon-fiber", amount = 50},
		  {type = "item", name = "supercapacitor", amount = 50}
		},
		results = {{type="item", name="mech-armor", amount=1}}
	},
	---Gleba
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
      category = "oil-processing",
      icon = "__outer_moons__/graphics/icons/fluid/sludge-separation.png",
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
      subgroup = "separation-recipes",
      order = "a[separation]-b[fulgoran-sludge-separation]",
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
	--Inserters	
	{
		type = "recipe",
		name = "stack-inserter",
		category = "robotics",
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
	-- Modules
	{
		type = "recipe",
		name = "speed-module",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "integrated-circuit", amount = 5},
		  {type = "item", name = "electronic-circuit", amount = 5}
		},
		energy_required = 15,
		results = {{type="item", name="speed-module", amount=1}}
	},
	{
		type = "recipe",
		name = "speed-module-2",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "speed-module", amount = 4},
		  {type = "item", name = "advanced-circuit", amount = 5},
		  {type = "item", name = "processing-unit", amount = 5}
		},
		energy_required = 30,
		results = {{type="item", name="speed-module-2", amount=1}}
	},
	{
		type = "recipe",
		name = "speed-module-3",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "speed-module-2", amount = 4},
		  {type = "item", name = "computing-core", amount = 5},
		  {type = "item", name = "quantum-supercomputer", amount = 5}
		},
		energy_required = 60,
		results = {{type="item", name="speed-module-3", amount=1}}
	},
	{
		type = "recipe",
		name = "productivity-module",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "integrated-circuit", amount = 5},
		  {type = "item", name = "electronic-circuit", amount = 5}
		},
		energy_required = 15,
		results = {{type="item", name="productivity-module", amount=1}}
	},
	{
		type = "recipe",
		name = "productivity-module-2",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "productivity-module", amount = 4},
		  {type = "item", name = "advanced-circuit", amount = 5},
		  {type = "item", name = "processing-unit", amount = 5}
		},
		energy_required = 30,
		results = {{type="item", name="productivity-module-2", amount=1}}
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
		  {type = "item", name = "computing-core", amount = 5},
		  {type = "item", name = "quantum-supercomputer", amount = 5}
		},
		results = {{type="item", name="productivity-module-3", amount=1}}
	},
	{
		type = "recipe",
		name = "efficiency-module",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "integrated-circuit", amount = 5},
		  {type = "item", name = "electronic-circuit", amount = 5}
		},
		energy_required = 15,
		results = {{type="item", name="efficiency-module", amount=1}}
	},
	{
		type = "recipe",
		name = "efficiency-module-2",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "efficiency-module", amount = 4},
		  {type = "item", name = "advanced-circuit", amount = 5},
		  {type = "item", name = "processing-unit", amount = 5}
		},
		energy_required = 30,
		results = {{type="item", name="efficiency-module-2", amount=1}}
	},
	{
		type = "recipe",
		name = "efficiency-module-3",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "efficiency-module-2", amount = 4},
		  {type = "item", name = "computing-core", amount = 5},
		  {type = "item", name = "quantum-supercomputer", amount = 5}
		},
		energy_required = 60,
		results = {{type="item", name="efficiency-module-3", amount=1}}
	},
	{
		type = "recipe",
		name = "quality-module",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "electronic-circuit", amount = 5},
		  {type = "item", name = "integrated-circuit", amount = 5},
		},
		energy_required = 15,
		results = {{type="item", name="quality-module", amount=1}}
	},
	{
		type = "recipe",
		name = "quality-module-2",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "quality-module", amount = 4},
		  {type = "item", name = "advanced-circuit", amount = 5},
		  {type = "item", name = "processing-unit", amount = 5},
		},
		energy_required = 30,
		results = {{type="item", name="quality-module-2", amount=1}}
	},
	{
		type = "recipe",
		name = "quality-module-3",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "quality-module-2", amount = 4},
		  {type = "item", name = "computing-core", amount = 5},
		  {type = "item", name = "quantum-supercomputer", amount = 5}
		},
		energy_required = 60,
		results = {{type="item", name="quality-module-3", amount=1}}
	},
	--Scrap
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
	--Belts
	{
		type = "recipe",
		name = "transport-belt",
		energy_required = 1,
		ingredients =
		{
		  {type = "item", name = "iron-plate", amount = 1},
		  {type = "item", name = "iron-gear-wheel", amount = 1}
		},
		results = {{type="item", name="transport-belt", amount=2}}
	},
	{
		type = "recipe",
		name = "fast-transport-belt",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 2},
		  {type = "item", name = "iron-gear-wheel", amount = 4},
		  {type = "item", name = "transport-belt", amount = 1}
		},
		results = {{type="item", name="fast-transport-belt", amount=1}}
	},
	{
		type = "recipe",
		name = "express-transport-belt",
		category = "crafting-with-fluid",
		energy_required = 3,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "aluminum-plate", amount = 3},
		  {type = "item", name = "iron-gear-wheel", amount = 8},
		  {type = "item", name = "fast-transport-belt", amount = 1},
		  {type = "fluid", name = "lubricant", amount = 20}
		},
		results = {{type="item", name="express-transport-belt", amount=1}}
	},
	{
		type = "recipe",
		name = "turbo-transport-belt",
		category = "metallurgy",
		energy_required = 4,
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2000,
			max = 2000
		  }
		},
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "tungsten-plate", amount = 4},
		  {type = "item", name = "iron-gear-wheel", amount = 12},
		  {type = "item", name = "express-transport-belt", amount = 1},
		  {type= "fluid", name = "lubricant", amount = 25}
		},
		results = {{type="item", name="turbo-transport-belt", amount=1}}
	},
	{
		type = "recipe",
		name = "hyper-transport-belt",
		category = "adv-metallurgy",
		energy_required = 5,
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 500,
			max = 500
		  }
		},
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "osmiridium-plate", amount = 5},
		  {type = "item", name = "iron-gear-wheel", amount = 16},
		  {type = "item", name = "turbo-transport-belt", amount = 1},
		  {type= "fluid", name = "lubricant", amount = 30}
		},
		results = {{type="item", name="hyper-transport-belt", amount=1}}
	},
	--Underground
	{
		type = "recipe",
		name = "underground-belt",
		enabled = false,
		energy_required = 1,
		ingredients =
		{
		  {type = "item", name = "iron-plate", amount = 10},
		  {type = "item", name = "iron-gear-wheel", amount = 5},
		  {type = "item", name = "transport-belt", amount = 5}
		},
		results = {{type="item", name="underground-belt", amount=2}}
	},
	{
		type = "recipe",
		name = "fast-underground-belt",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "steel-plate", amount = 14},
		  {type = "item", name = "iron-gear-wheel", amount = 14},
		  {type = "item", name = "underground-belt", amount = 2}
		},
		results = {{type="item", name="fast-underground-belt", amount=2}}
	},
	{
		type = "recipe",
		name = "express-underground-belt",
		energy_required = 3,
		category = "crafting-with-fluid",
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "aluminum-plate", amount = 18},
		  {type = "item", name = "iron-gear-wheel", amount = 18},
		  {type = "item", name = "fast-underground-belt", amount = 2},
		  {type = "fluid", name = "lubricant", amount = 40}
		},
		results = {{type="item", name="express-underground-belt", amount=2}}
	},
	{
		type = "recipe",
		name = "turbo-underground-belt",
		energy_required = 4,
		category = "metallurgy",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2000,
			max = 2000
		  }
		},
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "tungsten-plate", amount = 22},
		  {type = "item", name = "iron-gear-wheel", amount = 22},
		  {type = "item", name = "express-underground-belt", amount = 2},
		  {type = "fluid", name = "lubricant", amount = 50}
		},
		results = {{type="item", name="turbo-underground-belt", amount=2}}
	},
	{
		type = "recipe",
		name = "hyper-underground-belt",
		energy_required = 5,
		category = "adv-metallurgy",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 500,
			max = 500
		  }
		},
		enabled = false,
		ingredients =
		{
		  {type = "item", name = "osmiridium-plate", amount = 26},
		  {type = "item", name = "iron-gear-wheel", amount = 26},
		  {type = "item", name = "turbo-underground-belt", amount = 2},
		  {type = "fluid", name = "lubricant", amount = 60}
		},
		results = {{type="item", name="hyper-underground-belt", amount=2}}
	},
	--Splitter
	{
		type = "recipe",
		name = "splitter",
		enabled = false,
		energy_required = 1,
		ingredients =
		{
		  {type = "item", name = "electronic-circuit", amount = 5},
		  {type = "item", name = "iron-plate", amount = 2},
		  {type = "item", name = "iron-gear-wheel", amount = 4},
		  {type = "item", name = "transport-belt", amount = 2}
		},
		results = {{type="item", name="splitter", amount=1}}
	},
	{
		type = "recipe",
		name = "fast-splitter",
		enabled = false,
		energy_required = 2,
		ingredients =
		{
		  {type = "item", name = "splitter", amount = 1},
		  {type = "item", name = "steel-plate", amount = 4},
		  {type = "item", name = "iron-gear-wheel", amount = 8},
		  {type = "item", name = "integrated-circuit", amount = 5}
		},
		results = {{type="item", name="fast-splitter", amount=1}}
	},
	{
		type = "recipe",
		name = "express-splitter",
		category = "crafting-with-fluid",
		enabled = false,
		energy_required = 3,
		ingredients =
		{
		  {type = "item", name = "fast-splitter", amount = 1},
		  {type = "item", name = "aluminum-plate", amount = 6},
		  {type = "item", name = "iron-gear-wheel", amount = 12},
		  {type = "item", name = "advanced-circuit", amount = 5},
		  {type = "fluid", name = "lubricant", amount = 60}
		},
		results = {{type="item", name="express-splitter", amount=1}}
	},
	{
		type = "recipe",
		name = "turbo-splitter",
		category = "metallurgy",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 2000,
			max = 2000
		  }
		},
		enabled = false,
		energy_required = 4,
		ingredients =
		{
		  {type = "item", name = "express-splitter", amount = 1},
		  {type = "item", name = "tungsten-plate", amount = 8},
		  {type = "item", name = "iron-gear-wheel", amount = 16},
		  {type = "item", name = "processing-unit", amount = 5},
		  {type = "fluid", name = "lubricant", amount = 80}
		},
		results = {{type="item", name="turbo-splitter", amount=1}}
	},
	{
		type = "recipe",
		name = "turbo-splitter",
		category = "adv-metallurgy",
		surface_conditions =
		{
		  {
			property = "pressure",
			min = 500,
			max = 500
		  }
		},
		enabled = false,
		energy_required = 5,
		ingredients =
		{
		  {type = "item", name = "turbo-splitter", amount = 1},
		  {type = "item", name = "osmiridium-plate", amount = 10},
		  {type = "item", name = "iron-gear-wheel", amount = 20},
		  {type = "item", name = "computing-core", amount = 5},
		  {type = "fluid", name = "lubricant", amount = 100}
		},
		results = {{type="item", name="turbo-splitter", amount=1}}
	},
})
