local smoke_animations = require("__base__.prototypes.entity.smoke-animations")
local trivial_smoke = smoke_animations.trivial_smoke

data:extend({
  --silicaceous smoke
  trivial_smoke{
    name = "asteroid-smoke-silicaceous-chunk",
    color = {0.22352, 0.2556, 0.26592, 0.4},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 80,
    start_scale = 0.5,
    end_scale = 0.7,
    spread_duration = 1,
    movement_slow_down_factor = 1,
  },
  trivial_smoke{
    name = "asteroid-smoke-silicaceous-small",
    color = {0.22352, 0.2556, 0.26592, 0.4},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 90,
    start_scale = 0.5,
    end_scale = 1,
    spread_duration = 6,
    movement_slow_down_factor = 1,
  },
  trivial_smoke{
    name = "asteroid-smoke-silicaceous-medium",
    color = {0.22352, 0.2556, 0.26592, 0.4},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 100,
    start_scale = 0.8,
    end_scale = 1,
    fade_in_duration = 2,
    spread_duration = 10,
    movement_slow_down_factor = 1,
  },
  trivial_smoke{
    name = "asteroid-smoke-silicaceous-big",
    color = {0.22352, 0.2556, 0.26592, 0.4},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 120,
    start_scale = 1,
    end_scale = 1.1,
    spread_duration = 15,
    movement_slow_down_factor = 1,
  },
  trivial_smoke{
    name = "asteroid-smoke-silicaceous-huge",
    color = {0.22352, 0.2556, 0.26592, 0.4},
    affected_by_wind = false,
    render_layer = "elevated-object",
    duration = 140,
    start_scale = 1,
    end_scale = 1.4,
    fade_in_duration = 2,
    spread_duration = 20,
    movement_slow_down_factor = 1,
  }
})
