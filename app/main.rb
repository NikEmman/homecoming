require_relative 'player'
require_relative 'floor'
require_relative 'furniture'

def tick(args)
  args.state.starting_position ||= { col: 3, row: 5, direction: 'up' }
  # args.state.player ||= Player.up(args)
  args.state.goal_positions ||= [{ col: 5, row: 6 }, { col: 6, row: 7 }, { col: 9, row: 8 }]
  args.state.player_grid ||= args.state.starting_position.clone

  args.state.move_queue ||= []
  args.state.executing ||= false
  args.state.direction ||= 'up'
  args.state.frame_delay ||= 60
  args.state.missed_goal ||= false

  # custom grid size for grid and grid boxes
  args.state.grid_box.h ||= 80
  args.state.grid_box.w ||= 80
  args.state.grid_total.h ||= 9
  args.state.grid_total.w ||= 16

  args.state.furniture ||= [Furniture.sofa_back(1, 0, 2, args),
                            Furniture.sofa_front(6, 5, args),
                            Furniture.sofa_left(10, 3, 2, args),
                            Furniture.sofa_right(8, 3, args),
                            Furniture.fridge(8, 1, 1, args),
                            Furniture.oven(9, 3, 2, args),
                            Furniture.single_sofa_front(5, 5, 2, args),
                            Furniture.single_sofa_back(10, 5, args),
                            Furniture.single_sofa_left(9, 5, args)]

  args.state.player_sprites ||= {
    up: Player.up(args),
    down: Player.down(args),
    left: Player.left(args),
    right: Player.right(args)
  }
  args.state.player ||= args.state.player_sprites[args.state.direction.to_sym].dup
  args.state.reset_at_tick ||= nil

  unless args.state.executing
    display_commands(args)
    display_reset_instruction(args)
  end

  cover_floor(args, 'hardwood')

  display_furniture(args)

  args.state.goal_positions.each do |pos|
    args.outputs.primitives << {
      x: pos.col * 80,
      y: pos.row * 80,
      w: 80,
      h: 80,
      r: 0,
      g: 255,
      b: 0,
      a: 100 + 50 * Math.sin(args.state.tick_count / 20.0),
      primitive_marker: :solid
    }
  end
  (1..args.state.grid_total.w).each do |i|
    args.outputs.primitives << vertical_line(i, args)
  end
  (1..args.state.grid_total.h).each do |i|
    args.outputs.primitives << horizontal_line(i, args)
  end

  args.outputs.sprites << args.state.player

  # Execute scheduled reset, see below in Move processor, PLAYER MOVEMENT
  if args.state.reset_at_tick && args.state.tick_count >= args.state.reset_at_tick
    reset_player(args)
    args.state.reset_at_tick = nil
  end

  display_missed_goal(args) if args.state.missed_goal

  # execute queued moves by pressing 'e'
  args.state.executing = true if args.inputs.keyboard.key_down.e

  if args.inputs.keyboard.key_down.d && !args.state.executing
    args.state.move_queue.pop
    args.state.executing = false
  end
  # clear queued moves by pressing 'c'
  if args.inputs.keyboard.key_down.c !args.state.executing
    args.state.move_queue.clear
    args.state.executing = false
  end

  # queue moves with arrow keys
  unless args.state.executing
    args.state.move_queue << 'up' if args.inputs.keyboard.key_down.up
    args.state.move_queue << 'down'  if args.inputs.keyboard.key_down.down
    args.state.move_queue << 'left'  if args.inputs.keyboard.key_down.left
    args.state.move_queue << 'right' if args.inputs.keyboard.key_down.right
  end

  # process move queue
  return unless args.state.executing

  # PLAYER MOVEMENT

  # Move processor
  if args.state.tick_count % args.state.frame_delay == 0 && args.state.move_queue.any?
    direction = args.state.move_queue.first
    next_pos = next_grid_position(args.state.player_grid, direction)

    if blocked?(args, next_pos)
      args.state.missed_goal = true
      args.state.reset_at_tick = args.state.tick_count + 120 # Schedule reset in 2 seconds
      args.state.move_queue.shift # discard blocked move
    else
      Player.move_direction(args, args.state.move_queue.shift)
    end

  elsif args.state.executing && args.state.move_queue.empty?
    args.state.executing = false

    # Check if player reached the goal
    if reached_goal?(args)
      update_player_position(args)
      reject_goal(args)
    else
      args.state.missed_goal = true
      args.state.reset_at_tick = args.state.tick_count + 120 # Schedule reset in 2 seconds

    end

  end
