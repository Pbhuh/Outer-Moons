--[[
Objectives:
Fairly narrow channels of dark sand between regions that require elevated rail to not be uniformly stright.
Wide channels of sand between plateaus that are too far for big power poles.
Plateaus sizes that are big enough for a few train stops + ramps and either a mining outpost or a production line, but not much more.
Natural areas have more space but no resources.
Sparse city areas have wide low richness resource patches.
Vault islands have a small island with a moat so are difficult to build on, but have an extreme richness resource patch

chebyshev ◇ diamond, max(abs(x), abs(y))
manhattan □ square, abs(x) + abs(y)
euclidean ○ circle, (x^2 + y^2)^0.5
minkowski3  ▢ rounded square, (x^3 + y^3)^(1/3)

The starting island is a natural island. It can merge with a vault island, but to prevent a vault bridge to mainland,
the starting island also needs to have a moat.
The natural area of the starting island should override the vault content if the overlap too much.
]]

data:extend
{
  { -- The grid sze for the voronoi. As most other noise is scaled based on this it acts like terrain segmentation, but the value has a specific meaning.
    -- 200 is ideal. 180-ish is the minimim viable size.
    type = "noise-expression",
    name = "aiolos_grid",
    expression = "110 - slider_to_linear(control:aiolos_islands:frequency, -50, 50)",
  },
  { -- the starting area cone, slightly larger diameter than a grid cell.
    type = "noise-expression",
    name = "aiolos_starting_cone",
    expression = "max(0, starting_spot_at_angle{angle = map_seed / 360,\z
                                                distance = aiolos_grid / 30,\z
                                                radius = aiolos_grid / 1.8,\z
                                                x_distortion = 1 * aiolos_wobble_x,\z
                                                y_distortion = 1 * aiolos_wobble_y},\z
                         starting_spot_at_angle{angle = map_seed / 360,\z
                                                distance = 1,\z
                                                radius = aiolos_grid / 4,\z
                                                x_distortion = 0.25 * aiolos_wobble_x,\z
                                                y_distortion = 0.25 * aiolos_wobble_y})",
  },
  { -- the starting area cone, slightly larger diameter than a grid cell.
    type = "noise-expression",
    name = "aiolos_starting_vault_cone",
    expression = "max(0, starting_spot_at_angle{angle = map_seed / 360 + 180,\z
                                                distance = aiolos_grid / 1.8,\z
                                                radius = aiolos_grid / 1.8,\z
                                                x_distortion = 1 * aiolos_wobble_x,\z
                                                y_distortion = 1 * aiolos_wobble_y})",
  },
  {
    type = "noise-expression",
    name = "aiolos_starting_mask",
    expression = "(aiolos_starting_cone - aiolos_starting_vault_cone) > 0",
  },
  {
    type = "noise-expression",
    name = "aiolos_starting_vault_mask",
    expression = "(aiolos_starting_vault_cone - aiolos_starting_cone) > 0",
  },
  { -- Controls the X Y input wobble effect.
    type = "noise-expression",
    name = "aiolos_wobble_influence",
    expression = "multioctave_noise{x = x,\z
                                    y = y,\z
                                    persistence = 0.5,\z
                                    seed0 = map_seed,\z
                                    seed1 = 1,\z
                                    octaves = 3,\z
                                    input_scale = 128 / aiolos_grid / 20 ,\z
                                    output_scale = 3}",
  },
  { -- We usually want a lot of wobble or none at all, so influence has a high outpus scale and then we clamp it.
    type = "noise-expression",
    name = "aiolos_wobble_mask",
    expression = "clamp(aiolos_wobble_influence + 0.6, 0, 1)",
  },

  { -- generate X input distortion
    type = "noise-expression",
    name = "aiolos_wobble_x", -- only add to input X or Y
    expression = "multioctave_noise{x = x,\z
                                    y = y,\z
                                    persistence = 0.7,\z
                                    seed0 = map_seed,\z
                                    seed1 = 'aiolos_wobble_x',\z
                                    octaves = 4,\z
                                    input_scale = 5 / aiolos_grid,\z
                                    output_scale = aiolos_grid * 0.07}"
  },
  { -- generate y input distortion
    type = "noise-expression",
    name = "aiolos_wobble_y", -- only add to input X or Y
    expression = "multioctave_noise{x = x,\z
                                    y = y,\z
                                    persistence = 0.7,\z
                                    seed0 = map_seed,\z
                                    seed1 = 'aiolos_wobble_y',\z
                                    octaves = 4,\z
                                    input_scale = 5 / aiolos_grid,\z
                                    output_scale = aiolos_grid * 0.07}"
  },

  { -- offset grid so that the starting area is in the middle of a cell
    type = "noise-expression",
    name = "aiolos_ox",
    expression = "x + aiolos_grid / 4"
  },
  { -- offset grid so that the starting area is in the middle of a cell
    type = "noise-expression",
    name = "aiolos_oy",
    expression = "y + aiolos_grid / 4"
  },

  { -- distorted x. Also offset grid so that the starting area is in the middle of a cell
    type = "noise-expression",
    name = "aiolos_wx",
    expression = "aiolos_ox + aiolos_wobble_x * aiolos_wobble_mask"
  },
  { -- distorted y. Also offset grid so that the starting area is in the middle of a cell
    type = "noise-expression",
    name = "aiolos_wy",
    expression = "aiolos_oy + aiolos_wobble_y * aiolos_wobble_mask"
  },

  { -- The main basis noise for natural areas
    type = "noise-expression",
    name = "aiolos_basis",
    expression = "multioctave_noise{x = aiolos_wx,\z
                                    y = aiolos_wy,\z
                                    persistence = 0.5,\z
                                    seed0 = map_seed,\z
                                    seed1 = 'aiolos_basis',\z
                                    octaves = 6,\z
                                    input_scale = 128 / aiolos_grid / 7.5,\z
                                    output_scale = 0.5}",
  },
  { -- How much voronoi points are offset in their grid square.
    type = "noise-expression",
    name = "aiolos_jitter",
    expression = "0.1",
  },
  { -- Cell ids for the main voronoi islands
    type = "noise-expression",
    name = "aiolos_cells",
    expression = "voronoi_cell_id{x = aiolos_wx,\z
                                  y = aiolos_wy,\z
                                  seed0 = map_seed,\z
                                  seed1 = 'aiolos_cells',\z
                                  grid_size = aiolos_grid,\z
                                  distance_type = 'manhattan',\z
                                  jitter = aiolos_jitter}",
  },
  { -- Pyramids for the main voronoi islands
    type = "noise-expression",
    name = "aiolos_pyramids",
    expression = "voronoi_pyramid_noise{x = aiolos_wx,\z
                                        y = aiolos_wy,\z
                                        seed0 = map_seed,\z
                                        seed1 = 'aiolos_cells',\z
                                        grid_size = aiolos_grid,\z
                                        distance_type = 'manhattan',\z
                                        jitter = aiolos_jitter}",
  },
  { -- Spots for the main voronoi islands (vaults only). Spots are inverted cones
    type = "noise-expression",
    name = "aiolos_spots",
    expression = "voronoi_spot_noise{x = aiolos_ox + aiolos_wobble_x / 2,\z
                                     y = aiolos_oy + aiolos_wobble_y / 2,\z
                                     seed0 = map_seed,\z
                                     seed1 = 'aiolos_cells',\z
                                     grid_size = aiolos_grid,\z
                                     distance_type = 'euclidean',\z
                                     jitter = aiolos_jitter}",
  },
  { -- Spots for the main voronoi islands (vaults only). Spots are cones
    type = "noise-expression",
    name = "aiolos_spots_inv",
    expression = "1 - aiolos_spots",
  },
  { -- Cells that are blank and will become oil ocean
    type = "noise-expression",
    name = "aiolos_blanks",
    expression = "aiolos_cells < 0.55",
  },
  { -- Treat some islands as natural
    type = "noise-expression",
    name = "aiolos_mesa",
    expression = "aiolos_cells > 0.9",
  },
  { -- Cells that have vault islands with moats
    type = "noise-expression",
    name = "aiolos_vaults",
    expression = "1 - aiolos_blanks - aiolos_mesa",
  },
  { -- Cells that have vault islands with moats
    type = "noise-expression",
    name = "aiolos_vaults_and_starting_vault",
    expression = "max(aiolos_vaults, aiolos_starting_vault_mask)",
  },
 
  { -- Pyramids restricted to vault cells
    type = "noise-expression",
    name = "aiolos_vault_pyramids",
    expression = "max(aiolos_vaults * aiolos_pyramids, 0.5 * aiolos_starting_vault_cone)",
  },
  {
    type = "noise-expression",
    name = "aiolos_vault_pyramids_and_start",
    expression = "max(aiolos_vault_pyramids, 0.5 * aiolos_starting_cone)",
  },
  { -- The moats of vault cells. These take chunks out of other terrain. The depths is to ensure that there's some oil ocean in the oil sand.
    type = "noise-expression",
    name = "aiolos_moats",
    expression = "min(aiolos_artificial_cap, 2.5 * max(-0.05 -aiolos_vault_pyramids_and_start * 2, (aiolos_vault_pyramids_and_start - 0.35) * 2))",
  },
  { -- The upper limit of pyramids, making them plateaus instead.
    type = "noise-expression",
    name = "aiolos_artificial_cap",
    expression = "0.9",
  },
  { -- Cut vault moats out of the landscape
    type = "noise-expression",
    name = "aiolos_mix_moats",
    expression = "lerp(-1, aiolos_moats, max(aiolos_vaults_and_starting_vault, aiolos_starting_mask))",
  },
  { -- Make vault spots into small roundish plateaus with a consistent size for consistent resources.
    -- normal spot inverse is roughly 0.5 to 1, but the lower bound can be a bit less in corners.
    -- blending in the starting spot properly required a 0.5 bump.
    type = "noise-expression",
    name = "aiolos_vault_spots",
    expression = "min(aiolos_artificial_cap,\z
                      -10 + 11.5 * max(aiolos_vaults * aiolos_spots_inv,\z
                                       aiolos_starting_vault_mask * (0.5 + 0.5 * aiolos_starting_vault_cone),\z
                                       aiolos_starting_mask * (0.5 + 0.5 * aiolos_starting_cone)))",
  },
  { -- Apply vault spots to the landscape
    type = "noise-expression",
    name = "aiolos_mix_spots",
    expression = "max(aiolos_mix_moats, aiolos_vault_spots) + max(0, aiolos_starting_cone - 0.8)",
  },
  { -- A mask for low oil areas, i.e. oil sand and oil ocean. Later sand basins will be also be below 0 (to have inner cliffs), but will not be in the oil mask
    type = "noise-expression",
    name = "aiolos_oil_mask",
    expression = "aiolos_mix_spots < 0",
  },
  { -- Noise to break up the oil areas. This gets heavily distorted.
    type = "noise-expression",
    name = "aiolos_basis_oil",
    expression = "multioctave_noise{x = x + 1.5 * aiolos_wobble_x,\z
                                    y = y + 1.5 * aiolos_wobble_y,\z
                                    persistence = 0.65,\z
                                    seed0 = map_seed,\z
                                    seed1 = 'aiolos_basis_oil',\z
                                    octaves = 4,\z
                                    input_scale = 1 / 10}",
  },
  {  -- Apply oil noise to the oil mask areas, but make sure it doens't make oil areas positive
    type = "noise-expression",
    name = "aiolos_mix_oil",
    expression = "lerp(aiolos_mix_spots, min(-0.01, aiolos_mix_spots - 0.4 + 0.6 * aiolos_basis_oil), aiolos_oil_mask)",
  },
  { -- We want cliffs right on the coast edge but to do that we need to move the coastline elevation above 0
    type = "noise-expression",
    name = "aiolos_coastline",
    expression = 10,
  },
  { -- Make a large elevation change at the coast so that that the janky cliff smothing does mot mess up
    type = "noise-expression",
    name = "aiolos_coastline_drop",
    expression = 50,
  },
  { -- Invert the heightfield above a certain elevation so that natural inland sand areas form bowls with cliffs facing inwards instead of outwards.
    -- This does make inland areas negative elevation, so we will need to use the oil mask so that liquids don't go here.
    type = "noise-expression",
    name = "aiolos_sand_basins",
    expression = "min(aiolos_mix_oil, 0.6 - aiolos_mix_oil)",
  },
  { -- Make the initial elevation. The elevation rate should be such that the 2nd level of cliffs are where the inner sand basin cliffs are now.
    type = "noise-expression",
    name = "aiolos_pre_elevation",
    expression = "aiolos_sand_basins * 60 + aiolos_coastline"
  },
  { -- Make the final elevation by applying the coastal cliff drop
    type = "noise-expression",
    name = "aiolos_elevation",
    --intended_property = "elevation",
    expression = "aiolos_pre_elevation + ((aiolos_sand_basins > 0) - 0.5) * aiolos_coastline_drop"
  }
} -- End elevation

