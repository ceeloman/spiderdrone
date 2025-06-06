local sounds = require ("__base__.prototypes.entity.sounds")

local scale = 0.6
--item
local spiderdrone_item = table.deepcopy(data.raw["item-with-entity-data"]["spidertron"])
spiderdrone_item.name = "spiderdrone"
spiderdrone_item.place_result = "spiderdrone"
spiderdrone_item.subgroup = "logistic-network"
spiderdrone_item.order = "a[robot]-a[spiderdrone]"
spiderdrone_item.icon = "__spiderdrone__/graphics/spiderdrone.png"
spiderdrone_item.icon_tintable = "__spiderdrone__/graphics/spiderdrone-tintable.png"
spiderdrone_item.icon_tintable_mask = "__spiderdrone__/graphics/spiderdrone-tintable-mask.png"
spiderdrone_item.icon_size = 64
spiderdrone_item.icon_mipmaps = 4
spiderdrone_item.weight = 250,
data:extend{spiderdrone_item}

--equipment grid
local spiderdrone_equipment_grid = table.deepcopy(data.raw["equipment-grid"]["spidertron-equipment-grid"])
spiderdrone_equipment_grid.name = "spiderdrone-equipment-grid"
spiderdrone_equipment_grid.width = 6
spiderdrone_equipment_grid.height = 6
spiderdrone_equipment_grid.equipment_categories = {"armor"}
data:extend{spiderdrone_equipment_grid}

--entity
local spiderdrone_entity = table.deepcopy(data.raw["spider-vehicle"]["spidertron"])
spiderdrone_entity.name = "spiderdrone"
spiderdrone_entity.type = "spider-vehicle"
spiderdrone_entity.localised_name = {"entity-name.spiderdrone"}
spiderdrone_entity.icon = "__spiderdrone__/graphics/drone-icon.png"
spiderdrone_entity.equipment_grid = "spiderdrone-equipment-grid"
spiderdrone_entity.inventory_size = 20
spiderdrone_entity.collision_box = {{-1 * scale, -1 * scale}, {1 * scale, 1 * scale}}
spiderdrone_entity.selection_box = {{-1 * scale, -1 * scale}, {1 * scale, 1 * scale}}
spiderdrone_entity.drawing_box = {{-3 * scale, -4 * scale}, {3 * scale, 2 * scale}}
spiderdrone_entity.icon_size = 200
spiderdrone_entity.mined_sound = {filename = "__core__/sound/deconstruct-large.ogg", volume = 0.8}
spiderdrone_entity.open_sound = {filename = "__base__/sound/spidertron/spidertron-door-open.ogg", volume = 0.35}
spiderdrone_entity.close_sound = {filename = "__base__/sound/spidertron/spidertron-door-close.ogg", volume = 0.4}
spiderdrone_entity.sound_minimum_speed = 0.3
spiderdrone_entity.sound_scaling_ratio = 0.1
spiderdrone_entity.allow_passengers = false
spiderdrone_entity.se_allow_in_space = true
spiderdrone_entity.working_sound =
{
  sound =
  {
    filename = "__base__/sound/spidertron/spidertron-vox.ogg",
    volume = 0.35
  },
  activate_sound =
  {
    filename = "__base__/sound/spidertron/spidertron-activate.ogg",
    volume = 0.5
  },
  deactivate_sound =
  {
    filename = "__base__/sound/spidertron/spidertron-deactivate.ogg",
    volume = 0.5
  },
  match_speed_to_activity = true
}
spiderdrone_entity.weight = 0.4
spiderdrone_entity.braking_force = 1
spiderdrone_entity.friction_force = 0.4
spiderdrone_entity.movement_speed = 4
spiderdrone_entity.flags = {"placeable-neutral", "player-creation", "placeable-off-grid"}
spiderdrone_entity.collision_mask = { layers = { } }
spiderdrone_entity.minable = {
  result = "spiderdrone", 
  mining_time = 0.25,       
}
--spiderdrone_entity.mining_time = 0.25
spiderdrone_entity.priority = 50
spiderdrone_entity.max_health = 800
spiderdrone_entity.resistances =
{
  {
    type = "fire",
    decrease = 15,
    percent = 60
  },
  {
    type = "physical",
    decrease = 15,
    percent = 60
  },
  {
    type = "impact",
    decrease = 50,
    percent = 80
  },
  {
    type = "explosion",
    decrease = 20,
    percent = 75
  },
  {
    type = "acid",
    decrease = 0,
    percent = 70
  },
  {
    type = "laser",
    decrease = 0,
    percent = 70
  },
  {
    type = "electric",
    decrease = 0,
    percent = 70
  }
}
spiderdrone_entity.energy_per_hit_point = 1
spiderdrone_entity.guns = {"spiderdrone-machine-gun-1", "spiderdrone-machine-gun-2"}
spiderdrone_entity.equipment_grid = "spiderdrone-equipment-grid"
spiderdrone_entity.trash_inventory_size = 10
spiderdrone_entity.height = 2
spiderdrone_entity.torso_rotation_speed = 0.05
spiderdrone_entity.chunk_exploration_radius = 3
spiderdrone_entity.selection_priority = 60
spiderdrone_entity.graphics_set = spidertron_torso_graphics_set(0.4)
spiderdrone_entity.base_render_layer = "smoke"
spiderdrone_entity.render_layer = "air-object"
spiderdrone_entity.energy_source = 
{
  type = "void",
}
spiderdrone_entity.movement_energy_consumption = "20kW"
spiderdrone_entity.automatic_weapon_cycling = true
spiderdrone_entity.chain_shooting_cooldown_modifier = 0.5
spiderdrone_entity.spider_engine =
{
  legs =
  {
    { -- 1
      leg = "spiderdrone-leg",
      mount_position = {0, -1},
      ground_position = {0, -1},
      blocking_legs = {1},
      leg_hit_the_ground_trigger = nil,
      walking_group = 1
    }
  },
  legs_movement_acceleration = 10, 
  legs_movement_force = 10, 
  walking_speed_modifier = 10,
  military_target = "spidertron-military-target"
}
spiderdrone_entity.minimap_representation =
{
  filename = "__spiderdrone__/graphics/drone-map.png",
  flags = {"icon"},
  size = {128, 128},
  scale = 0.25
}

