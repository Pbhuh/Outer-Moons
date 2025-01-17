local sounds = {}

sounds.asteroid_collision_silicaceous_small = {
  category = "game-effect",
  variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-collision-carbonic-small", 6, 0.3),
  aggregation = {max_count = 3, remove = true, count_already_playing = true},
  audible_distance_modifier = 0.75
}
sounds.asteroid_damage_silicaceous_small = {
  category = "game-effect",
  variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-carbonic-small", 7, 0.5),
  aggregation = {max_count = 3, remove = true, count_already_playing = true},
  audible_distance_modifier = 0.75
}
sounds.asteroid_damage_silicaceous_medium = {
  category = "game-effect",
  variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-carbonic-medium", 7, 0.45),
  aggregation = {max_count = 3, remove = true, count_already_playing = true},
}
sounds.asteroid_damage_silicaceous_big = {
  category = "game-effect",
  variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-carbonic-big", 5, 0.5),
  aggregation = {max_count = 2, remove = true, count_already_playing = true},
}
sounds.asteroid_damage_silicaceous_huge = {
  category = "game-effect",
  variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-carbonic-huge", 4, 0.7),
  aggregation = {max_count = 2, remove = true, count_already_playing = true},
  audible_distance_modifier = 2
}

return sounds
