data:extend(
{
  {
    type = "technology",
    name = "rocket-silo",
    icon = "__base__/graphics/technology/rocket-silo.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "rocket-silo"
      },
      {
        type = "unlock-recipe",
        recipe = "rocket-part"
      },
	  {
        type = "unlock-recipe",
        recipe = "rocket-part-new"
      },
      {
        type = "unlock-recipe",
        recipe = "cargo-landing-pad"
      },
      {
        type = "unlock-recipe",
        recipe = "satellite"
      }
    },
    prerequisites =
    {
      "concrete",
      "rocket-fuel",
      "electric-energy-accumulators",
      "solar-energy",
      "utility-science-pack",
      "speed-module-3",
      "productivity-module-3",
      "radar"
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
        {"utility-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "space-platform-thruster",
    icon = "__space-age__/graphics/technology/space-platform-thruster.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thruster"
      },
      {
        type = "unlock-recipe",
        recipe = "ice-melting"
      },
      {
        type = "unlock-recipe",
        recipe = "thruster-fuel"
      },
      {
        type = "unlock-recipe",
        recipe = "thruster-oxidizer"
      },
    },
    prerequisites = {"space-science-pack"},
    unit =
    {
      count = 500,
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
    name = "planet-discovery-vulcanus",
    icons = util.technology_icon_constant_planet("__space-age__/graphics/technology/vulcanus.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "vulcanus",
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
    name = "rocket-turret",
    icon = "__space-age__/graphics/technology/rocket-turret.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "rocket-turret"
      },
      {
        type = "unlock-recipe",
        recipe = "coal-synthesis"
      }
    },
    prerequisites = {"rocketry", "carbon-fiber", "stronger-explosives-2"},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1}
      },
      time = 30,
      count = 1000
    }
  },
  {
    type = "technology",
    name = "calcite-processing",
    icon = "__space-age__/graphics/technology/calcite-processing.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "acid-neutralisation"
      },
      {
        type = "unlock-recipe",
        recipe = "steam-condensation"
      },
      {
        type = "unlock-recipe",
        recipe = "simple-coal-liquefaction"
      },
    },
    prerequisites = {"planet-discovery-vulcanus"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "calcite"
    }
  },
}
)