local spiderdrone = table.deepcopy(spiderdrone_entity)

-- Update specific properties for the spiderdrone
spiderdrone.name = "spiderdrone"
spiderdrone.localised_name = {"entity-name.spiderdrone"}

-- Define the leg entity
local leg =
{
  type = "spider-leg",
  name = "spiderdrone-leg",
  localised_name = {"spidertron-leg"},
  collision_box = nil,
  collision_mask = { layers = { } },
  selection_box = {{-0, -0}, {0, 0}},
  icon = "__base__/graphics/icons/spidertron.png",
  icon_size = 64, icon_mipmaps = 4,
  walking_sound_volume_modifier = 0,
  target_position_randomisation_distance = 0,
  minimal_step_size = 0,
  knee_height = 2.5 * scale,
  knee_distance_factor = 0.4 * scale,
  working_sound = nil,
  base_position_selection_distance = 6 * scale,
  part_length = 10,
  initial_movement_speed = 10,  -- Adjust this value
  movement_acceleration = 10,  -- Adjust this value
  movement_based_position_selection_distance = 4,  -- Adjust this value
  max_health = 200,
  selectable_in_game = false,
  graphics_set = create_spidertron_leg_graphics_set(0, 1)
}

-- Update specific properties for the spiderdrone graphics set
spiderdrone.graphics_set.render_layer = "air-entity-info-icon"
spiderdrone.graphics_set.base_render_layer = "air-object"
spiderdrone.graphics_set.autopilot_path_visualisation_line_width = 0.1
spiderdrone.graphics_set.autopilot_path_visualisation_line_height = 1
spiderdrone.graphics_set.autopilot_path_visualisation_on_map_line_width = 0.1
spiderdrone.graphics_set.autopilot_destination_visualisation = util.empty_sprite()
spiderdrone.graphics_set.autopilot_destination_queue_on_map_visualisation = util.empty_sprite()
spiderdrone.graphics_set.autopilot_destination_on_map_visualisation = util.empty_sprite()
spiderdrone.graphics_set.light =
{
  {
    type = "oriented",
    minimum_darkness = 0.3,
    picture =
    {
      filename = "__core__/graphics/light-cone.png",
      priority = "extra-high",
      flags = { "light" },
      scale = 1,
      width = 200,
      height = 200,
      shift = {0, -1}
    },
    source_orientation_offset = 0,
    shift = {0, (-200/32)- 0.5},
    add_perspective = false,
    size = 2,
    intensity = 0.6,
    color = {r = 0.92, g = 0.77, b = 0.3}
  }
}
spiderdrone.graphics_set.eye_light.size = 0.1

