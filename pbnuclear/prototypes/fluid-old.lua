data:extend(
{
  {
    type = "fluid",
    name = "uranium-sludge",
    subgroup = "fluid",
    default_temperature = 25,
    base_color = {0.75, 0.65, 0.1},
    flow_color = {0.7, 1, 0.1},
    icon = "__pbnuclear__/graphics/icons/fluid/uranium-sludge.png",
    order = "b[new-fluid]-f[gleba]-a[ethanol]"
  },
  {
    type = "fluid",
    name = "uranium-hexafluoride",
    subgroup = "fluid",
    default_temperature = 25,
    base_color = {0.2, 0.4, 0.05},
    flow_color = {0.5, 0.9, 0.4},
    icon = "__pbnuclear__/graphics/icons/fluid/uranium-hexafluoride.png",
    order = "b[new-fluid]-f[aquilo]-a[uf6]"
  },
  {
    type = "fluid",
    name = "uranium-tetrafluoride",
    subgroup = "fluid",
    default_temperature = 25,
    base_color = {0.2, 0.4, 0.05},
    flow_color = {0.5, 0.9, 0.4},
    icon = "__pbnuclear__/graphics/icons/fluid/uranium-hexafluoride.png",
    order = "b[new-fluid]-f[aquilo]-a[uf4]"
  },
  {
    type = "fluid",
    name = "uranium-235-hexafluoride",
    subgroup = "fluid",
    default_temperature = 25,
    base_color = {0.3, 0.5, 0.07},
    flow_color = {0.55, 0.95, 0.45},
    icon = "__pbnuclear__/graphics/icons/fluid/uranium-235-hexafluoride.png",
    order = "b[new-fluid]-f[aquilo]-a[u235f6]"
  },
  {
    type = "fluid",
    name = "uranium-238-hexafluoride", --depleted hexafluoride
    subgroup = "fluid",
    default_temperature = 25,
    base_color = {0.15, 0.32, 0.03},
    flow_color = {0.43, 0.75, 0.31},
    icon = "__pbnuclear__/graphics/icons/fluid/uranium-238-hexafluoride.png",
    order = "b[new-fluid]-f[aquilo]-a[u238f6]"
  }
})
