-- storage table to store spiderdrone names
storage.spiderdrone_names = storage.spiderdrone_names or {}

-- Function to generate a random backer name
local function random_backer_name()
  local backer_names = game.backer_names
  local index = math.random(#backer_names)
  return backer_names[index]
end

-- Function to check if an entity is a spiderdrone
local function is_spiderdrone(entity)
  return entity.valid and entity.type == "spider-vehicle" and entity.name == "spiderdrone"
end

script.on_event(defines.events.on_built_entity, function(event)
  local entity = event.entity or event.created_entity
  
  -- Check if we have a valid entity
  if not entity or not entity.valid then
    return
  end

  -- Check if the built entity is a spiderdrone
  if entity.name == "spiderdrone" then
    local player = game.get_player(event.player_index)
    if player then
      -- Function to check if colors are approximately equal
      local function colors_equal(color1, color2)
        local epsilon = 0.001  -- Tolerance for floating point comparison
        return math.abs(color1.r - color2.r) < epsilon and
               math.abs(color1.g - color2.g) < epsilon and
               math.abs(color1.b - color2.b) < epsilon and
               math.abs((color1.a or 1) - (color2.a or 1)) < epsilon
      end

      -- Check if the entity doesn't have a color or has the default color
      local default_color = {r = 1.000, g = 0.500, b = 0.000, a = 0.500}
      if not entity.color or colors_equal(entity.color, default_color) then
        entity.color = player.color
      end

      -- Print the spiderdrone's color in RGBA format
      local color = entity.color
      local color_string = string.format("Spiderdrone color: R: %.3f, G: %.3f, B: %.3f, A: %.3f", 
                                         color.r, color.g, color.b, color.a or 1)
      --player.print(color_string)

      -- Set the spiderdrone to follow the player
      entity.follow_target = player.character
    end

    -- Generate a unique ID for the spiderdrone
    local entity_id = entity.unit_number

    -- Check if the entity doesn't have a label
    if not entity.entity_label or entity.entity_label == "" then
      -- Assign a backer name
      local backer_name = random_backer_name()
      entity.entity_label = backer_name

      -- Store the name in the storage table with the entity ID as the key
      storage.spiderdrone_names = storage.spiderdrone_names or {}
      storage.spiderdrone_names[entity_id] = backer_name
    else
      -- If the entity already has a label, store it in the storage table
      storage.spiderdrone_names = storage.spiderdrone_names or {}
      storage.spiderdrone_names[entity_id] = entity.entity_label
    end
  end
end)