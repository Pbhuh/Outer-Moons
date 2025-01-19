data:extend{
  ---- Constants
  {
    type = "noise-expression",
    name = "selene_ore_spacing",
    expression = 64
  },
  {
    type = "noise-expression",
    name = "selene_shared_influence",
    expression = 105 * 3
  },
  {
    type = "noise-expression",
    name = "selene_biome_contrast",
    expression = 2 -- higher values mean sharper transitions
  },
  {
    type = "noise-expression",
    name = "selene_cracks_scale",
    expression = 0.1
  },
  --used to be segmenataion_multiplier
  {
    type = "noise-expression",
    name = "selene_segment_scale",
    expression = 2
  },
  {
    --functions more like a cliffiness multiplier as all the crater tiles have it offset.
    type = "noise-expression",
    name = "selene_craters_elevation_multiplier",
    expression = 1.9
  },

  ---- HELPERS
  {
    type = "noise-expression",
    name = "selene_starting_area_multiplier",
    -- reduced richness for starting resources
    expression = "lerp(1, 0.06, clamp(0.5 + selene_starting_circle, 0, 1))"
  },
  {
    type = "noise-expression",
    name = "selene_richness_multiplier",
    expression = "6 + distance / 10000"
  },
  {
    type = "noise-expression",
    name = "selene_scale_multiplier",
    expression = "slider_rescale(control:selene_craters:frequency, 3)"
  },
  {
    type = "noise-function",
    name = "selene_detail_noise",
    parameters = {"seed1", "scale", "octaves", "magnitude"},
    expression = "multioctave_noise{x = x,\z
                                    y = y,\z
                                    seed0 = map_seed,\z
                                    seed1 = seed1 + 12243,\z
                                    octaves = octaves,\z
                                    persistence = 0.6,\z
                                    input_scale = 1 / 50 / scale,\z
                                    output_scale = magnitude}"
  },
  {
    type = "noise-function",
    name = "selene_plasma",
    parameters = {"seed", "scale", "scale2", "magnitude1", "magnitude2"},
    expression = "abs(basis_noise{x = x,\z
                                  y = y,\z
                                  seed0 = map_seed,\z
                                  seed1 = 12643,\z
                                  input_scale = 1 / 50 / scale,\z
                                  output_scale = magnitude1}\z
                      - basis_noise{x = x,\z
                                    y = y,\z
                                    seed0 = map_seed,\z
                                    seed1 = 13423 + seed,\z
                                    input_scale = 1 / 50 / scale2,\z
                                    output_scale = magnitude2})"
  },
  {
    type = "noise-function",
    name = "selene_threshold",
    parameters = {"value", "threshold"},
    expression = "(value - (1 - threshold)) * (1 / threshold)"
  },
  {
    type = "noise-function",
    name = "selene_contrast",
    parameters = {"value", "c"},
    expression = "clamp(value, c, 1) - c"
  },

  ---- ELEVATION
  {
    type = "noise-expression",
    name = "selene_elevation",
    --intended_property = "elevation",
    expression = "max(-500, selene_elev)"
  },
  ---- TEMPERATURE: Used to place hot vs cold tilesets, e.g. cold - warm - hot cracks.
  {
    type = "noise-expression",
    name = "selene_temperature",
    --intended_property = "temperature",
    expression = "100\z
                  + 100 * var('control:temperature:bias')\z
                  - min(selene_elev, selene_elev / 100)\z
                  - 2 * selene_moisture\z
                  - 1 * selene_aux\z
                  - 60 * selene_highlands_biome\z
                  + 150 * max(0, selene_crater_spots - 0.6)"
  },
  ---- AUX (0-1): On selene this is Rockiness.
  ---- 0 is flat and arranged as paths through rocks.
  ---- 1 are rocky "islands" for rock clusters, chimneys, etc.
  {
    type = "noise-expression",
    name = "selene_aux",
    --intended_property = "aux",
    expression = "clamp(min(abs(multioctave_noise{x = x,\z
                                                  y = y,\z
                                                  seed0 = map_seed,\z
                                                  seed1 = 2,\z
                                                  octaves = 5,\z
                                                  persistence = 0.6,\z
                                                  input_scale = 0.2,\z
                                                  output_scale = 0.6}),\z
                            0.3 - 0.6 * selene_flood_paths), 0, 1)"
  },
  ---- MOISTURE (0-1): On selene used for vegetation clustering.
  ---- 0 is no vegetation, such as ash bowels in the highlands.
  ---- 1 is vegetation pathches (mainly in highlands).
  ---- As this drives the ash bowls, it also has an impact on small rock & pebble placement.
  {
    type = "noise-expression",
    name = "selene_moisture",
    --intended_property = "moisture",
    expression = "clamp(1\z
                        - abs(multioctave_noise{x = x,\z
                                                y = y,\z
                                                seed0 = map_seed,\z
                                                seed1 = 4,\z
                                                octaves = 2,\z
                                                persistence = 0.6,\z
                                                input_scale = 0.025,\z
                                                output_scale = 0.25})\z
                        - abs(multioctave_noise{x = x,\z
                                                y = y,\z
                                                seed0 = map_seed,\z
                                                seed1 = 400,\z
                                                octaves = 3,\z
                                                persistence = 0.62,\z
                                                input_scale = 0.051144353,\z
                                                output_scale = 0.25})\z
                        - 0.2 * selene_flood_cracks_a, 0, 1)"
  },

  ---- Starting Area blobs
  {
    type = "noise-expression",
    name = "selene_starting_area_radius",
    expression = "0.7 * 0.75"
  },
  {
    type = "noise-expression",
    name = "selene_starting_direction",
    expression = "-1 + 2 * (map_seed_small & 1)"
  },
  {
    type = "noise-expression",
    name = "selene_highlands_angle",
    expression = "map_seed_normalized * 3600"
  },
  {
    type = "noise-expression",
    name = "selene_craters_angle",
    expression = "selene_highlands_angle + 120 * selene_starting_direction"
  },
  {
    type = "noise-expression",
    name = "selene_lowlands_angle",
    expression = "selene_highlands_angle + 240 * selene_starting_direction"
  },
  {
    type = "noise-expression",
    name = "selene_highlands_start",
    -- requires more influence because it is smaller and has no crater boost
    expression = "4 * starting_spot_at_angle{ angle = selene_highlands_angle,\z
                                              distance = 150 * selene_starting_area_radius,\z
                                              radius = 300 * selene_starting_area_radius,\z
                                              x_distortion = 0.1 * selene_starting_area_radius * (selene_wobble_x + selene_wobble_large_x + selene_wobble_huge_x),\z
                                              y_distortion = 0.1 * selene_starting_area_radius * (selene_wobble_y + selene_wobble_large_y + selene_wobble_huge_y)}"
  },
  {
    type = "noise-expression",
    name = "selene_lowlands_start",
    expression = "2 * starting_spot_at_angle{ angle = selene_lowlands_angle,\z
                                              distance = 250,\z
                                              radius = 450 * selene_starting_area_radius,\z
                                              x_distortion = 0.1 * selene_starting_area_radius * (selene_wobble_x + selene_wobble_large_x + selene_wobble_huge_x),\z
                                              y_distortion = 0.1 * selene_starting_area_radius * (selene_wobble_y + selene_wobble_large_y + selene_wobble_huge_y)}"
  },
  {
    type = "noise-expression",
    name = "selene_craters_start",
    expression = "2 * starting_spot_at_angle{ angle = selene_craters_angle,\z
                                              distance = 250 * selene_starting_area_radius,\z
                                              radius = 300 * selene_starting_area_radius,\z
                                              x_distortion = 0.01 * selene_starting_area_radius * (selene_wobble_x + selene_wobble_large_x + selene_wobble_huge_x),\z
                                              y_distortion = 0.01 * selene_starting_area_radius * (selene_wobble_y + selene_wobble_large_y + selene_wobble_huge_y)}"
  },
  {
    type = "noise-expression",
    name = "selene_starting_area", -- used for biome blending
    expression = "clamp(max(selene_lowlands_start, selene_craters_start, selene_highlands_start), 0, 1)"
  },
  {
    type = "noise-expression",
    name = "selene_starting_circle", -- Used to push random ores away. No not clamp.
    -- 600-650 circle
    expression = "1 + selene_starting_area_radius * (300 - distance) / 50"
  },

  ---- BIOME NOISE

  {
    type = "noise-function",
    name = "selene_biome_noise",
    parameters = {"seed1", "scale"},
    expression = "multioctave_noise{x = x,\z
                                    y = y,\z
                                    persistence = 0.65,\z
                                    seed0 = map_seed,\z
                                    seed1 = seed1,\z
                                    octaves = 5,\z
                                    input_scale = selene_scale_multiplier / scale}"
  },
  {
    type = "noise-function",
    name = "selene_biome_multiscale",
    parameters = {"seed1", "scale", "bias"},
    expression = "bias + lerp(selene_biome_noise(seed1, scale * 0.5),\z
                              selene_biome_noise(seed1 + 1000, scale),\z
                              clamp(distance / 10000, 0, 1))"
  },
  {
    type = "noise-expression",
    name = "selene_craters_biome_noise",
    expression = "selene_biome_multiscale{seed1 = 342,\z
                                            scale = 10,\z
                                            bias = 0}"
  },
  {
    type = "noise-expression",
    name = "selene_highlands_biome_noise",
    expression = "selene_biome_multiscale{seed1 = 12416,\z
                                            scale = 40,\z
                                            bias = 0.05}"
  },
  {
    type = "noise-expression",
    name = "selene_lowlands_biome_noise",
    expression = "selene_biome_multiscale{seed1 = 32416,\z
                                            scale = 100,\z
                                            bias = 0.4}"
  },


  {
    type = "noise-expression",
    name = "selene_highlands_raw",
    expression = "lerp(selene_highlands_biome_noise, starting_weights, clamp(2 * selene_starting_area, 0, 1))",
    local_expressions =
    {
      starting_weights = "-selene_craters_start + selene_highlands_start - selene_lowlands_start"
    }
  },
  {
    type = "noise-expression",
    name = "selene_lowlands_raw",
    expression = "lerp(selene_lowlands_biome_noise, starting_weights, clamp(2 * selene_starting_area, 0, 1))",
    local_expressions =
    {
      starting_weights = "-selene_craters_start - selene_highlands_start + selene_lowlands_start"
    }
  },

  {
    type = "noise-expression",
    name = "selene_craters_raw_pre_crater",
    expression = "lerp(selene_craters_biome_noise, starting_weights, clamp(2 * selene_starting_area, 0, 1))",
    local_expressions =
    {
      starting_weights = "selene_craters_start - selene_highlands_start - selene_lowlands_start"
    }
  },
  {
    type = "noise-expression",
    name = "selene_craters_biome_full_pre_crater",
    expression = "selene_craters_raw_pre_crater - max(selene_highlands_raw, selene_lowlands_raw)"
  },

  {
    type = "noise-expression",
    name = "selene_crater_spots",
    expression = "max(selene_starting_crater_spot, raw_spots - starting_protector)",
    local_expressions =
    {
      starting_protector = "clamp(starting_spot_at_angle{ angle = selene_craters_angle + 180 * selene_starting_direction,\z
                                                          distance = (600 * selene_starting_area_radius) / 2,\z
                                                          radius = 300 * selene_starting_area_radius,\z
                                                          x_distortion = selene_wobble_x/4 + selene_wobble_large_x/24 + selene_wobble_huge_x/160,\z
                                                          y_distortion = selene_wobble_y/4 + selene_wobble_large_y/24 + selene_wobble_huge_y/160}, 0, 1)",
      raw_spots = "spot_noise{x = x + selene_wobble_x/4 + selene_wobble_large_x/24 + selene_wobble_huge_x/160,\z
                              y = y + selene_wobble_y/4 + selene_wobble_large_y/24 + selene_wobble_huge_y/160,\z
                              seed0 = map_seed,\z
                              seed1 = 1,\z
                              candidate_spot_count = 1,\z
                              suggested_minimum_candidate_point_spacing = crater_spot_spacing,\z
                              skip_span = 1,\z
                              skip_offset = 0,\z
                              region_size = 128,\z
                              density_expression = crater_area / craters_sq,\z
                              spot_quantity_expression = crater_spot_radius * crater_spot_radius,\z
                              spot_radius_expression = crater_spot_radius,\z
                              hard_region_target_quantity = 0,\z
                              spot_favorability_expression = crater_area,\z
                              basement_value = 0,\z
                              maximum_spot_basement_radius = crater_spot_radius}",
      crater_area = "lerp(selene_craters_biome_full_pre_crater, 0, selene_starting_area)",
      crater_spot_radius = "300 * craters",
      crater_spot_spacing = "50000 * craters",
      craters = "0.2 + 0.3 * slider_rescale(control:selene_craters:size, 2) / slider_rescale(selene_scale_multiplier, 2)",
      craters_sq = "craters * craters"
    }
  },
  {
    type = "noise-expression",
    name = "selene_starting_crater_spot",
    expression = "clamp(starting_spot_at_angle{ angle = selene_craters_angle,\z
                                                distance = 300 * selene_starting_area_radius,\z
                                                radius = 150,\z
                                                x_distortion = selene_wobble_x/4 + selene_wobble_large_x/24 + selene_wobble_huge_x/160,\z
                                                y_distortion = selene_wobble_y/4 + selene_wobble_large_y/24 + selene_wobble_huge_y/160}, 0, 1)"
  },

  {
    type = "noise-expression",
    name = "selene_craters_raw_crater",
    -- moderate influence for the outer 1/3 of the crater, ramp to high influence for the middle third, and maxed for the innter third
    expression = "0.5 * selene_craters_raw_pre_crater + max(2 * selene_crater_spots, 10 * clamp((selene_crater_spots - 0.33) * 3, 0, 1))"
  },

  -- full range biomes with no clamping, good for away-from-edge targeting.
  {
    type = "noise-expression",
    name = "selene_craters_biome_full",
    expression = "selene_craters_raw_crater - max(selene_highlands_raw, selene_lowlands_raw)"
  },
  {
    type = "noise-expression",
    name = "selene_highlands_biome_full",
    expression = "selene_highlands_raw - max(selene_craters_raw_crater, selene_lowlands_raw)"
  },
  {
    type = "noise-expression",
    name = "selene_lowlands_biome_full",
    expression = "selene_lowlands_raw - max(selene_craters_raw_crater, selene_highlands_raw)"
  },

  -- clamped 0-1 biomes
  {
    type = "noise-expression",
    name = "selene_craters_biome",
    expression = "clamp(selene_craters_biome_full * selene_biome_contrast, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "selene_highlands_biome",
    expression = "clamp(selene_highlands_biome_full * selene_biome_contrast, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "selene_lowlands_biome",
    expression = "clamp(selene_lowlands_biome_full * selene_biome_contrast, 0, 1)"
  },


  {
    type = "noise-expression",
    name = "selene_resource_penalty",
    expression = "random_penalty_inverse(2.5, 1)"
  },
  {
    type = "noise-expression",
    name = "selene_wobble_x",
    expression = "selene_detail_noise{seed1 = 10, scale = 1/8, octaves = 2, magnitude = 4}"
  },
  {
    type = "noise-expression",
    name = "selene_wobble_y",
    expression = "selene_detail_noise{seed1 = 1010, scale = 1/8, octaves = 2, magnitude = 4}"
  },
  {
    type = "noise-expression",
    name = "selene_wobble_large_x",
    expression = "selene_detail_noise{seed1 = 20, scale = 1/2, octaves = 2, magnitude = 50}"
  },
  {
    type = "noise-expression",
    name = "selene_wobble_large_y",
    expression = "selene_detail_noise{seed1 = 1020, scale = 1/2, octaves = 2, magnitude = 50}"
  },
  {
    type = "noise-expression",
    name = "selene_wobble_huge_x",
    expression = "selene_detail_noise{seed1 = 30, scale = 2, octaves = 2, magnitude = 800}"
  },
  {
    type = "noise-expression",
    name = "selene_wobble_huge_y",
    expression = "selene_detail_noise{seed1 = 1030, scale = 2, octaves = 2, magnitude = 800}"
  },

  {
    type = "noise-expression",
    name = "crater_basis_noise",
    expression = "basis_noise{x = x,\z
                              y = y,\z
                              seed0 = map_seed,\z
                              seed1 = 13423,\z
                              input_scale = 1 / 500,\z
                              output_scale = 250}"
  },
  {
    type = "noise-expression",
    name = "crater_plasma",
    expression = "selene_plasma(102, 2.5, 10, 125, 625)"
  },
  {
    type = "noise-expression",
    name = "crater_elevation",
    expression = "lerp(max(clamp(crater_plasma, -100, 10000), crater_basis_noise),\z
                       crater_plasma,\z
                       clamp(0.7 * crater_basis_noise, 0, 1))\z
                  * (1 - clamp(selene_plasma(13, 2.5, 10, 0.15, 0.75), 0, 1))",
  },
  {
    type = "noise-expression",
    name = "crater_bottom_spots",
    expression = "clamp(selene_threshold(selene_crater_spots * 1.95 - 0.95,\z
                                           0.4 * clamp(selene_threshold(selene_craters_biome, 0.5), 0, 1))\z
                                           * selene_threshold(clamp(selene_plasma(17453, 0.2, 0.4, 10, 20) / 20, 0, 1), 1.8),\z
                        0, 1)"
  },
  {
    type = "noise-function",
    name = "crater_inverted_peak",
    parameters = {"spot", "inversion_point"},
    expression = "(inversion_point - abs(spot - inversion_point)) / inversion_point"
  },
  {
    type = "noise-expression",
    name = "selene_craters_func",
    expression = "lerp(crater_elevation, 1100 * crater_inverted_peak(selene_crater_spots, 0.35), clamp(selene_crater_spots * 3, 0, 1))\z
     + 300 * (aux - 0.5) * (selene_crater_spots + 0.5)"
  },
  {
    type = "noise-expression",
    name = "selene_highlands_func",
    expression = "100 + 0.001 * min(basis_noise{x = x,\z
                                                y = y,\z
                                                seed0 = map_seed,\z
                                                seed1 = 12643,\z
                                                input_scale = selene_scale_multiplier / 50 / scale,\z
                                                output_scale = 150},\z
                                    basis_noise{x = x,\z
                                                y = y,\z
                                                seed0 = map_seed,\z
                                                seed1 = 12643,\z
                                                input_scale = selene_scale_multiplier / 50 / scale,\z
                                                output_scale = 150})",
    local_expressions = {scale = 5}
  },
  {
    type = "noise-expression",
    name = "selene_hairline_cracks",
    expression = "selene_plasma(15223, 0.3 * selene_cracks_scale, 0.6 * selene_cracks_scale, 0.6, 1)"
  },
  {
    type = "noise-expression",
    name = "selene_flood_cracks_a",
    expression = "lerp(min(selene_plasma(7543, 2.5 * selene_cracks_scale, 4 * selene_cracks_scale, 0.5, 1),\z
                           selene_plasma(7443, 1.5 * selene_cracks_scale, 3.5 * selene_cracks_scale, 0.5, 1)),\z
                       1,\z
                       clamp(selene_detail_noise(241, 2 * selene_cracks_scale, 2, 0.25), 0, 1))"
  },
  {
    type = "noise-expression",
    name = "selene_flood_cracks_b",
    expression = "lerp(1,\z
                       min(selene_plasma(12223, 2 * selene_cracks_scale, 3 * selene_cracks_scale, 0.5, 1),\z
                           selene_plasma(152, 1 * selene_cracks_scale, 1.5 * selene_cracks_scale, 0.25, 0.5)) - 0.5,\z
                       clamp(0.2 + selene_detail_noise(821, 6 * selene_cracks_scale, 2, 0.5), 0, 1))"
  },
  {
    type = "noise-expression",
    name = "selene_flood_paths",
    -- make paths through the lava cracks, get walkable areas above 0, the first value is the path height
    expression = "0.4\z
                  - selene_plasma(1543, 1.5 * selene_cracks_scale, 3 * selene_cracks_scale, 0.5, 1)\z
                  + min(0, selene_detail_noise(121, selene_cracks_scale * 4, 2, 0.5))",
  },
  {
    type = "noise-expression",
    name = "selene_flood_lowlands_func",
    -- add hairline cracks to break up edges, crop hearilyie cracks peaks so it is more of a plates + cracks pattern
    -- lava level should be 0 and below, solid ground above 0
    expression = "min(max(selene_flood_cracks_a - 0.125, selene_flood_paths), selene_flood_cracks_b) + 0.3 * min(0.5, selene_hairline_cracks)"
  },

  {
    type = "noise-expression",
    name = "selene_elevation_offset",
    expression = "0"
  },
  {
    type = "noise-function",
    name = "selene_biome_blend",
    parameters = {"fade", "noise", "offset"},
    expression = "fade * (noise - offset)"
  },
  {
    type = "noise-expression",
    name = "selene_elev",
    expression = "selene_elevation_offset\z
                  + lerp(lerp(120 * selene_lowland_lakes_multisample,\z
                              20 + selene_craters_func * selene_craters_elevation_multiplier,\z
                              selene_craters_biome),\z
                         selene_highlands_func,\z
                         selene_highlands_biome)",
    local_expressions =
    {
      selene_lowland_lakes_multisample = "min(multisample(selene_lowland_lakes, 0, 0),\z
                                               multisample(selene_lowland_lakes, 1, 0),\z
                                               multisample(selene_lowland_lakes, 0, 1),\z
                                               multisample(selene_lowland_lakes, 1, 1))"
    }
  },
  {
    type = "noise-expression",
    name = "selene_lowland_lakes",
    expression = "min(1,\z
                      -0.2 + selene_flood_lowlands_func\z
                      - 0.35 * clamp(selene_contrast(selene_detail_noise(763, 1/40, 4, 1.25), 0.95)\z
                                     * selene_contrast(selene_detail_noise(234, 1/50, 4, 1), 0.95)\z
                                     * selene_detail_noise(643, 1/70, 4, 0.7),\z
                                     0, 3))"
  },

  ---- RESOURCES
  {
    type = "noise-expression",
    name ="ice_craters_range",
    expression = "400 * range_select_base(selene_crater_spots, 0.15, 10, 1, 0, 1)"
  },
  {
    type = "noise-expression",
    name ="dry_ice_craters_range",
    expression = "300 * range_select_base(selene_crater_spots, 0.05, 0.3, 1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "selene_resource_wobble_x",
    expression = "selene_wobble_x + 0.25 * selene_wobble_large_x"
  },
  {
    type = "noise-expression",
    name = "selene_resource_wobble_y",
    expression = "selene_wobble_y + 0.25 * selene_wobble_large_y"
  },
  {
    type = "noise-expression",
    name = "selene_starting_regolith", -- don't use the slider for radius
    expression = "starting_spot_at_angle{ angle = selene_lowlands_angle - 10 * selene_starting_direction,\z
                                          distance = 100 * selene_starting_area_radius,\z
                                          radius = 30 / 1.5,\z
                                          x_distortion = 0.5 * selene_resource_wobble_x,\z
                                          y_distortion = 0.5 * selene_resource_wobble_y}"
  },
  {
    type = "noise-expression",
    name = "selene_starting_ice", -- don't use the slider for radius
    expression = "starting_spot_at_angle{ angle = selene_craters_angle - 90 * selene_starting_direction,\z
                                          distance = 150 * selene_starting_area_radius,\z
                                          radius = 30 / 1.5,\z
                                          x_distortion = 0.5 * selene_resource_wobble_x,\z
                                          y_distortion = 0.5 * selene_resource_wobble_y}"
  },
  {
    type = "noise-expression",
    name = "selene_starting_dry_ice", -- don't use the slider for radius
    expression = "max(starting_spot_at_angle{ angle = selene_craters_angle + 90 * selene_starting_direction,\z
                                              distance = 500 * selene_starting_area_radius,\z
                                              radius = 30,\z
                                              x_distortion = 0.75 * selene_resource_wobble_x,\z
                                              y_distortion = 0.75 * selene_resource_wobble_y},\z
                      starting_spot_at_angle{ angle = selene_craters_angle + 40 * selene_starting_direction,\z
                                              distance = 200 * selene_starting_area_radius,\z
                                              radius = 25 * selene_dry_ice_size,\z
                                              x_distortion = 0.75 * selene_resource_wobble_x,\z
                                              y_distortion = 0.75 * selene_resource_wobble_y})"
  },
  {
    type = "noise-expression",
    name = "selene_starting_titanium", -- don't use the slider for radius
    expression = "starting_spot_at_angle{ angle = selene_highlands_angle - 10 * selene_starting_direction,\z
                                          distance = 400 * selene_starting_area_radius,\z
                                          radius = 20 / 1.5,\z
                                          x_distortion = 0.5 * selene_resource_wobble_x,\z
                                          y_distortion = 0.5 * selene_resource_wobble_y}"
  },
  {
    type = "noise-expression",
    name = "selene_starting_saline",
    expression = "max(starting_spot_at_angle{ angle = selene_lowlands_angle + 10 * selene_starting_direction,\z
                                              distance = 500 * selene_starting_area_radius,\z
                                              radius = 30,\z
                                              x_distortion = 0.75 * selene_resource_wobble_x,\z
                                              y_distortion = 0.75 * selene_resource_wobble_y},\z
                      starting_spot_at_angle{ angle = selene_lowlands_angle + 30 * selene_starting_direction,\z
                                              distance = 200 * selene_starting_area_radius,\z
                                              radius = 25 * selene_saline_geyser_size,\z
                                              x_distortion = 0.75 * selene_resource_wobble_x,\z
                                              y_distortion = 0.75 * selene_resource_wobble_y})"
  },
  {
    type = "noise-function",
    name = "selene_spot_noise",
    parameters = {"seed", "count", "spacing", "span", "offset", "region_size", "density", "quantity", "radius", "favorability"},
    expression = "spot_noise{x = x + selene_resource_wobble_x,\z
                             y = y + selene_resource_wobble_y,\z
                             seed0 = map_seed,\z
                             seed1 = seed,\z
                             candidate_spot_count = count,\z
                             suggested_minimum_candidate_point_spacing = 128,\z
                             skip_span = span,\z
                             skip_offset = offset,\z
                             region_size = region_size,\z
                             density_expression = density,\z
                             spot_quantity_expression = quantity,\z
                             spot_radius_expression = radius,\z
                             hard_region_target_quantity = 0,\z
                             spot_favorability_expression = favorability,\z
                             basement_value = -1,\z
                             maximum_spot_basement_radius = 128}"
  },
  {
    type = "noise-expression",
    name = "selene_lowlands_resource_favorability",
    expression = "clamp(((selene_lowlands_biome_full * (selene_starting_area < 0.01)) - buffer) * contrast, 0, 1)",
    local_expressions =
    {
      buffer = 0.2, -- push ores away from biome edges.
      contrast = 2
    }
  },
  {
    type = "noise-expression",
    name = "selene_craters_resource_favorability",
    expression = "clamp(main_region - (selene_crater_spots > 0.78), 0, 1)",
    local_expressions =
    {
      buffer = 0.8, -- push ores away from biome edges.
      contrast = 2,
      main_region = "clamp(((selene_craters_biome_full * (selene_starting_area < 0.01)) - buffer) * contrast, 0, 1)"
    }
  },
  {
    type = "noise-expression",
    name = "selene_lowlands_saline_favorability",
    expression = "clamp(((selene_lowlands_biome_full * (selene_starting_area < 0.01)) - buffer) * contrast, 0, 1)",
    local_expressions =
    {
      buffer = 0.25, -- push ores away from biome edges.
      contrast = 2
    }
  },
  {
    type = "noise-expression",
    name = "selene_highlands_resource_favorability",
    expression = "clamp(((selene_highlands_biome_full * (selene_starting_area < 0.01)) - buffer) * contrast, 0, 1)",
    local_expressions =
    {
      buffer = 0.35, -- push ores away from biome edges.
      contrast = 2
    }
  },
  {
    type = "noise-function",
    name = "selene_place_metal_spots",
    parameters = {"seed", "count", "offset", "size", "freq", "favor_biome"},
    expression = "min(clamp(-1 + 4 * favor_biome, -1, 1), metal_spot_noise - selene_hairline_cracks / 30000)",
    local_expressions =
    {
      metal_spot_noise = "selene_spot_noise{seed = seed,\z
                                              count = count,\z
                                              spacing = selene_ore_spacing,\z
                                              span = 3,\z
                                              offset = offset,\z
                                              region_size = 500 + 500 / freq,\z
                                              density = favor_biome * 4,\z
                                              quantity = size * size,\z
                                              radius = size,\z
                                              favorability = favor_biome > 0.9}"
    }
  },
  {
    type = "noise-function",
    name = "selene_place_saline_spots",
    parameters = {"seed", "count", "offset", "size", "freq", "favor_biome"},
    expression = "min(2 * favor_biome - 1, selene_spot_noise{seed = seed,\z
                                                               count = count,\z
                                                               spacing = selene_ore_spacing,\z
                                                               span = 3,\z
                                                               offset = offset,\z
                                                               region_size = 450 + 450 / freq,\z
                                                               density = favor_biome * 4,\z
                                                               quantity = size * size,\z
                                                               radius = size,\z
                                                               favorability = favor_biome > 0.9})"
  },
  {
    type = "noise-function",
    name = "selene_place_non_metal_spots",
    parameters = {"seed", "count", "offset", "size", "freq", "favor_biome"},
    expression = "min(2 * favor_biome - 1, selene_spot_noise{seed = seed,\z
                                                               count = count,\z
                                                               spacing = selene_ore_spacing,\z
                                                               span = 3,\z
                                                               offset = offset,\z
                                                               region_size = 400 + 400 / freq,\z
                                                               density = favor_biome * 4,\z
                                                               quantity = size * size,\z
                                                               radius = size,\z
                                                               favorability = favor_biome > 0.9})"
  },

  {
    type = "noise-expression",
    name = "selene_metallic_regolith_size",
    expression = "slider_rescale(control:metallic_regolith:size, 1)"
  },
  {
    type = "noise-expression",
    name = "selene_metallic_regolith_region",
    -- -1 to 1: needs a positive region for resources & decoratives plus a subzero baseline and skirt for surrounding decoratives.
    expression = "max(selene_starting_regolith,\z
                      min(1 - selene_starting_circle,\z
                          selene_place_metal_spots(1200, 15, 2,\z
                                                     selene_metallic_regolith_size * min(1.2, selene_ore_dist) * 20,\z
                                                     control:metallic_regolith:frequency,\z
                                                     selene_lowlands_resource_favorability)))"
  },
  {
    type = "noise-expression",
    name = "selene_metallic_regolith_probability",
    expression = "(control:metallic_regolith:size > 0) * (1000 * ((1 + selene_metallic_regolith_region) * random_penalty_between(0.9, 1, 1) - 1))"
  },
  {
    type = "noise-expression",
    name = "selene_metallic_regolith_richness",
    expression = "selene_metallic_regolith_region * random_penalty_between(0.9, 1, 1)\z
                  * 16000 * selene_starting_area_multiplier\z
                  * control:metallic_regolith:richness / selene_metallic_regolith_size"
  },

  {
    type = "noise-expression",
    name = "selene_ice_size",
    expression = "slider_rescale(control:ice:size, 2)"
  },
  {
    type = "noise-expression",
    name = "selene_dry_ice_size",
    expression = "slider_rescale(control:dry_ice:size, 2)"
  },
  {
    type = "noise-expression",
    name = "selene_ice_region",
    -- -1 to 1: needs a positive region for resources & decoratives plus a subzero baseline and skirt for surrounding decoratives.
    expression = "max(selene_starting_ice,\z
                      min(1 - selene_starting_circle,\z
                          selene_place_metal_spots(987, 15, 1.5,\z
                                                     selene_ice_size * min(1.3, selene_ore_dist) * 10,\z
                                                     control:ice:frequency,\z
                                                     selene_craters_resource_favorability)))"
  },
  {
    type = "noise-expression",
    name = "selene_ice_probability",
    expression = "(control:ice:size > 0) * (1000 * ((1 + selene_ice_region) * random_penalty_between(0.9, 1, 1) - 1))"
  },
  {
    type = "noise-expression",
    name = "selene_ice_richness",
    expression = "selene_ice_region * random_penalty_between(0.9, 1, 1)\z
                  * 3000 * selene_starting_area_multiplier\z
                  * control:ice:richness / selene_ice_size"
  },
  {
    type = "noise-expression",
    name = "selene_dry_ice_region",
    -- -1 to 1: needs a positive region for resources & decoratives plus a subzero baseline and skirt for surrounding decoratives.
    expression = "max(selene_starting_ice,\z
                      min(1 - selene_starting_circle,\z
                          selene_place_metal_spots(789, 15, 1.5,\z
                                                     selene_dry_ice_size * min(1.1, selene_ore_dist) * 10,\z
                                                     control:dry_ice:frequency,\z
                                                     selene_craters_resource_favorability)))"
  },
  {
    type = "noise-expression",
    name = "selene_dry_ice_probability",
    expression = "(control:dry_ice:size > 0) * (1000 * ((1 + selene_dry_ice_region) * random_penalty_between(0.9, 1, 1) - 1))"
  },
  {
    type = "noise-expression",
    name = "selene_dry_ice_richness",
    expression = "selene_dry_ice_region * random_penalty_between(0.9, 1, 1)\z
                  * 3000 * selene_starting_area_multiplier\z
                  * control:dry_ice:richness / selene_dry_ice_size"
  },
  {
    type = "noise-expression",
    name = "selene_titanium_ore_size",
    expression = "slider_rescale(control:titanium_ore:size, 2)"
  },
  {
    type = "noise-expression",
    name = "selene_titanium_ore_region",
    -- -1 to 1: needs a positive region for resources & decoratives plus a subzero baseline and skirt for surrounding decoratives.
    expression = "max(selene_starting_titanium,\z
                      min(1 - selene_starting_circle,\z
                          selene_place_metal_spots(789, 15, 2,\z
                                                     selene_titanium_ore_size * min(1.2, selene_ore_dist) * 25,\z
                                                     control:titanium_ore:frequency,\z
                                                     selene_highlands_resource_favorability)))"
  },
  {
    type = "noise-expression",
    name = "selene_titanium_ore_probability",
    expression = "(control:titanium_ore:size > 0) * (1000 * ((1 + selene_titanium_ore_region) * random_penalty_between(0.9, 1, 1) - 1))"
  },
  {
    type = "noise-expression",
    name = "selene_titanium_ore_richness",
    expression = "selene_titanium_ore_region * random_penalty_between(0.9, 1, 1)\z
                  * 6000 * selene_starting_area_multiplier\z
                  * control:titanium_ore:richness / selene_titanium_ore_size"
  },

  {
    type = "noise-expression",
    name = "selene_saline_geyser_size",
    expression = "slider_rescale(control:saline_geyser:size, 2)"
  },
  {
    type = "noise-expression",
    name = "selene_saline_region",
    -- -1 to 1: needs a positive region for resources & decoratives plus a subzero baseline and skirt for surrounding decoratives.
    expression = "max(selene_starting_saline,\z
                      min(1 - selene_starting_circle,\z
                          selene_place_saline_spots(789, 5, 0,\z
                                                      selene_saline_geyser_size * min(1.1, selene_geyser_dist) * 20,\z
                                                      control:saline_geyser:frequency,\z
                                                      selene_lowlands_saline_favorability)))"
  },
  {
    type = "noise-expression",
    name = "selene_saline_patches",
    -- small wavelength noise (5 tiles-ish) to make geyser placement patchy but consistent between resources and decoratives
    expression = "0.8 * abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 21000, octaves = 2, input_scale = 1/3})"
  },
  {
    type = "noise-expression",
    name = "selene_saline_region_patchy",
    expression = "(1 + selene_saline_region) * (0.5 + 0.5 * selene_saline_patches) - 1"
  },
  {
    type = "noise-expression",
    name = "selene_saline_geyser_probability",
    expression = "(control:saline_geyser:size > 0) * (0.025 * ((selene_saline_region_patchy > 0) + 2 * selene_saline_region_patchy))"
  },
  {
    type = "noise-expression",
    name = "selene_saline_geyser_richness",
    expression = "(selene_saline_region > 0) * random_penalty_between(0.5, 1, 1)\z
                  * 10000 * 20 * selene_richness_multiplier * selene_starting_area_multiplier\z
                  * control:saline_geyser:richness / selene_saline_geyser_size"
  },
  {
    type = "noise-expression",
    name = "selene_ore_dist",
    expression = "max(1, distance / 2000)"
  },
  {
    type = "noise-expression",
    name = "selene_geyser_dist",
    expression = "max(1, distance / 4000)"
  },

  -- DECORATIVES
  {
    type = "noise-expression",
    name = "selene_decorative_knockout", -- small wavelength noise (5 tiles-ish) to make decoratives patchy
    expression = "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 1300000, octaves = 2, input_scale = 1/3}"
  },
  {
    type = "noise-expression",
    name = "selene_rock_noise",
    expression = "multioctave_noise{x = x,\z
                                    y = y,\z
                                    seed0 = map_seed,\z
                                    seed1 = 137,\z
                                    octaves = 4,\z
                                    persistence = 0.65,\z
                                    input_scale = 0.1,\z
                                    output_scale = 0.4}"
    -- 0.1 / slider_rescale(var('control:rocks:frequency'), 2),\z
  }
}