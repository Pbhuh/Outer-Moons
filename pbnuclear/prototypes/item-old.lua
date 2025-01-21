local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

data:extend(
{
  {
    type = "tool",
    name = "nuclear-science-pack",
    localised_description = {"item-description.science-pack"},
    icon = "__pbnuclear__/graphics/icons/nuclear-science-pack.png",
    subgroup = "science-pack",
    color_hint = { text = "M" },
    order = "m",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 200,
    weight = 1*kg,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    random_tint_color = item_tints.bluish_science
  },
  {
    type = "item",
    name = "yellowcake",
    icon = "__pbnuclear__/graphics/icons/yellowcake.png",
    subgroup = "uranium-processing",
    color_hint = { text = "+" },
    order = "a[uranium-processing]-a[yellowcake]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 100,
    random_tint_color = item_tints.iron_rust,
    weight = 5*kg
  },
  {
    type = "item",
    name = "uranium-tetrachloride",
    icon = "__pbnuclear__/graphics/icons/uranium-tetrachloride.png",
    subgroup = "uranium-processing",
    color_hint = { text = "+" },
    order = "a[uranium-processing]-b[uranium-tetrachloride]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 100,
    random_tint_color = item_tints.iron_rust,
    weight = 5*kg
  },
  {
    type = "item",
    name = "plutonium-239",
    icon = "__pbnuclear__/graphics/icons/pu-239.png",
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__pbnuclear__/graphics/icons/pu-239.png",
          scale = 0.5,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          blend_mode = "additive",
          size = 64,
          filename = "__pbnuclear__/graphics/icons/pu-239-glow.png",
          scale = 0.5,
          tint = {0.3, 0.3, 0.3, 0.3}
        }
      }
    },
    subgroup = "uranium-processing",
    color_hint = { text = "+" },
    order = "a[uranium-processing]-g[plutonium-239]",
    inventory_move_sound = item_sounds.nuclear_inventory_move,
    pick_sound = item_sounds.nuclear_inventory_pickup,
    drop_sound = item_sounds.nuclear_inventory_move,
    stack_size = 100,
    weight = 50*kg
  },
  {
    type = "item",
    name = "low-enriched-uranium",
    icon = "__pbnuclear__/graphics/icons/low-enriched-uranium.png",
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__pbnuclear__/graphics/icons/low-enriched-uranium.png",
          scale = 0.5,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          blend_mode = "additive",
          size = 64,
          filename = "__pbnuclear__/graphics/icons/low-enriched-uranium.png",
          scale = 0.5,
          tint = {0.3, 0.3, 0.3, 0.3}
        }
      }
    },
    subgroup = "uranium-processing",
    color_hint = { text = "+" },
    order = "a[uranium-processing]-d[low-enriched-uranium]",
    inventory_move_sound = item_sounds.nuclear_inventory_move,
    pick_sound = item_sounds.nuclear_inventory_pickup,
    drop_sound = item_sounds.nuclear_inventory_move,
    stack_size = 100,
    weight = 50*kg
  },
  {
    type = "item",
    name = "weapon-grade-uranium",
    icon = "__pbnuclear__/graphics/icons/weapon-grade-uranium.png",
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__pbnuclear__/graphics/icons/weapon-grade-uranium.png",
          scale = 0.5,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          blend_mode = "additive",
          size = 64,
          filename = "__base__/graphics/icons/uranium-235.png",
          scale = 0.5,
          tint = {0.3, 0.3, 0.3, 0.3}
        }
      }
    },
    subgroup = "uranium-processing",
    color_hint = { text = "+" },
    order = "a[uranium-processing]-e[weapon-grade-uranium]",
    inventory_move_sound = item_sounds.nuclear_inventory_move,
    pick_sound = item_sounds.nuclear_inventory_pickup,
    drop_sound = item_sounds.nuclear_inventory_move,
    stack_size = 100,
    weight = 50*kg
  },
  --{
  --  type = "item",
  --  name = "mixed-oxide-fuel-cell",
  --  icon = "__pbnuclear__/graphics/icons/mox-fuel-cell.png",
  --  pictures =
  --  {
  --    layers =
  --    {
  --      {
  --        size = 64,
  --        filename = "__pbnuclear__/graphics/icons/mox-fuel-cell.png",
  --        scale = 0.5,
  --        mipmap_count = 4
  --      },
  --      {
  --        draw_as_light = true,
  --        size = 64,
  --        filename = "__base__/graphics/icons/uranium-fuel-cell-light.png",
  --        scale = 0.5
  --      }
  --    }
  --  },
  --  subgroup = "uranium-processing",
  --  order = "b[uranium-products]-c[mixed-oxide-fuel-cell]",
  --  inventory_move_sound = item_sounds.nuclear_inventory_move,
  --  pick_sound = item_sounds.nuclear_inventory_pickup,
  --  drop_sound = item_sounds.nuclear_inventory_move,
  --  fuel_category = "nuclear",
  --  burnt_result = "spent-mixed-oxide-fuel-cell",
  --  fuel_value = "8GJ",
  --  stack_size = 50,
  --  weight = 100*kg
  --},
  --{
  --  type = "item",
  --  name = "spent-mixed-oxide-fuel-cell",
  --  icon = "__pbnuclear__/graphics/icons/spent-mox-fuel-cell.png",
  --  subgroup = "uranium-processing",
  --  order = "b[uranium-products]-d[spent-mox-fuel-cell]",
  --  inventory_move_sound = item_sounds.nuclear_inventory_move,
  --  pick_sound = item_sounds.nuclear_inventory_pickup,
  --  drop_sound = item_sounds.nuclear_inventory_move,
  --  stack_size = 50,
  --  weight = 100*kg
  --},
  {
    type = "ammo",
    name = "plutonium-implosion-bomb",
    icon = "__pbnuclear__/graphics/icons/plutonium-implosion-bomb.png",
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__pbnuclear__/graphics/icons/plutonium-implosion-bomb.png",
          scale = 0.5,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          size = 64,
          filename = "__pbnuclear__/graphics/icons/plutonium-implosion-bomb-light.png",
          scale = 0.5
        }
      }
    },
    ammo_category = "rocket",
    ammo_type =
    {
      range_modifier = 1.5,
      cooldown_modifier = 10,
      target_type = "position",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "atomic-rocket", --plutonium-rocket
          starting_speed = 0.05,
          source_effects =
          {
            type = "create-entity",
            entity_name = "explosion-hit"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[rocket-launcher]-d[atomic-bomb]",
    inventory_move_sound = item_sounds.atomic_bomb_inventory_move,
    pick_sound = item_sounds.atomic_bomb_inventory_pickup,
    drop_sound = item_sounds.atomic_bomb_inventory_move,
    stack_size = 10,
    weight = 1.5 * tons
  },
  --{
  --  type = "item",
  --  name = "fracking-tower",
  --  icon = "__base__/graphics/icons/pump.png",
  --  subgroup = "energy-pipe-distribution",
  --  order = "b[pipe]-c[pump]",
  --  inventory_move_sound = item_sounds.fluid_inventory_move,
  --  pick_sound = item_sounds.fluid_inventory_pickup,
  --  drop_sound = item_sounds.fluid_inventory_move,
  --  place_result = "pump",
  --  stack_size = 50,
  --  random_tint_color = item_tints.iron_rust
  --},
})

--data.raw["recipe"]["productivity-module-3"].ingredients = 
--{
--  {type = "item", name = "productivity-module-2", amount = 4},
--  {type = "item", name = "advanced-circuit", amount = 5},
--  {type = "item", name = "processing-unit", amount = 5},
--  {type = "item", name = "uranium-fuel-cell", amount = 5}
--}
--data.raw["recipe"]["productivity-module-3"].enabled = true