-- Define the spiderdrone recipe
local spiderdrone_recipe = {
  type = "recipe",
  name = "spiderdrone",
  enabled = false,
  energy_required = 10,
  ingredients = {
    {"electric-engine-unit", 50},
    {"low-density-structure", 50},
    {"processing-unit", 50},
    {"flying-robot-frame", 1},
    {"se-rtg-equipment", 1},
  },
  result = "spiderdrone",
}

-- Define the spiderdrone technology
local spiderdrone_technology = {
  type = "technology",
  name = "spiderdrone-technology",
  icon = "__spiderdrone__/graphics/drone-icon.png",
  icon_size = 200,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "spiderdrone",
    },
  },
  prerequisites = {"advanced-electronics-2", "se-rtg-equipment"},
  unit = {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        { "se-rocket-science-pack", 1}
      },
      time = 30
  },
  order = "c-k-f-e",
}

-- Register the recipe and technology
data:extend{spiderdrone_recipe, spiderdrone_technology}