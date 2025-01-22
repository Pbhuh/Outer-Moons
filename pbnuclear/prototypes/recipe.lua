data:extend(
{
  --{
  --  type = "recipe",
  --  name = "uranium-sludge-from-uranium",
  --  icon = "__pbnuclear__/graphics/icons/fluid/uranium-sludge.png",
  --  category = "chemistry",
	--subgroup = "uranium-processes",
	--order = "x[uranium]-a[uranium-sludge]",
  --  auto_recycle = false,
  --  energy_required = 3,
  --  --enabled = false,
  --  ingredients =
  --  {
  --    {type = "item", name = "uranium-ore", amount = 1},
  --    {type = "fluid", name="sulfuric-acid", amount = 1}
  --  },
  --  results =
  --  {
  --    {type = "fluid", name="uranium-sludge", amount = 1}
  --  },
  --  allow_productivity = true,
  --  crafting_machine_tint =
  --  {
  --    primary = {r = 0.49, g = 1, b = 0, a = 1.000},
  --    secondary = {r = 0.9, g = 1, b = 0, a = 1.000},
  --  }
  --},
  --{
  --  type = "recipe",
  --  name = "yellowcake-from-uranium-sludge",
  --  icon = "__pbnuclear__/graphics/icons/yellowcake-U3O8.png",
  --  category = "crafting-with-fluid",
	--enabled = false,
	--energy_required = 10,
	--auto_recycle = false,
	--ingredients =
	--{
	--  {type = "fluid", name = "uranium-sludge", amount = 1}
	--},
	--results = {{type="item", name="yellowcake", amount=1}},
	--allow_productivity = true,
  --  crafting_machine_tint =
  --  {
  --    primary = {r = 0.9, g = 1, b = 0, a = 1.000},
  --    secondary = {r = 0.9, g = 1, b = 0, a = 1.000},
  --  }
  --},
  {
    type = "recipe",
    name = "uranium-tetrachloride",
    icon = "__pbnuclear__/graphics/icons/uranium-tetrachloride.png",
    category = "crafting-with-fluid",
	--enabled = false,
	energy_required = 10,
	auto_recycle = false,
	ingredients =
	{
	  {type = "fluid", name = "chlorine", amount = 4},
	  {type = "item", name = "uranium-ore", amount = 1}
	},
	results = {{type="item", name="uranium-tetrachloride", amount=1}},
	allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 0.9, g = 1, b = 0, a = 1.000},
      secondary = {r = 0.9, g = 1, b = 0, a = 1.000},
    }
  },
  {
    type = "recipe",
    name = "uranium-hexafluoride-diffusion",
    energy_required = 12,
    enabled = false,
    --category = "centrifuging",
    category = "cryogenics",
    ingredients = {{type = "fluid", name = "uranium-hexafluoride", amount = 10}},
    icon = "__pbnuclear__/graphics/icons/fluid/uranium-235-hexafluoride.png",
    subgroup = "uranium-processing",
    order = "a[uranium-processing]-a[uranium-processing]",
    results =
    {
      {
        type = "fluid",
        name = "uranium-235-hexafluoride",
        probability = 0.007,
        amount = 1
      },
      {
        type = "fluid",
        name = "uranium-238-hexafluoride",
        probability = 0.993,
        amount = 1
      }
    },
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "uranium-hexafluoride-diffusion-abstracted",
    energy_required = 22,
    enabled = false,
    --category = "centrifuging",
    category = "cryogenics",
    ingredients = 
    {
      {type = "item", name = "uranium-ore", amount = 10},
      {type = "fluid", name = "hydrofluoric-acid", amount =60},
    },
    icon = "__pbnuclear__/graphics/icons/fluid/uranium-235-hexafluoride.png",
    subgroup = "uranium-processing",
    order = "a[uranium-processing]-a[uranium-processing]",
    results =
    {
      {
        type = "item",
        name = "uranium-235",
        probability = 0.007,
        amount = 10
      },
      {
        type = "fluid",
        name = "uranium-238-hexafluoride",
        probability = 0.993,
        amount = 10
      }
    },
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "uranium-tetrafluoride",
    icon = "__pbnuclear__/graphics/icons/uranium-tetrafluoride.png",
    category = "chemistry",	
	subgroup = "uranium-processing",
	order = "a[uranium-processing]-b[uranium-tetrafluoride]",
	--enabled = false,
	energy_required = 10,
	auto_recycle = false,
	ingredients =
    {
      {type = "item", name = "uranium-ore", amount = 1}, --just using UO2 as it's chemical comp.
      {type = "fluid", name = "hydrofluoric-acid", amount =4},
    },
    energy_required = 5,
    results =
    {
      {type = "item", name = "uranium-tetrafluoride", amount = 1},
      {type = "fluid", name = "water", amount = 2}
    },
	allow_productivity = true,
    main_product = "uranium-tetrafluoride",
    crafting_machine_tint =
    {
      primary = {r = 0.9, g = 1, b = 0, a = 1.000},
      secondary = {r = 0.9, g = 1, b = 0, a = 1.000},
    }
  },
  {
    type = "recipe",
    name = "hydrofluoric-acid",
    icon = "__pbnuclear__/graphics/icons/fluid/hydrofluoric-acid.png",
    category = "chemistry-or-cryogenics",
    subgroup = "fluid-recipes",
    order = "d[other-chemistry]-a[acid-neutralisation]",
    auto_recycle = false,
    --enabled = false,
    ingredients =
    {
      {type = "fluid", name = "hydrogen", amount =1},
      {type = "fluid", name = "fluorine", amount =1}
    },
    energy_required = 5,
    results =
    {
      {type = "fluid", name = "hydrofluoric-acid", amount = 2}
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
  {
    type = "recipe",
    name = "uranium-hexafluoride",
    icon = "__pbnuclear__/graphics/icons/fluid/uranium-hexafluoride.png",
    category = "chemistry-or-cryogenics",
    subgroup = "fluid-recipes",
    order = "d[other-chemistry]-a[acid-neutralisation]",
    auto_recycle = false,
    --enabled = false,
    ingredients =
    {
      {type = "item", name = "uranium-tetrafluoride", amount = 1},
      {type = "fluid", name = "fluorine", amount = 1},
    },
    energy_required = 5,
    results =
    {
      {type = "fluid", name = "uranium-hexafluoride", amount = 1}
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
  {
    type = "recipe",
    name = "deuterium-enrichment",
    icon = "__pbnuclear__/graphics/icons/fluid/deuterium-atom-large.png",
    category = "chemistry-or-cryogenics",
    subgroup = "fluid-recipes",
    order = "d[other-chemistry]-a[acid-neutralisation]",
    auto_recycle = false,
    --enabled = false,
    ingredients =
    {
		  {type = "fluid", name = "water", amount = 10},
		  {type = "fluid", name = "sulfane", amount = 10},
    },
    energy_required = 1,
    results =
    {
		{type="fluid", name="deuterium", amount=1, probability=0.00156},
		{type = "fluid", name = "sulfane", amount = 10},
		{type = "fluid", name = "water", amount = 10}
    },
    allow_productivity = false,
    main_product = "deuterium",
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
  --{
  --  type = "recipe",
  --  name = "uranium-tetrachloride-seperation",
  --  energy_required = 172,
  --  enabled = false,
  --  category = "centrifuging",
  --  ingredients = {{type = "item", name = "uranium-tetrachloride", amount = 143}},
  --  icon = "__base__/graphics/icons/uranium-processing.png",
  --  subgroup = "uranium-processing",
  --  order = "a[uranium-processing]-a[uranium-processing]",
  --  results =
  --  {
  --    {
  --      type = "item",
  --      name = "low-enriched-uranium",
  --      amount = 1
  --    },
  --    {
  --      type = "item",
  --      name = "uranium-238",
  --      amount = 142
  --    }
  --  },
  --  allow_productivity = true
  --},
  {
    type = "recipe",
    name = "uranium-processing",
    energy_required = 12,
    enabled = false,
    category = "centrifuging",
    ingredients = {{type = "item", name = "uranium-tetrachloride", amount = 10}},
    icon = "__base__/graphics/icons/uranium-processing.png",
    subgroup = "uranium-processing",
    order = "a[uranium-processing]-a[uranium-processing]",
    results =
	{
	  {
		type = "item",
		name = "uranium-235",
		probability = 0.007,
		amount = 1
	  },
	  {
		type = "item",
		name = "uranium-238",
		probability = 0.993,
		amount = 1
	  }
	},
    allow_productivity = true
  },
  {
    type = "recipe",
	name = "nuclear-fuel-reprocessing",
    energy_required = 12,
    enabled = false,
    category = "centrifuging",
	ingredients = {
		{type = "item", name = "depleted-uranium-fuel-cell", amount = 1},
		{type = "fluid", name = "nitric-acid", amount = 10}
	},
	icon = "__base__/graphics/icons/nuclear-fuel-reprocessing.png",
	subgroup = "uranium-processing",
	order = "b[uranium-products]-b[nuclear-fuel-reprocessing]",
	main_product = "",
    results = 
	{
		{
			type="item", name="uranium-238", amount=2
		},
		{
			type="item", name="plutonium-239", amount=1, probability = 0.011
		},
	},
    allow_decomposition = false,
    allow_productivity = true
  },
  {
    type = "recipe",
	name = "MOX-fuel-reprocessing",
    energy_required = 12,
    enabled = false,
    category = "centrifuging",
	ingredients = {
		{type = "item", name = "depleted-MOX-fuel-cell", amount = 7},
		{type = "fluid", name = "nitric-acid", amount = 10}
	},
	icon = "__pbnuclear__/graphics/icons/mox-fuel-reprocessing.png",
	subgroup = "uranium-processing",
	order = "b[uranium-products]-b[nuclear-fuel-reprocessing]",
	main_product = "",
    results = 
	{
		{
			type="item", name="uranium-238", amount=13
		},
		{
			type="item", name="plutonium-239", amount=1
		},
		{
			type="item", name="plutonium-239", amount=1, probability = 0.077
		},
	},
    allow_decomposition = false,
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "MOX-fuel-cell",
    energy_required = 7,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 7},
      {type = "item", name = "plutonium-239", amount = 1},
      {type = "item", name = "uranium-238", amount = 13}
    },
    results = {{type="item", name="MOX-fuel-cell", amount=7}},
    subgroup = "uranium-processing",
    allow_productivity = true
  },
  --{
  --  type = "recipe",
  --  name = "weapon-grade-enrichment",
  --  energy_required = 12,
  --  enabled = false,
  --  category = "centrifuging",
  --  ingredients = {{type = "item", name = "low-enriched-uranium", amount = 16}}, --20 for 100% enrichment
  --  icon = "__base__/graphics/icons/uranium-processing.png",
  --  subgroup = "uranium-processing",
  --  order = "a[uranium-processing]-a[uranium-processing]",
  --  results =
  --  {
  --    {
  --      type = "item",
  --      name = "weapon-grade-uranium",
  --      amount = 1
  --    },
  --    {
  --      type = "item",
  --      name = "uranium-238",
  --      amount = 15 --19 for 100% 235
  --    }
  --  },
  --  allow_productivity = true
  --},
	  {
		type = "recipe",
		name = "plutonium-implosion-bomb",
		enabled = false,
		energy_required = 50,
		ingredients =
		{
		  {type = "item", name = "processing-unit", amount = 10},
		  {type = "item", name = "explosives", amount = 20},
		  --{type = "item", name = "battery", amount = 10},
		  {type = "item", name = "plutonium-239", amount = 10}
		},
		results = {{type="item", name="plutonium-implosion-bomb", amount=1}}
	  },
	  {
		type = "recipe",
		name = "plutonium-atom-bomb",
		icon = "__pbnuclear__/graphics/icons/plutonium-implosion-bomb.png",
		subgroup = "ammo",
		order = "d[rocket-launcher]-d[atomic-bomb]",
		enabled = false,
		energy_required = 50,
		ingredients =
		{
		  {type = "item", name = "processing-unit", amount = 10},
		  {type = "item", name = "explosives", amount = 20},
		  --{type = "item", name = "battery", amount = 10},
		  {type = "item", name = "plutonium-239", amount = 10}
		},
		results = {{type="item", name="atomic-bomb", amount=1}}
	  },
	  {
		type = "recipe",
		name = "uranium-decay",
		icon = "__pbnuclear__/graphics/icons/u238-decay-3.png",
		subgroup = "fluid-recipes",
		category = "crafting-with-fluid",
		auto_recycle = false,
		enabled = false,
		ingredients = {
			{type = "item", name = "uranium-238", amount = 1000}
		},
		energy_required = 100,
		results = {
			{type = "fluid", name = "helium", amount = 1, probability = 0.0022},
			{type = "item", name = "uranium-238", amount = 1, probability = 0.9978},
			{type = "item", name = "uranium-238", amount = 999}
		},
		allow_productivity = true,
		allow_decomposition = false,
		crafting_machine_tint =
		{
		  primary = {r = 0.433, g = 0.773, b = 1.000, a = 1.000}, -- #6ec5ffff
		  secondary = {r = 0.591, g = 0.856, b = 1.000, a = 1.000}, -- #96daffff
		  tertiary = {r = 0.381, g = 0.428, b = 0.436, a = 0.502}, -- #616d6f80
		  quaternary = {r = 0.499, g = 0.797, b = 0.793, a = 0.733}, -- #7fcbcabb
		},
		show_amount_in_title = false
	},
	{
		type = "recipe",
		name = "deuterium-venting",
		icon = "__pbnuclear__/graphics/icons/fluid/deuterium-atom-large.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "deuterium", amount = 10}
		},
		crafting_machine_tint =
		{
		  primary = {r = 1, g = 1, b = 1, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "tritium-venting",
		icon = "__pbnuclear__/graphics/icons/fluid/tritium-atom-large.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "tritium", amount = 10}
		},
		crafting_machine_tint =
		{
		  primary = {r = 1, g = 1, b = 1, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "hydrofluoric-acid-venting",
		icon = "__pbnuclear__/graphics/icons/fluid/hydrofluoric-acid.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "hydrofluoric-acid", amount = 10}
		},
		crafting_machine_tint =
		{
		  primary = {r = 0.484, g = 0.241, b = 0.731, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "helium-3-venting",
		icon = "__pbnuclear__/graphics/icons/fluid/helium-atom-large.png",
		energy_required = 1,
		enabled = true,
		hidden_in_factoriopedia = true,
		category = "venting",
		subgroup = "fluid-recipes",
		order = "a",
		ingredients =
		{
		  {type = "fluid", name = "helium-3", amount = 10}
		},
		crafting_machine_tint =
		{
		  primary = {r = 1, g = 1, b = 1, a = 1.000},
		  secondary = {r = 0.078, g = 0.552, b = 0.092, a = 1.000},
		}
	},
	{
		type = "recipe",
		name = "noble-gas-seperation",
		icon = "__pbnuclear__/graphics/icons/fluid/noble-gas-mixture.png",
		category = "chemistry-or-cryogenics",
		subgroup = "fluid-recipes",
		auto_recycle = false,
		energy_required = 5,
		ingredients = {{type = "fluid", name = "noble-gas-mixture", amount = 10}},
		results = {
			{type="fluid", name="argon", amount=10, probability=0.934},
			{type="fluid", name="neon", amount=1, probability=0.0182},
			{type="fluid", name="helium", amount=1, probability=0.00524},
			{type="fluid", name="krypton", amount=1, probability=0.00114},
			{type="fluid", name="xenon", amount=1, probability=0.0000899999},
		},
		allow_productivity = true,
		enabled = false
	},
	{
		type = "recipe",
		name = "fusion-power-cell",
		category = "cryogenics",
		subgroup = "aquilo-processes",
		order = "c[lithium]-d[fusion-power-cell]",
		auto_recycle = false,
		energy_required = 10,
		ingredients =
		{
		{type = "item", name = "lithium-plate", amount = 10},
		{type = "item", name = "holmium-plate", amount = 1}, --find replacement
		{type = "fluid", name = "deuterium", amount = 5}
		},
		results = {{type="item", name="fusion-power-cell", amount=1}},
		allow_productivity = true,
		enabled = false,
		crafting_machine_tint =
		{
		primary = {r = 0.054, g = 0.897, b = 1.000, a = 1.000}, -- #0de4ffff
		secondary = {r = 1.000, g = 0.779, b = 0.974, a = 1.000}, -- #ffc6f8ff
		tertiary = {r = 0.497, g = 0.655, b = 0.757, a = 1.000}, -- #7ea7c1ff
		quaternary = {r = 0.761, g = 0.312, b = 1.000, a = 1.000}, -- #c14fffff
		}
	},
	{
		type = "recipe",
		name = "seperate-gadolinite-ore", -- (Ce,La,Nd,Y)2FeBe2Si2O10
		icon = "__pbnuclear__/graphics/icons/gadolinite-ore.png",
		category = "crafting",
		auto_recycle = false,
		energy_required = 25,
		ingredients = {{type = "item", name = "gadolinite-ore", amount = 1}},
		results = {
			{type="item", name="scandium", amount=1, probability = 0.01},
			{type="item", name="yttrium", amount=2, probability = 0.25},
			{type="item", name="lanthanum", amount=2, probability = 0.25},
			{type="item", name="cerium", amount=2, probability = 0.25},
			{type="item", name="beryllium-ore", amount=2},
			{type="item", name="silicon-ore", amount=2},
			{type="item", name="iron-ore", amount=1},
			{type="item", name="praesodymium", amount=1, probability = 0.01},
			{type="item", name="neodymium", amount=2, probability = 0.25},
		},
		allow_productivity = true,
		enabled = false
	},
	{
		type = "recipe",
		name = "reprocess-slag",
		icon = "__pbnuclear__/graphics/icons/slag.png",
		category = "crafting",
		auto_recycle = false,
		energy_required = 25,
		ingredients = {{type = "item", name = "slag", amount = 30}},
		results = {
			{type="item", name="stone", amount=20},
			{type="item", name="silicon-ore", amount=10},
			{type="item", name="nickel-plate", amount=1, probability = 0.3},
			{type="item", name="zinc", amount=1, probability = 0.15},
			{type="item", name="manganese", amount=1, probability = 0.25},
		},
		allow_productivity = true,
		enabled = false
	},
	{
		type = "recipe",
		name = "pyromorphite-heating",
		icon = "__pbnuclear__/graphics/icons/pyromorphite-ore.png",
		category = "smelting",
		energy_required = 3.2,
		ingredients = {{type = "item", name = "pyromorphite-ore", amount = 1}},
		results = {
			{type="item", name="lead-plate", amount=5},
			{type="item", name="phosphate", amount=3}
			--{type="fluid", name="chlorine", amount=1}
		},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "alumina",
		icon = "__outer_moons__/graphics/icons/alumina.png",
		category = "chemistry-or-cryogenics",
		subgroup = "chemical",
		order = "c[alumina]",
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
		  {type = "item", name = "gallium-ore", amount = 1, probability = 0.1},
		  {type = "item", name = "vanadium", amount = 1, probability = 0.01},
		},
		allow_productivity = true,
		main_product = "alumina",
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
		name = "gold-cable",
		category = "electronics-or-assembling",
		enabled = false,
		icon = "__pbnuclear__/graphics/icons/gold-wire.png",
		ingredients = {{type = "item", name = "gold", amount = 1}},
		results = {{type="item", name="copper-cable", amount=3}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "silver-cable",		
		category = "electronics-or-assembling",
		enabled = false,
		icon = "__pbnuclear__/graphics/icons/silver-wire.png",
		ingredients = {{type = "item", name = "silver", amount = 1}},
		results = {{type="item", name="copper-cable", amount=4}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "bronze",
		enabled = false,
		icon = "__pbnuclear__/graphics/icons/bronze-d-plate.png",
		ingredients = {
			{type = "item", name = "copper-plate", amount = 8},
			{type = "item", name = "tin", amount = 1},
		},
		results = {{type="item", name="bronze", amount=9}},
		allow_productivity = true
	},
	{
		type = "recipe",
		name = "brass",
		enabled = false,
		icon = "__pbnuclear__/graphics/icons/brass-d-plate.png",
		ingredients = {
			{type = "item", name = "copper-plate", amount = 2},
			{type = "item", name = "zinc", amount = 1},
		},
		results = {{type="item", name="brass", amount=3}},
		allow_productivity = true
	},
})
