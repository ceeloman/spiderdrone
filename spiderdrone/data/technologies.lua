-- data/technologies
-- Define the spiderdrone recipe
local spiderdrone_recipe = {
  type = "recipe",
  name = "spiderdrone",
  enabled = false,
  energy_required = 10,
  ingredients = {
    {type = "item", name = "electric-engine-unit", amount = 50},
    {type = "item", name = "low-density-structure", amount = 50},
    {type = "item", name = "processing-unit", amount = 50},
    {type = "item", name = "flying-robot-frame", amount = 1},
    {type = "item", name = "fusion-reactor-equipment", amount = 1},
  },
  results = {
    {type = "item", name = "spiderdrone", amount = 1}
  }
}
-- Define the spiderdrone technology
local spiderdrone_technology = {
  type = "technology",
  name = "spiderdrone-technology",
  --localised_name = "spiderdrone-technology",
  icon = "__spiderdrone__/graphics/drone-icon.png",
  icon_size = 200,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "spiderdrone",
    },
  },
  prerequisites = (function()
    local prereqs = {"fission-reactor-equipment", "destroyer"}
    
    -- Check for Spiderbots mod
    if mods["spiderbots"] then
      table.insert(prereqs, "spiderbots")
    end
    
    return prereqs
  end)(),
  unit = {
    count = 1000,
    ingredients =
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"military-science-pack", 1},
      {"chemical-science-pack", 1},
      {"utility-science-pack", 1},
    },
    time = 30
  },
  order = "c-k-f-e",
}

-- Register the recipe and technology
data:extend{spiderdrone_recipe, spiderdrone_technology}