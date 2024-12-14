data:extend(
{
  {
    type = "technology",
    name = "planet-discovery-selene",
    icons = util.technology_icon_constant_planet("__outer_moons__/graphics/technology/selene.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "selene",
        use_icon_overlay_constant = true
      }
    },
    prerequisites = {"space-platform-thruster"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    }
  },
  
  {
    type = "technology",
    name = "chloralkali-processing",
    icon = "__outer_moons__/graphics/technology/chloralkali-process.png",
    icon_size = 256,
    essential = true,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "chloralkali-process"
      },
	  {
        type = "unlock-recipe",
        recipe = "water-electrolysis"
      },
    },
    prerequisites = {"planet-discovery-selene"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "saline-geyser"
    }
  },
  {
    type = "technology",
    name = "bauxite-processing",
    icon = "__outer_moons__/graphics/technology/alumina-production.png",
    icon_size = 256,
    essential = true,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "gibbsite-extraction"
      },
      {
        type = "unlock-recipe",
        recipe = "alumina-crystallization"
      },
	  {
        type = "unlock-recipe",
        recipe = "red-mud-reprocessing"
      },
    },
    prerequisites = {"chloralkali-processing"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "aluminum-ore"
    }
  },
  {
    type = "technology",
    name = "titanium-plate",
    icon = "__outer_moons__/graphics/technology/titanium-plate.png",
    icon_size = 256,
    essential = true,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "titanium-plate"
      },
    },
    prerequisites = {"chloralkali-processing",},
    research_trigger =
    {
      type = "mine-entity",
      entity = "titanium-ore"
    }
  },
  {
    type = "technology",
    name = "convector",
    icon = "__outer_moons__/graphics/technology/convector.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "convector"
      },
	  {
        type = "unlock-recipe",
        recipe = "amalgamate-regolith"
      },
	  {
        type = "unlock-recipe",
        recipe = "aluminum-plate"
      },
    },
    prerequisites = {"bauxite-processing"},
    research_trigger =
    {
      type = "craft-item",
      item = "alumina"
    }
  },
  {
    type = "technology",
    name = "arc-furnace",
    icon = "__outer_moons__/graphics/technology/arc-furnace.png",
    icon_size = 256,
    essential = true,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "arc-furnace"
      },
	  {
        type = "unlock-recipe",
        recipe = "titanium-plate"
      },
    },
    prerequisites = {"convector"},
    research_trigger =
    {
      type = "craft-item",
      item = "aluminum-plate"
    }
  },
  {
    type = "technology",
    name = "adv-assembler",
    icon = "__outer_moons__/graphics/technology/adv-assembler.png",
    icon_size = 256,
    essential = true,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "adv-assembling-machine"
      },
    },
    prerequisites = {"arc-furnace", "titanium-plate"},
    research_trigger =
    {
      type = "craft-item",
      item = "titanium-plate"
    }
  },
  {
    type = "technology",
    name = "olefins-synthesis",
    icon = "__outer_moons__/graphics/technology/chloralkali-process.png",
    icon_size = 256,
    essential = true,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "chloralkali-process"
      },
    },
    prerequisites = {"planet-discovery-selene"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "big-selene-rock"
    }
  },
  {
    type = "technology",
    name = "olefins-synthesis",
    icon = "__outer_moons__/graphics/technology/olefins-synthesis.png",
    icon_size = 256,
    essential = true,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "olefins-synthesis"
      },
	  {
        type = "unlock-recipe",
        recipe = "polyethlyene"
      },	  
    },
    prerequisites = {"chloralkali-processing"},
    research_trigger =
    {
      type = "craft-fluid",
      fluid = "oxygen"
    }
  },
  {
    type = "technology",
    name = "liquid-oxygen-fuel",
    icon = "__outer_moons__/graphics/technology/liquid-ox-fuel.png",
    icon_size = 256,
    essential = true,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "solid-fuel-from-aluminum"
      },
	  {
        type = "unlock-recipe",
        recipe = "oxygen-rocket-fuel"
      },	  
    },
    prerequisites = {"olefins-synthesis", "convector"},
    research_trigger =
    {
      type = "craft-fluid",
      fluid = "olefins"
    }
  },
  
  {
    type = "technology",
    name = "lunar-science-pack",
    icon = "__outer_moons__/graphics/technology/lunar-science-pack.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "lunar-science-pack"
      },
    },
    prerequisites = {"adv-assembler"},
    research_trigger =
    {
      type = "craft-item",
      item = "adv-assembling-machine"
    }
  },
  
  {
    type = "technology",
    name = "planet-discovery-cronus",
    icons = util.technology_icon_constant_planet("__outer_moons__/graphics/technology/cronus.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "cronus",
        use_icon_overlay_constant = true
      }
    },
    prerequisites = {
		"rocket-turret", 
		"advanced-asteroid-processing", 
		"asteroid-reprocessing", 
		"metallurgic-science-pack",
		"agricultural-science-pack",
		"electromagnetic-science-pack"
	},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"lunar-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"electromagnetic-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "planet-discovery-mefitis",
    icons = util.technology_icon_constant_planet("__outer_moons__/graphics/technology/mefitis.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "mefitis",
        use_icon_overlay_constant = true
      }
    },
    prerequisites = {
		"planet-discovery-cronus"
	},
    unit =
    {
      count = 2000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"lunar-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"electromagnetic-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "planet-discovery-aiolos",
    icons = util.technology_icon_constant_planet("__outer_moons__/graphics/technology/aiolos.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "aiolos",
        use_icon_overlay_constant = true
      }
    },
    prerequisites = {
		"planet-discovery-cronus"
	},
    unit =
    {
      count = 2000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"lunar-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"electromagnetic-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "planet-discovery-feronia",
    icons = util.technology_icon_constant_planet("__outer_moons__/graphics/technology/feronia.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "feronia",
        use_icon_overlay_constant = true
      }
    },
    prerequisites = {
		"planet-discovery-cronus"
	},
    unit =
    {
      count = 2000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"lunar-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"electromagnetic-science-pack", 1}
      },
      time = 60
    }
  },
}
)
