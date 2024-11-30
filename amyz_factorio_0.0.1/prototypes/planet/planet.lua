require("__amyz_factorio__/prototypes/planet/planet-selene-map-gen")
local planet_map_gen = require("__amyz_factorio__/prototypes/planet/planet-map-gen")

local effects = require("__core__.lualib.surface-render-parameter-effects")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")
--local planet_catalogue_vulcanus = require("__space-age__.prototypes.planet.procession-catalogue-vulcanus")

data:extend(
{
  {
    type = "planet",
    name = "selene",
    icon = "__amyz_factorio__/graphics/icons/selene.png",
    starmap_icon = "__amyz_factorio__/graphics/icons/starmap-planet-selene.png",
    starmap_icon_size = 512,
    gravity_pull = 10,
    distance = 15,
    orientation = 0.45,
    magnitude = 1.0,
    order = "f[selene]",
    subgroup = "planets",
    map_gen_settings = planet_map_gen.selene(),
    pollutant_type = nil,
    solar_power_in_space = 60,
    platform_procession_set =
    {
      arrival = {"planet-to-platform-b"},
      departure = {"platform-to-planet-a"}
    },
    planet_procession_set =
    {
      arrival = {"platform-to-planet-b"},
      departure = {"planet-to-platform-a"}
    },
   procession_graphic_catalogue = planet_catalogue_aquilo,
    surface_properties =
    {
      ["day-night-cycle"] = 30 * minute,
      ["magnetic-field"] = 10,
      pressure = 150,
      ["solar-power"] = 1,
      gravity = 5
    },
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_aquilo, 0.9),
    persistent_ambient_sounds =
    {
      base_ambience = {filename = "__space-age__/sound/wind/base-wind-aquilo.ogg", volume = 0.5},
      wind = {filename = "__space-age__/sound/wind/wind-aquilo.ogg", volume = 0.8},
      crossfade =
      {
        order = {"wind", "base_ambience"},
        curve_type = "cosine",
        from = {control = 0.35, volume_percentage = 0.0},
        to = {control = 2, volume_percentage = 100.0}
      },
      semi_persistent =
      {
        {
          sound =
          {
            variations = sound_variations("__space-age__/sound/world/semi-persistent/ice-cracks", 5, 0.7),
            advanced_volume_control =
            {
              fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {2, 100.0}}}
            }
          },
          delay_mean_seconds = 10,
          delay_variance_seconds = 5
        },
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/cold-wind-gust", 5, 0.3)},
          delay_mean_seconds = 15,
          delay_variance_seconds = 9
        }
      }
    },
    --entities_require_heating = true,
    surface_render_parameters =
    {
      fog = effects.default_fog_effect_properties(),
      -- clouds = effects.default_clouds_effect_properties(),

      -- Should be based on the default day/night times, ie
      -- sun starts to set at 0.25
      -- sun fully set at 0.45
      -- sun starts to rise at 0.55
      -- sun fully risen at 0.75
      day_night_cycle_color_lookup =
      {
        {0.0, "__space-age__/graphics/lut/vulcanus-1-day.png"},
        {0.20, "__space-age__/graphics/lut/vulcanus-1-day.png"},
        {0.45, "__space-age__/graphics/lut/vulcanus-2-night.png"},
        {0.55, "__space-age__/graphics/lut/vulcanus-2-night.png"},
        {0.80, "__space-age__/graphics/lut/vulcanus-1-day.png"},
      },

      terrain_tint_effect =
      {
        noise_texture =
        {
          filename = "__space-age__/graphics/terrain/vulcanus/tint-noise.png",
          size = 4096
        },

        offset = { 0.2, 0, 0.4, 0.8 },
        intensity = { 0.5, 0.2, 0.3, 1.0 },
        scale_u = { 3, 1, 1, 1 },
        scale_v = { 1, 1, 1, 1 },

        global_intensity = 0.3,
        global_scale = 0.1,
        zoom_factor = 3,
        zoom_intensity = 0.6
      }
    }
  },
-------------------------------------------------------------------------- LOCATIONS
  {
    type = "space-location",
    name = "solar-system-edge",
    icon = "__space-age__/graphics/icons/solar-system-edge.png",
    order = "k[solar-system-edge]",
    subgroup = "planets",
    gravity_pull = -10,
    distance = 50,
    orientation = 0.25,
    magnitude = 1.0,
    label_orientation = 0.15,
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.aquilo_solar_system_edge, 0.9)
  },
  {
    type = "space-location",
    name = "shattered-planet",
    icon = "__space-age__/graphics/icons/shattered-planet.png",
    starmap_icon = "__space-age__/graphics/icons/starmap-shattered-planet.png",
    starmap_icon_size = 512,
    order = "l[shattered-planet]",
    subgroup = "planets",
    gravity_pull = -10,
    distance = 80,
    orientation = 0.25,
    magnitude = 1.0,
    draw_orbit = false,
    fly_condition = true,
    auto_save_on_first_trip = false,
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.shattered_planet_trip, 0.8)
  },
-------------------------------------------------------------------------- PLANET CONNECTIONS
  {
    type = "space-connection",
    name = "nauvis-vulcanus",
    subgroup = "planet-connections",
    from = "nauvis",
    to = "vulcanus",
    order = "a",
    length = 15000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
  },
  {
    type = "space-connection",
    name = "nauvis-gleba",
    subgroup = "planet-connections",
    from = "nauvis",
    to = "gleba",
    order = "b",
    length = 15000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_gleba)
  },
  {
    type = "space-connection",
    name = "nauvis-fulgora",
    subgroup = "planet-connections",
    from = "nauvis",
    to = "fulgora",
    order = "c",
    length = 15000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_fulgora)
  },
  {
    type = "space-connection",
    name = "vulcanus-gleba",
    subgroup = "planet-connections",
    from = "vulcanus",
    to = "gleba",
    order = "d",
    length = 15000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
  },
  {
    type = "space-connection",
    name = "gleba-fulgora",
    subgroup = "planet-connections",
    from = "gleba",
    to = "fulgora",
    order = "e",
    length = 15000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_fulgora)
  },
  {
    type = "space-connection",
    name = "gleba-aquilo",
    subgroup = "planet-connections",
    from = "gleba",
    to = "aquilo",
    order = "f",
    length = 30000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
  },
  {
    type = "space-connection",
    name = "fulgora-aquilo",
    subgroup = "planet-connections",
    from = "fulgora",
    to = "aquilo",
    order = "g",
    length = 30000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_aquilo)
  },
  {
    type = "space-connection",
    name = "aquilo-solar-system-edge",
    subgroup = "planet-connections",
    from = "aquilo",
    to = "solar-system-edge",
    order = "h",
    length = 100000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.aquilo_solar_system_edge)
  },
  {
    type = "space-connection",
    name = "solar-system-edge-shattered-planet",
    subgroup = "planet-connections",
    from = "solar-system-edge",
    to = "shattered-planet",
    order = "i",
    length = 4000000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.shattered_planet_trip)
  }
})
