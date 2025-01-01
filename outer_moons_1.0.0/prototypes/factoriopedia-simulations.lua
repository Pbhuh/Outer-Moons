require("__base__/prototypes/factoriopedia-util");
local simulations = {}

simulations.factoriopedia_lead_ore = { init = make_resource("lead-ore") }
simulations.factoriopedia_nickel_ore = { init = make_resource("nickel-ore") }
simulations.factoriopedia_aluminum_ore = { init = make_resource("aluminum-ore") }
simulations.factoriopedia_silicon_ore = { init = make_resource("silicon-ore") }
simulations.factoriopedia_metallic_regolith = { init = make_resource("metallic-regolith") }
simulations.factoriopedia_titanium_ore = { init = make_resource("titanium-ore") }

simulations.factoriopedia_turbo_underground_belt =
{
  init =
  [[
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_zoom = 1.4
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqVkM8KgzAMxt8l5yr4p8X1VcYYVoMENJXajon47mv1sMMOslPIl+T7JdnAjAFnR+xBb0Cd5QX0fYOFBm7HpHE7IWjwwRmbBe7RDc7GmBkcPewCKGpv0MX+EIDsyROeHkeyPjlMBl1sEBdeAma7xHHLiRstszqXAlbQVS4jqCeH3VmuBfh1Tl7Ec0hr/ODKv3HqmmaDP3DxVPI4ReX7PwEvdMsxUDZF3VRSKVVLJW/7/gFK3nh4",
      position = {0, 0}
    }
  ]]
}
simulations.factoriopedia_hyper_underground_belt =
{
  init =
  [[
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_zoom = 1.4
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqVkMsOgjAQRf9l1pUE0qrwK8YYHhOcBKakDyMh/XcHWLhwoS6adm4757RdoBkiTo44QLUAtZY9VJcFPPVcD2vG9YhQwX2e0B0id+h6Z2U+NDgESApIsidUeboqQA4UCHfGVsw3jmODTg6oLywFk/XSbnn1rkidGQWzLExmxNSRw3bf1wqCUARGPMX1Hh++4m9fcfrBZ2PYhPJaCjhK8v5CBQ90fmswx6LUZWlk6Pycp/QCgnN5EA==",
      position = {0, 0}
    }
  ]]
}
simulations.factoriopedia_vacuum_underground_belt =
{
  init =
  [[
    game.simulation.camera_position = {0, 0.5}
    game.simulation.camera_zoom = 1.4
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqVkNsKgzAMht8l11XQ6VBfZYzhIUhA09KDTMR3X6oXu9jFtovQ5G/zf0026KaAxhJ7aDagXrOD5raBo5HbKWrczggNLG0fwpwEHtCOVsuZdDh52BWQaE9osv2uANmTJzxNjmJ9cJg7tPJAfTNTYLSTfs2RHD0vaalglaRKS0ENZLE/7wsFfjXRjdiE+JEPYP4/MK9+AOrgD6LMSx5nUd5bVLCgdUdDec3roq5LiSKrsn1/ASxpelE=",
      position = {0, 0}
    }
  ]]
}

simulations.factoriopedia_cliff_selene =
{
  planet = "selene",
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_position = {0, 2.5}
    for x = -8, 8, 1 do
      for y = -3, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "selene-dust-3"}}
      end
    end
    for x = -8, 8, 4 do
      game.surfaces[1].create_entity{name = "cliff-selene", position = {x, 0}, cliff_orientation = "west-to-east"}
    end
  ]]
}

simulations.factoriopedia_cliff_mefitis =
{
  planet = "mefitis",
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_position = {0, 2.5}
    for x = -8, 8, 1 do
      for y = -3, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "selene-dust-3"}}
      end
    end
    for x = -8, 8, 4 do
      game.surfaces[1].create_entity{name = "cliff-selene", position = {x, 0}, cliff_orientation = "west-to-east"}
    end
  ]]
}

return simulations