--[[
  Scrap and machinery tiles share a tech pattern.
  walls and paving can be more wide spread, even appearing on the natural island is small areas.
  Rock is mainly on island edges
  Dust is mainly as deserts in the middle of natural islands.
  Dunes and flat sand are the default and have their own mix.
]]
data:extend
{
  { -- Make the final elevation by applying the coastal cliff drop
    type = "noise-expression",
    name = "aiolos_cliffiness",
    --intended_property = "cliffiness",
    expression = "10 * slider_rescale(cliff_richness, 20)\z
                  * (max(0, 1 - 10 * aiolos_wobble_mask))\z
                  - 1000 * safe_start_excluder_h",
    local_expressions =
    {
      safe_start_excluder_h = "min(x_from_start < aiolos_grid, x_from_start > -aiolos_grid, y_from_start < 5, y_from_start > -5)"
    }
  },
  { -- Banding the main pyramids for road pattern B
    type = "noise-expression",
    name = "aiolos_pyramids_banding",
    expression = "(aiolos_pyramids * 8) % 1"
  },
  { -- The multiplier for road pattern C. Needed for the road pattern but also the district center cutout.
    type = "noise-expression",
    name = "aiolos_spots_prebanding",
    expression = "min(aiolos_spots, (1 - aiolos_starting_vault_cone) / 2) * 9 + 0.5"
  },
  { -- Banding the main spots for road pattern C
    type = "noise-expression",
    name = "aiolos_spots_banding",
    expression = "aiolos_spots_prebanding % 1"
  },
  {
    type = "noise-expression",
    name = "aiolos_structure_jitter",
    expression = 0.8
  },
  { -- Cells for the smallest scale voronoi for individual structure blocks.
    type = "noise-expression",
    name = "aiolos_structure_cells",
    expression = "voronoi_cell_id{x = x,\z
                                  y = y * 0.8,\z
                                  seed0 = map_seed,\z
                                  seed1 = 'aiolos_structure_cells',\z
                                  grid_size = aiolos_grid / 8,\z
                                  distance_type = 'minkowski3',\z
                                  jitter = aiolos_structure_jitter}",
  },
  {
    type = "noise-expression",
    name = "aiolos_structure_subnoise",
    expression = "multioctave_noise{x = x + 10000 * aiolos_structure_cells,\z
                                    y = y,\z
                                    persistence = 0.7,\z
                                    seed0 = map_seed,\z
                                    seed1 = 'aiolos_structure_subnoise',\z
                                    octaves = 3,\z
                                    input_scale = 1/12}"
  },
  { -- Facets for the smallest scale voronoi for individual structure blocks. This is mainly for the small road pattern A.
    type = "noise-expression",
    name = "aiolos_structure_facets",
    expression = "voronoi_facet_noise{x = x,\z
                                      y = y * 0.8,\z
                                      seed0 = map_seed,\z
                                      seed1 = 'aiolos_structure_cells',\z
                                      grid_size = aiolos_grid / 8,\z
                                      distance_type = 'minkowski3',\z
                                      jitter = aiolos_structure_jitter}",
  },
  { -- Dunes ridge noise.
    type = "noise-expression",
    name = "aiolos_dunes",
    expression = "0.66 - abs(multioctave_noise{x = x,\z
                                               y = y,\z
                                               persistence = 0.7,\z
                                               seed0 = map_seed,\z
                                               seed1 = 'aiolos_dunes',\z
                                               octaves = 3,\z
                                               input_scale = 1/6 })"
  },
  { -- Rock billows noise.
    type = "noise-expression",
    name = "aiolos_rock",
    expression = "0.33 + abs(multioctave_noise{x = x,\z
                                               y = y,\z
                                               persistence = 0.7,\z
                                               seed0 = map_seed,\z
                                               seed1 = 'aiolos_rock',\z
                                               octaves = 4,\z
                                               input_scale = 1/3 })"
  },
}

-- 
data.raw.resource["beryllium-ore"].autoplace =
{
  control = "beryllium_ore",
  order = "b",
  probability_expression = "(control:beryllium_ore:size > 0)\z
                            * (1 - aiolos_starting_mask)\z
                            * (min((aiolos_structure_cells < min(0.1 * frequency, 0.05 + 0.05 * frequency))\z
                               + (aiolos_spots_prebanding < 1.5) * aiolos_vaults_and_starting_vault * 10,\z
                               0.5) * 0.75)",
  richness_expression = "(1 + aiolos_structure_subnoise) * 11 * ((6 + frequency) + 100 * aiolos_vaults_and_starting_vault) * richness",
  local_expressions =
  {
    abs_mult_height_over = "aiolos_elevation > (aiolos_coastline + 5)", -- Resources prevent cliffs from spawning. This gets resources away from cliffs.
    frequency = "control:beryllium_ore:frequency", -- limited application
    size = "control:beryllium_ore:size", -- Size also affects noise peak height so impacts richness as a sideeffect...
    richness = "control:beryllium_ore:richness"
  }
}
