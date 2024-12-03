require("__base__/prototypes/factoriopedia-util");
local simulations = {}

simulations.factoriopedia_metallic_regolith = { init = make_resource("regolith") }
simulations.factoriopedia_aluminum_ore = { init = make_resource("aluminum-ore") }
simulations.factoriopedia_titanium_ore = { init = make_resource("titanium-ore") }

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
