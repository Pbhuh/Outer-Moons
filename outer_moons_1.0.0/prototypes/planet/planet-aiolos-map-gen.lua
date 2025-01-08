data:extend{
  ---- Constants
  {
    type = "noise-expression",
    name = "aiolos_ore_spacing",
    expression = 96
  },
  {
    type = "noise-expression",
    name = "aiolos_shared_influence",
    expression = 105 * 3
  },
  {
    type = "noise-expression",
    name = "aiolos_biome_contrast",
    expression = 5 -- higher values mean sharper transitions
  },
  {
    type = "noise-expression",
    name = "aiolos_cracks_scale",
    expression = 0.5
  },
  --used to be segmenataion_multiplier
  {
    type = "noise-expression",
    name = "aiolos_segment_scale",
    expression = 3
  },
  {
    --functions more like a cliffiness multiplier as all the peak tiles have it offset.
    type = "noise-expression",
    name = "aiolos_peaks_elevation_multiplier",
    expression = 1.5
  },

  ---- HELPERS
  {
    type = "noise-expression",
    name = "aiolos_starting_area_multiplier",
    -- reduced richness for starting resources
    expression = "lerp(1, 0.06, clamp(0.5 + aiolos_starting_circle, 0, 1))"
  },
  {
    type = "noise-expression",
    name = "aiolos_richness_multiplier",
    expression = "6 + distance / 10000"
  },
  {
    type = "noise-expression",
    name = "aiolos_scale_multiplier",
    expression = "slider_rescale(control:aiolos_peaks:frequency, 3)"
  },
  {
    type = "noise-function",
    name = "aiolos_detail_noise",
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
    name = "aiolos_plasma",
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
    name = "aiolos_threshold",
    parameters = {"value", "threshold"},
    expression = "(value - (1 - threshold)) * (1 / threshold)"
  },
  {
    type = "noise-function",
    name = "aiolos_contrast",
    parameters = {"value", "c"},
    expression = "clamp(value, c, 1) - c"
  },

  ---- ELEVATION
  {
    type = "noise-expression",
    name = "aiolos_elevation",
    --intended_property = "elevation",
    expression = "max(-500, aiolos_elev)"
  },
  ---- TEMPERATURE: Used to place hot vs cold tilesets, e.g. cold - warm - hot cracks.
  {
    type = "noise-expression",
    name = "aiolos_temperature",
    --intended_property = "temperature",
    expression = "100\z
                  + 100 * var('control:temperature:bias')\z
                  - min(aiolos_elev, aiolos_elev / 100)\z
                  - 2 * aiolos_moisture\z
                  - 1 * aiolos_aux\z
                  - 60 * aiolos_highlands_biome\z
                  + 150 * max(0, aiolos_peak_spots - 0.6)"
  },
  ---- AUX (0-1): On aiolos this is Rockiness.
  ---- 0 is flat and arranged as paths through rocks.
  ---- 1 are rocky "islands" for rock clusters, chimneys, etc.
  {
    type = "noise-expression",
    name = "aiolos_aux",
    --intended_property = "aux",
    expression = "clamp(min(abs(multioctave_noise{x = x,\z
                                                  y = y,\z
                                                  seed0 = map_seed,\z
                                                  seed1 = 2,\z
                                                  octaves = 5,\z
                                                  persistence = 0.6,\z
                                                  input_scale = 0.2,\z
                                                  output_scale = 0.6}),\z
                            0.3 - 0.6 * aiolos_flood_paths), 0, 1)"
  },
  ---- MOISTURE (0-1): On aiolos used for vegetation clustering.
  ---- 0 is no vegetation, such as ash bowels in the highlands.
  ---- 1 is vegetation pathches (mainly in highlands).
  ---- As this drives the ash bowls, it also has an impact on small rock & pebble placement.
  {
    type = "noise-expression",
    name = "aiolos_moisture",
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
                        - 0.2 * aiolos_flood_cracks_a, 0, 1)"
  },

  ---- Starting Area blobs
  {
    type = "noise-expression",
    name = "aiolos_starting_area_radius",
    expression = "0.7 * 0.75"
  },
  {
    type = "noise-expression",
    name = "aiolos_starting_direction",
    expression = "-1 + 2 * (map_seed_small & 1)"
  },
  {
    type = "noise-expression",
    name = "aiolos_highlands_angle",
    expression = "map_seed_normalized * 3600"
  },
  {
    type = "noise-expression",
    name = "aiolos_peaks_angle",
    expression = "aiolos_highlands_angle + 120 * aiolos_starting_direction"
  },
  {
    type = "noise-expression",
    name = "aiolos_lowlands_angle",
    expression = "aiolos_highlands_angle + 240 * aiolos_starting_direction"
  },
  {
    type = "noise-expression",
    name = "aiolos_highlands_start",
    -- requires more influence because it is smaller and has no peak boost
    expression = "4 * starting_spot_at_angle{ angle = aiolos_highlands_angle,\z
                                              distance = 150 * aiolos_starting_area_radius,\z
                                              radius = 100 * aiolos_starting_area_radius,\z
                                              x_distortion = 0.1 * aiolos_starting_area_radius * (aiolos_wobble_x + aiolos_wobble_large_x + aiolos_wobble_huge_x),\z
                                              y_distortion = 0.1 * aiolos_starting_area_radius * (aiolos_wobble_y + aiolos_wobble_large_y + aiolos_wobble_huge_y)}"
  },
  {
    type = "noise-expression",
    name = "aiolos_lowlands_start",
    expression = "2 * starting_spot_at_angle{ angle = aiolos_lowlands_angle,\z
                                              distance = 250,\z
                                              radius = 600 * aiolos_starting_area_radius,\z
                                              x_distortion = 0.1 * aiolos_starting_area_radius * (aiolos_wobble_x + aiolos_wobble_large_x + aiolos_wobble_huge_x),\z
                                              y_distortion = 0.1 * aiolos_starting_area_radius * (aiolos_wobble_y + aiolos_wobble_large_y + aiolos_wobble_huge_y)}"
  },
  {
    type = "noise-expression",
    name = "aiolos_peaks_start",
    expression = "2 * starting_spot_at_angle{ angle = aiolos_peaks_angle,\z
                                              distance = 250 * aiolos_starting_area_radius,\z
                                              radius = 300 * aiolos_starting_area_radius,\z
                                              x_distortion = 0.01 * aiolos_starting_area_radius * (aiolos_wobble_x + aiolos_wobble_large_x + aiolos_wobble_huge_x),\z
                                              y_distortion = 0.01 * aiolos_starting_area_radius * (aiolos_wobble_y + aiolos_wobble_large_y + aiolos_wobble_huge_y)}"
  },
  {
    type = "noise-expression",
    name = "aiolos_starting_area", -- used for biome blending
    expression = "clamp(max(aiolos_lowlands_start, aiolos_peaks_start, aiolos_highlands_start), 0, 1)"
  },
  {
    type = "noise-expression",
    name = "aiolos_starting_circle", -- Used to push random ores away. No not clamp.
    -- 600-650 circle
    expression = "1 + aiolos_starting_area_radius * (300 - distance) / 50"
  },

  ---- BIOME NOISE

  {
    type = "noise-function",
    name = "aiolos_biome_noise",
    parameters = {"seed1", "scale"},
    expression = "multioctave_noise{x = x,\z
                                    y = y,\z
                                    persistence = 0.65,\z
                                    seed0 = map_seed,\z
                                    seed1 = seed1,\z
                                    octaves = 5,\z
                                    input_scale = aiolos_scale_multiplier / scale}"
  },
  {
    type = "noise-function",
    name = "aiolos_biome_multiscale",
    parameters = {"seed1", "scale", "bias"},
    expression = "bias + lerp(aiolos_biome_noise(seed1, scale * 0.5),\z
                              aiolos_biome_noise(seed1 + 1000, scale),\z
                              clamp(distance / 10000, 0, 1))"
  },
  {
    type = "noise-expression",
    name = "aiolos_peaks_biome_noise",
    expression = "aiolos_biome_multiscale{seed1 = 119,\z
                                            scale = 11,\z
                                            bias = 0}"
  },
  {
    type = "noise-expression",
    name = "aiolos_highlands_biome_noise",
    expression = "aiolos_biome_multiscale{seed1 = 12416,\z
                                            scale = 40,\z
                                            bias = 0.05}"
  },
  {
    type = "noise-expression",
    name = "aiolos_lowlands_biome_noise",
    expression = "aiolos_biome_multiscale{seed1 = 32416,\z
                                            scale = 100,\z
                                            bias = 0.4}"
  },


  {
    type = "noise-expression",
    name = "aiolos_highlands_raw",
    expression = "lerp(aiolos_highlands_biome_noise, starting_weights, clamp(2 * aiolos_starting_area, 0, 1))",
    local_expressions =
    {
      starting_weights = "-aiolos_peaks_start + aiolos_highlands_start - aiolos_lowlands_start"
    }
  },
  {
    type = "noise-expression",
    name = "aiolos_lowlands_raw",
    expression = "lerp(aiolos_lowlands_biome_noise, starting_weights, clamp(2 * aiolos_starting_area, 0, 1))",
    local_expressions =
    {
      starting_weights = "-aiolos_peaks_start - aiolos_highlands_start + aiolos_lowlands_start"
    }
  },

  {
    type = "noise-expression",
    name = "aiolos_peaks_raw_pre_peak",
    expression = "lerp(aiolos_peaks_biome_noise, starting_weights, clamp(2 * aiolos_starting_area, 0, 1))",
    local_expressions =
    {
      starting_weights = "aiolos_peaks_start - aiolos_highlands_start - aiolos_lowlands_start"
    }
  },
  {
    type = "noise-expression",
    name = "aiolos_peaks_biome_full_pre_peak",
    expression = "aiolos_peaks_raw_pre_peak - max(aiolos_highlands_raw, aiolos_lowlands_raw)"
  },

  {
    type = "noise-expression",
    name = "aiolos_peak_spots",
    expression = "max(aiolos_starting_peak_spot, raw_spots - starting_protector)",
    local_expressions =
    {
      starting_protector = "clamp(starting_spot_at_angle{ angle = aiolos_peaks_angle + 180 * aiolos_starting_direction,\z
                                                          distance = (600 * aiolos_starting_area_radius) / 2,\z
                                                          radius = 300 * aiolos_starting_area_radius,\z
                                                          x_distortion = aiolos_wobble_x/4 + aiolos_wobble_large_x/24 + aiolos_wobble_huge_x/160,\z
                                                          y_distortion = aiolos_wobble_y/4 + aiolos_wobble_large_y/24 + aiolos_wobble_huge_y/160}, 0, 1)",
      raw_spots = "spot_noise{x = x + aiolos_wobble_x/4 + aiolos_wobble_large_x/24 + aiolos_wobble_huge_x/160,\z
                              y = y + aiolos_wobble_y/4 + aiolos_wobble_large_y/24 + aiolos_wobble_huge_y/160,\z
                              seed0 = map_seed,\z
                              seed1 = 1,\z
                              candidate_spot_count = 1,\z
                              suggested_minimum_candidate_point_spacing = peak_spot_spacing,\z
                              skip_span = 1,\z
                              skip_offset = 0,\z
                              region_size = 128,\z
                              density_expression = peak_area / peaks_sq,\z
                              spot_quantity_expression = peak_spot_radius * peak_spot_radius,\z
                              spot_radius_expression = peak_spot_radius,\z
                              hard_region_target_quantity = 0,\z
                              spot_favorability_expression = peak_area,\z
                              basement_value = 0,\z
                              maximum_spot_basement_radius = peak_spot_radius}",
      peak_area = "lerp(aiolos_peaks_biome_full_pre_peak, 0, aiolos_starting_area)",
      peak_spot_radius = "380 * peaks",
      peak_spot_spacing = "380000 * peaks",
      peaks = "0.1 + 0.2 * slider_rescale(control:aiolos_peaks:size, 2) / slider_rescale(aiolos_scale_multiplier, 2)",
      peaks_sq = "peaks * peaks"
    }
  },
  {
    type = "noise-expression",
    name = "aiolos_starting_peak_spot",
    expression = "clamp(starting_spot_at_angle{ angle = aiolos_peaks_angle,\z
                                                distance = 10 * aiolos_starting_area_radius,\z
                                                radius = 150,\z
                                                x_distortion = aiolos_wobble_x/4 + aiolos_wobble_large_x/24 + aiolos_wobble_huge_x/160,\z
                                                y_distortion = aiolos_wobble_y/4 + aiolos_wobble_large_y/24 + aiolos_wobble_huge_y/160}, 0, 1)"
  },

  {
    type = "noise-expression",
    name = "aiolos_peaks_raw_peak",
    -- moderate influence for the outer 1/3 of the peak, ramp to high influence for the middle third, and maxed for the innter third
    expression = "0.5 * aiolos_peaks_raw_pre_peak + max(2 * aiolos_peak_spots, 10 * clamp((aiolos_peak_spots - 0.33) * 3, 0, 1))"
  },

  -- full range biomes with no clamping, good for away-from-edge targeting.
  {
    type = "noise-expression",
    name = "aiolos_peaks_biome_full",
    expression = "aiolos_peaks_raw_peak - max(aiolos_highlands_raw, aiolos_lowlands_raw)"
  },
  {
    type = "noise-expression",
    name = "aiolos_highlands_biome_full",
    expression = "aiolos_highlands_raw - max(aiolos_peaks_raw_peak, aiolos_lowlands_raw)"
  },
  {
    type = "noise-expression",
    name = "aiolos_lowlands_biome_full",
    expression = "aiolos_lowlands_raw - max(aiolos_peaks_raw_peak, aiolos_highlands_raw)"
  },

  -- clamped 0-1 biomes
  {
    type = "noise-expression",
    name = "aiolos_peaks_biome",
    expression = "clamp(aiolos_peaks_biome_full * aiolos_biome_contrast, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "aiolos_highlands_biome",
    expression = "clamp(aiolos_highlands_biome_full * aiolos_biome_contrast, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "aiolos_lowlands_biome",
    expression = "clamp(aiolos_lowlands_biome_full * aiolos_biome_contrast, 0, 1)"
  },


  {
    type = "noise-expression",
    name = "aiolos_resource_penalty",
    expression = "random_penalty_inverse(2.5, 1)"
  },
  {
    type = "noise-expression",
    name = "aiolos_wobble_x",
    expression = "aiolos_detail_noise{seed1 = 10, scale = 1/8, octaves = 2, magnitude = 4}"
  },
  {
    type = "noise-expression",
    name = "aiolos_wobble_y",
    expression = "aiolos_detail_noise{seed1 = 1010, scale = 1/8, octaves = 2, magnitude = 4}"
  },
  {
    type = "noise-expression",
    name = "aiolos_wobble_large_x",
    expression = "aiolos_detail_noise{seed1 = 20, scale = 1/2, octaves = 2, magnitude = 50}"
  },
  {
    type = "noise-expression",
    name = "aiolos_wobble_large_y",
    expression = "aiolos_detail_noise{seed1 = 1020, scale = 1/2, octaves = 2, magnitude = 50}"
  },
  {
    type = "noise-expression",
    name = "aiolos_wobble_huge_x",
    expression = "aiolos_detail_noise{seed1 = 30, scale = 2, octaves = 2, magnitude = 800}"
  },
  {
    type = "noise-expression",
    name = "aiolos_wobble_huge_y",
    expression = "aiolos_detail_noise{seed1 = 1030, scale = 2, octaves = 2, magnitude = 800}"
  },

  {
    type = "noise-expression",
    name = "peak_basis_noise",
    expression = "basis_noise{x = x,\z
                              y = y,\z
                              seed0 = map_seed,\z
                              seed1 = 13423,\z
                              input_scale = 1 / 500,\z
                              output_scale = 250}"
  },
  {
    type = "noise-expression",
    name = "peak_plasma",
    expression = "aiolos_plasma(102, 2.5, 10, 125, 625)"
  },
  {
    type = "noise-expression",
    name = "peak_elevation",
    expression = "lerp(max(clamp(peak_plasma, -100, 10000), peak_basis_noise),\z
                       peak_plasma,\z
                       clamp(0.7 * peak_basis_noise, 0, 1))\z
                  * (1 - clamp(aiolos_plasma(13, 2.5, 10, 0.15, 0.75), 0, 1))",
  },
  {
    type = "noise-expression",
    name = "peak_top_spots",
    expression = "clamp(aiolos_threshold(aiolos_peak_spots * 1.95 - 0.95,\z
                                           0.4 * clamp(aiolos_threshold(aiolos_peaks_biome, 0.5), 0, 1))\z
                                           * aiolos_threshold(clamp(aiolos_plasma(19553, 0.2, 0.4, 10, 20) / 20, 0, 1), 1.8),\z
                        0, 1)"
  }, {
    type = "noise-function",
    name = "crater_inverted_peak",
    parameters = {"spot", "inversion_point"},
    expression = "(inversion_point - abs(spot - inversion_point)) / inversion_point"
  },
  {
    type = "noise-expression",
    name = "aiolos_peaks_func",
    expression = "lerp(peak_elevation, 500 * crater_inverted_peak(aiolos_peak_spots, 0.95), clamp(aiolos_peak_spots * 3, 0, 1))\z
     + 300 * (aux - 0.5) * (aiolos_peak_spots + 0.5)"
  },
  {
    type = "noise-expression",
    name = "aiolos_highlands_func",
    expression = "500 + 0.001 * min(basis_noise{x = x,\z
                                                y = y,\z
                                                seed0 = map_seed,\z
                                                seed1 = 12643,\z
                                                input_scale = aiolos_scale_multiplier / 50 / scale,\z
                                                output_scale = 38},\z
                                    basis_noise{x = x,\z
                                                y = y,\z
                                                seed0 = map_seed,\z
                                                seed1 = 12643,\z
                                                input_scale = aiolos_scale_multiplier / 50 / scale,\z
                                                output_scale = 38})",
    local_expressions = {scale = 5}
  },
  {
    type = "noise-expression",
    name = "aiolos_hairline_cracks",
    expression = "aiolos_plasma(15223, 0.3 * aiolos_cracks_scale, 0.6 * aiolos_cracks_scale, 0.6, 1)"
  },
  {
    type = "noise-expression",
    name = "aiolos_flood_cracks_a",
    expression = "lerp(min(aiolos_plasma(7543, 2.5 * aiolos_cracks_scale, 4 * aiolos_cracks_scale, 0.5, 1),\z
                           aiolos_plasma(7443, 1.5 * aiolos_cracks_scale, 3.5 * aiolos_cracks_scale, 0.5, 1)),\z
                       1,\z
                       clamp(aiolos_detail_noise(241, 2 * aiolos_cracks_scale, 2, 0.25), 0, 1))"
  },
  {
    type = "noise-expression",
    name = "aiolos_flood_cracks_b",
    expression = "lerp(1,\z
                       min(aiolos_plasma(12223, 2 * aiolos_cracks_scale, 3 * aiolos_cracks_scale, 0.5, 1),\z
                           aiolos_plasma(152, 1 * aiolos_cracks_scale, 1.5 * aiolos_cracks_scale, 0.25, 0.5)) - 0.5,\z
                       clamp(0.2 + aiolos_detail_noise(821, 6 * aiolos_cracks_scale, 2, 0.5), 0, 1))"
  },
  {
    type = "noise-expression",
    name = "aiolos_flood_paths",
    -- make paths through the lava cracks, get walkable areas above 0, the first value is the path height
    expression = "0.4\z
                  - aiolos_plasma(1543, 1.5 * aiolos_cracks_scale, 3 * aiolos_cracks_scale, 0.5, 1)\z
                  + min(0, aiolos_detail_noise(121, aiolos_cracks_scale * 4, 2, 0.5))",
  },
  {
    type = "noise-expression",
    name = "aiolos_flood_lowlands_func",
    -- add hairline cracks to break up edges, crop hearilyie cracks peaks so it is more of a plates + cracks pattern
    -- lava level should be 0 and below, solid ground above 0
    expression = "min(max(aiolos_flood_cracks_a - 0.125, aiolos_flood_paths), aiolos_flood_cracks_b) + 0.3 * min(0.5, aiolos_hairline_cracks)"
  },

  {
    type = "noise-expression",
    name = "aiolos_elevation_offset",
    expression = "0"
  },
  {
    type = "noise-function",
    name = "aiolos_biome_blend",
    parameters = {"fade", "noise", "offset"},
    expression = "fade * (noise - offset)"
  },
  {
    type = "noise-expression",
    name = "aiolos_elev",
    expression = "aiolos_elevation_offset\z
                  + lerp(lerp(120 * aiolos_lowland_lakes_multisample,\z
                              20 + aiolos_peaks_func * aiolos_peaks_elevation_multiplier,\z
                              aiolos_peaks_biome),\z
                         aiolos_highlands_func,\z
                         aiolos_highlands_biome)",
    local_expressions =
    {
      aiolos_lowland_lakes_multisample = "min(multisample(aiolos_lowland_lakes, 0, 0),\z
                                               multisample(aiolos_lowland_lakes, 1, 0),\z
                                               multisample(aiolos_lowland_lakes, 0, 1),\z
                                               multisample(aiolos_lowland_lakes, 1, 1))"
    }
  },
  {
    type = "noise-expression",
    name = "aiolos_lowland_lakes",
    expression = "min(1,\z
                      -0.2 + aiolos_flood_lowlands_func\z
                      - 0.35 * clamp(aiolos_contrast(aiolos_detail_noise(763, 1/40, 4, 1.25), 0.95)\z
                                     * aiolos_contrast(aiolos_detail_noise(234, 1/50, 4, 1), 0.95)\z
                                     * aiolos_detail_noise(643, 1/70, 4, 0.7),\z
                                     0, 3))"
  },

  ---- RESOURCES
  {
    type = "noise-expression",
    name ="beryllium_peaks_range",
    expression = "400 * range_select_base(aiolos_peak_spots, 0.15, 10, 1, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "aiolos_resource_wobble_x",
    expression = "aiolos_wobble_x + 0.25 * aiolos_wobble_large_x"
  },
  {
    type = "noise-expression",
    name = "aiolos_resource_wobble_y",
    expression = "aiolos_wobble_y + 0.25 * aiolos_wobble_large_y"
  },
  {
    type = "noise-expression",
    name = "aiolos_starting_beryllium", -- don't use the slider for radius
    expression = "starting_spot_at_angle{ angle = aiolos_peaks_angle * aiolos_starting_direction,\z
                                          distance = 150 * aiolos_starting_area_radius,\z
                                          radius = 30 / 1.5,\z
                                          x_distortion = 0.5 * aiolos_resource_wobble_x,\z
                                          y_distortion = 0.5 * aiolos_resource_wobble_y}"
  },
  {
    type = "noise-function",
    name = "aiolos_spot_noise",
    parameters = {"seed", "count", "spacing", "span", "offset", "region_size", "density", "quantity", "radius", "favorability"},
    expression = "spot_noise{x = x + aiolos_resource_wobble_x,\z
                             y = y + aiolos_resource_wobble_y,\z
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
    name = "aiolos_lowlands_resource_favorability",
    expression = "clamp(((aiolos_lowlands_biome_full * (aiolos_starting_area < 0.01)) - buffer) * contrast, 0, 1)",
    local_expressions =
    {
      buffer = 0.2, -- push ores away from biome edges.
      contrast = 2
    }
  },
  {
    type = "noise-expression",
    name = "aiolos_peaks_resource_favorability",
    expression = "clamp(main_region - (aiolos_peak_spots > 0.85), 0, 1)",
    local_expressions =
    {
      buffer = 0.25, -- push ores away from biome edges.
      contrast = 2,
      main_region = "clamp(((aiolos_peaks_biome_full * (aiolos_starting_area < 0.01)) - buffer) * contrast, 0, 1)"
    }
  },
  {
    type = "noise-expression",
    name = "aiolos_lowlands_saline_favorability",
    expression = "clamp(((aiolos_lowlands_biome_full * (aiolos_starting_area < 0.01)) - buffer) * contrast, 0, 1)",
    local_expressions =
    {
      buffer = 0.25, -- push ores away from biome edges.
      contrast = 2
    }
  },
  {
    type = "noise-expression",
    name = "aiolos_highlands_resource_favorability",
    expression = "clamp(((aiolos_highlands_biome_full * (aiolos_starting_area < 0.01)) - buffer) * contrast, 0, 1)",
    local_expressions =
    {
      buffer = 0.25, -- push ores away from biome edges.
      contrast = 2
    }
  },
  {
    type = "noise-function",
    name = "aiolos_place_metal_spots",
    parameters = {"seed", "count", "offset", "size", "freq", "favor_biome"},
    expression = "min(clamp(-1 + 4 * favor_biome, -1, 1), metal_spot_noise - aiolos_hairline_cracks / 30000)",
    local_expressions =
    {
      metal_spot_noise = "aiolos_spot_noise{seed = seed,\z
                                              count = count,\z
                                              spacing = aiolos_ore_spacing,\z
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
    name = "aiolos_place_non_metal_spots",
    parameters = {"seed", "count", "offset", "size", "freq", "favor_biome"},
    expression = "min(2 * favor_biome - 1, aiolos_spot_noise{seed = seed,\z
                                                               count = count,\z
                                                               spacing = aiolos_ore_spacing,\z
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
    name = "aiolos_beryllium_size",
    expression = "slider_rescale(control:beryllium_ore:size, 2)"
  },
  {
    type = "noise-expression",
    name = "aiolos_beryllium_region",
    -- -1 to 1: needs a positive region for resources & decoratives plus a subzero baseline and skirt for surrounding decoratives.
    expression = "max(aiolos_starting_beryllium,\z
                      min(1 - aiolos_starting_circle,\z
                          aiolos_place_metal_spots(11953, 15, 1.5,\z
                                                     aiolos_beryllium_size * min(1.3, aiolos_ore_dist) * 10,\z
                                                     control:beryllium_ore:frequency,\z
                                                     aiolos_peaks_resource_favorability)))"
  },
  {
    type = "noise-expression",
    name = "aiolos_beryllium_probability",
    expression = "(control:beryllium_ore:size > 0) * (1000 * ((1 + aiolos_beryllium_region) * random_penalty_between(0.9, 1, 1) - 1))"
  },
  {
    type = "noise-expression",
    name = "aiolos_beryllium_richness",
    expression = "aiolos_beryllium_region * random_penalty_between(0.9, 1, 1)\z
                  * 3000 * aiolos_starting_area_multiplier\z
                  * control:beryllium_ore:richness / aiolos_beryllium_size"
  },
  {
    type = "noise-expression",
    name = "aiolos_ore_dist",
    expression = "max(1, distance / 2000)"
  },
  {
    type = "noise-expression",
    name = "aiolos_geyser_dist",
    expression = "max(1, distance / 4000)"
  },

  -- DECORATIVES
  {
    type = "noise-expression",
    name = "aiolos_decorative_knockout", -- small wavelength noise (5 tiles-ish) to make decoratives patchy
    expression = "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 1300000, octaves = 2, input_scale = 1/3}"
  },
  {
    type = "noise-expression",
    name = "aiolos_rock_noise",
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