-- Add entities to data.raw
data:extend{spiderdrone_entity, spiderdrone, leg}

data:extend({
  {
    type = "gun",
    name = "spiderdrone-machine-gun-1",
    localised_name = {"item-name.spiderdrone-machine-gun"},
    icon = "__base__/graphics/icons/submachine-gun.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    flags = {"not-stackable", "hide-from-bonus-gui"},    order = "z[spider]-a[machine-gun]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "bullet",
      cooldown = 4,
      movement_slow_down_factor = 0.7,
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0},
        --creation_distance = 0,
        creation_distance = -0.6875 * scale,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },
      projectile_center = {0,2.2},
      --projectile_center = {0.15625 * scale, (-0.07812-2) * scale},
      projectile_creation_distance = 1 * scale,
      range = 20,
      sound = sounds.submachine_gunshot
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = "spiderdrone-machine-gun-2",
    localised_name = {"item-name.spiderdrone-machine-gun"},
    icon = "__base__/graphics/icons/submachine-gun.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "gun",
    flags = {"not-stackable", "hide-from-bonus-gui"},    order = "z[spider]-a[machine-gun]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "bullet",
      cooldown = 4,
      movement_slow_down_factor = 0.7,
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0},
        creation_distance = -0.6875 * scale,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },
      projectile_center = {0,2.2},
      projectile_creation_distance = 1 * scale,
      range = 20,
      sound = sounds.submachine_gunshot
    },
    stack_size = 1
  }
})

-- Create the custom remnant prototype
local spiderdrone_remnants = table.deepcopy(data.raw["corpse"]["spidertron-remnants"])
spiderdrone_remnants.name = "spiderdrone-remnants"
spiderdrone_remnants.time_before_removed = 60 * 60 * 15 -- 15 minutes
spiderdrone_remnants.selection_bounding_box = {{-0.6, -0.6}, {0.6, 0.6}}
spiderdrone_remnants.collision_bounding_box = {{-0.6, -0.6}, {0.6, 0.6}}
spiderdrone_remnants.sticker_box = {{-0.6, -0.6}, {0.6, 0.6}}


-- Define the base remnant sprite
spiderdrone_remnants.animation = {
  filename = "__spiderdrone__/graphics/spiderdrone-remnants.png",
  width = 448,
  height = 448,
  frame_count = 1,
  direction_count = 1,
  shift = util.by_pixel(0, 0),
  scale = 0.6
}

-- Define the mask for colorization
spiderdrone_remnants.animation_overlay = {
  filename = "__spiderdrone__/graphics/spiderdrone-remnants-mask.png",
  width = 448,
  height = 448,
  frame_count = 1,
  direction_count = 1,
  shift = util.by_pixel(0, 0),
  scale = 0.6,
  apply_runtime_tint = true
}

-- Set the render layer for the overlay
spiderdrone_remnants.animation_overlay_render_layer = "object"

-- Update the spiderdrone entity to use this custom remnant
local spiderdrone = data.raw["spider-vehicle"]["spiderdrone"]
if spiderdrone then
  spiderdrone.corpse = "spiderdrone-remnants"
end

-- Extend the new remnant into the game data
data:extend{spiderdrone_remnants}

if mods["space-exploration"] then
  require "data/technologies-se"
else
  require "data/technologies"
end