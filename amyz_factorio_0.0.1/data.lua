require("__amyz_factorio__.prototypes.entity.entities")
require("__amyz_factorio__.prototypes.entity.resources")
require("__amyz_factorio__.prototypes.autoplace-controls")
require("__amyz_factorio__.prototypes.planet.planet-map-gen")
require("__amyz_factorio__.prototypes.planet.planet")
require("__amyz_factorio__.prototypes.item.item")
require("__amyz_factorio__.prototypes.item-groups")
require("__amyz_factorio__.prototypes.fluid")
require("__amyz_factorio__.prototypes.decorative.decoratives-selene")
require("__amyz_factorio__.prototypes.tile.tiles-selene")

planets = {
"nauvis",
}

for _, name in pairs(planets) do
	local prototype = data.raw["space-location"][name] or data.raw["planet"][name]
	if not prototype then
		error("missing space location: "..name)
	end
	prototype.starmap_icon = "__amyz_factorio__/graphics/icons/starmap-planet-"..name..".png"
	prototype.starmap_icon_size = 4096
end
	