end

def vertical_line(column, args)
  {
    x: column * args.state.grid_box.h,
    y: 0,
    w: 2,
    h: args.state.grid_total.w * args.state.grid_box.w,
    r: 92,
    g: 120,
    b: 230,
    a: 128,
    primitive_marker: :solid
  }
end

def horizontal_line(row, args)
  {
    x: 0,
    y: row * args.state.grid_box.h,
    w: args.state.grid_total.w * args.state.grid_box.w,
    h: 2,
    r: 92,
    g: 120,
    b: 230,
    a: 128,
    primitive_marker: :solid
  }
end

def display_reset_instruction(args)
  return if args.state.move_queue.empty?

  args.outputs.labels << { x: 30, y: 40, text: 'Press C to clear queue, or D to delete last step', size_enum: 7, r: 255, g: 255,
                           b: 255 }
end

def display_missed_goal(args)
  args.outputs.labels << { x: 100, y: 700, text: 'Missed the goal! Resetting position...', size_enum: 20, r: 255, g: 0,
                           b: 0 }
end

def display_commands(args)
  args.state.move_queue.each_with_index do |command, index|
    args.outputs.labels << {
      x: 30 + (index * 60),
      y: 710,
      text: command_display(command),
      size_enum: 20,
      r: 255,
      g: 255,
      b: 255
    }
  end
end

def command_display(command)
  case command
  when 'up'    then '⇧'
  when 'down'  then '⇩'
  when 'left'  then '⇦'
  when 'right' then '⇨'
  end
end

def reset_player(args)
  args.state.player_grid = args.state.starting_position.clone
  args.state.direction = args.state.starting_position[:direction]

  sprite = args.state.player_sprites[args.state.direction.to_sym].dup
  sprite.x = args.state.player_grid.col * args.state.grid_box.w
  sprite.y = args.state.player_grid.row * args.state.grid_box.h
  args.state.player = sprite
  args.state.missed_goal = false
end

def reached_goal?(args)
  grid = args.state.player_grid
  goals = args.state.goal_positions
  goals.any? { |goal| grid[:col] == goal[:col] && grid[:row] == goal[:row] }
end

def update_player_position(args)
  args.state.starting_position = {
    col: args.state.player_grid[:col],
    row: args.state.player_grid[:row],
    direction: args.state.direction
  }
end

def reject_goal(args)
  grid = args.state.player_grid
  goals = args.state.goal_positions
  goals.reject! { |goal| grid[:col] == goal[:col] && grid[:row] == goal[:row] }
end

def cover_floor(args, material = 'tarp')
  (0..6).each do |row|
    (0..14).each do |col|
      args.outputs.sprites << Floor.send(material, row, col)
    end
  end
end

def display_furniture(args)
  args.state.furniture.each do |f|
    args.outputs.sprites << f
  end
end

def blocked?(args, next_pos)
  # Grid bounds
  return true if outside_grid_x?(args, next_pos) || outside_grid_y?(args, next_pos)

  # Sprite collision (optional)
  player_sprite = args.state.player
  furniture_sprites = args.outputs.sprites.select { |s| s[:path].include?('FurnitureState') }
  return true if furniture_sprites.any? { |f| args.geometry.intersect_rect?(player_sprite, f) }

  false
end

def outside_grid_x?(args, next_pos)
  next_pos[:col] < 0 || next_pos[:col] >= args.state.grid_total.w
end

def outside_grid_y?(args, next_pos)
  next_pos[:row] < 0 || next_pos[:row] >= args.state.grid_total.h
end

def will_collide_with_furniture?(args)
  player_sprite = args.state.player
  # furniture_sprites = args.outputs.sprites.select { |s| s[:path].include?('FurnitureState') }
  args.state.furniture.any? { |f| args.geometry.intersect_rect?(player_sprite, f) }
end

def next_grid_position(grid, direction)
  case direction
  when 'up'    then { col: grid[:col], row: grid[:row] + 1 }
  when 'down'  then { col: grid[:col], row: grid[:row] - 1 }
  when 'left'  then { col: grid[:col] - 1, row: grid[:row] }
  when 'right' then { col: grid[:col] + 1, row: grid[:row] }
  end
end
