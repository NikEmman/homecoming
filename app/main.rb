require_relative 'player'
require_relative 'floor'
require_relative 'furniture'
require_relative 'sounds'
require_relative 'carpet'

def tick(args)
  args.state.scene ||= 'gameplay'
  send("#{args.state.scene}_tick", args)
end

def title_tick(args)
  args.audio[:music] ||=
    { input: 'sounds/title_scene.mp3', looping: true, gain: 0.3 }

  if args.inputs.keyboard.key_down.s
    Sound.area_cleanup(args)

    args.state.scene = 'gameplay'
    args.audio[:music] = nil
    return
  end

  labels = [
    {
      x: 40,
      y: args.grid.h - 40,
      text: 'Home coming',
      size_enum: 6
    },
    {
      x: 40,
      y: args.grid.h - 88,
      text: 'Lead the vacuum to clean all dirt, then help it return to base'
    },
    {
      x: 40,
      y: args.grid.h - 120,
      text: 'by Nikos Emmanouilidis'
    },
    {
      x: 40,
      y: 160,
      text: 'Press arrow keys to program moves | E to execute them'
    },
    {
      x: 40,
      y: 120,
      text: 'C to clear move sequence or D to remove last step'
    },
    {
      x: 40,
      y: 80,
      text: 'S to start the game',
      size_enum: 2
    }
  ]
  args.outputs.labels << labels
end

def gameplay_tick(args)
  # custom grid size for grid and grid boxes
  args.state.grid_box.h ||= 80
  args.state.grid_box.w ||= 80
  args.state.grid_total.h ||= 9
  args.state.grid_total.w ||= 16
  args.state.direction ||= 'home'
  args.state.home_position ||= { col: 3, row: 5, direction: 'home' }

  args.state.starting_position ||= args.state.home_position.clone
  args.state.goal_positions ||= [{ col: 5, row: 6 }]
  # args.state.goal_positions ||= [{ col: 5, row: 6 }, { col: 6, row: 7 }, { col: 9, row: 8 }]

  args.state.player_grid ||= args.state.starting_position.clone
  args.state.home_position ||= { col: 3, row: 5, direction: 'home' }

  args.state.move_queue ||= []
  args.state.executing ||= false
  args.state.frame_delay ||= 60
  args.state.missed_goal ||= false
  args.state.blocked_route ||= false
  args.state.in_error_state ||= false
  args.state.level_complete ||= false

  args.state.furniture ||= [Furniture.sofa_back(args, 1, 0, 2),
                            Furniture.sofa_front(args, 6, 5),
                            Furniture.sofa_left(args, 10, 3, 2),
                            Furniture.sofa_right(args, 8, 3),
                            Furniture.fridge(args, 8, 1, 1),
                            Furniture.oven(args, 9, 3, 2),
                            Furniture.single_sofa_front(args, 5, 5, 2),
                            Furniture.single_sofa_back(args,  10, 5),
                            Furniture.single_sofa_left(args,  9, 5)]

  args.state.player_sprites ||= {
    up: Player.up(args),
    down: Player.down(args),
    left: Player.left(args),
    right: Player.right(args),
    home: Player.docked(args)
  }
  args.state.player ||= args.state.player_sprites[args.state.direction.to_sym].dup
  args.state.reset_at_tick ||= nil

  unless args.state.executing || args.state.in_error_state
    display_commands(args)
    display_reset_instruction(args)
  end

  cover_floor(args, 'hardwood')
  args.outputs.sprites << Carpet.small_horizontal(1, 1, 2)

  display_furniture(args)

  # display goal positions
  args.state.goal_positions.each do |pos|
    args.outputs.sprites <<
      { x: pos.col * args.state.grid_box.w,
        y: pos.row * args.state.grid_box.h,
        w: args.state.grid_box.w,
        h: args.state.grid_box.h,
        path: 'sprites/trash.png' }
  end

  # home base

  args.outputs.sprites << Player.empty_dock(args)

  (1..args.state.grid_total.w).each do |i|
    args.outputs.primitives << vertical_line(i, args)
  end
  (1..args.state.grid_total.h).each do |i|
    args.outputs.primitives << horizontal_line(i, args)
  end

  # player
  args.outputs.sprites << args.state.player

  # Execute scheduled reset, see below in Move processor, PLAYER MOVEMENT
  if args.state.reset_at_tick && args.state.tick_count >= args.state.reset_at_tick
    reset_player(args)

    args.state.reset_at_tick = nil
  end

  display_missed_goal(args) if args.state.missed_goal

  if args.state.goal_positions.empty? && args.state.home_position && !args.state.executing && !args.state.in_error_state
    display_completed_goals_msg(args)
  end

  # execute queued moves by pressing 'e'
  if args.inputs.keyboard.key_down.e && !args.state.level_complete
    args.state.executing = true
    Sound.vacuum_on(args)
  end

  if args.inputs.keyboard.key_down.d && !args.state.executing && !args.state.in_error_state && !args.state.level_complete
    args.state.move_queue.pop
    args.state.executing = false
  end
  # clear queued moves by pressing 'c'
  if args.inputs.keyboard.key_down.c && !args.state.executing && !args.state.in_error_state && !args.state.level_complete
    args.state.move_queue.clear
    args.state.executing = false
  end

  # queue moves with arrow keys
  unless args.state.executing || args.state.in_error_state || args.state.level_complete
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

    if blocked?(args, next_pos, direction)
      args.state.missed_goal = true
      args.state.blocked_route = true
      args.state.in_error_state = true
      args.state.reset_at_tick = args.state.tick_count + 120 # Schedule reset in 2 seconds
      args.state.move_queue.clear # discard the rest of the moves
    else
      Player.move_direction(args, args.state.move_queue.shift)
    end

  elsif args.state.executing && args.state.move_queue.empty?
    args.state.executing = false

    # Check if player reached the goal
    if reached_goal?(args)
      update_player_position(args)
      reject_goal(args)
      args.audio[:music] = nil

      if reached_home?(args)
        Sound.return_home(args)
        args.state.player = Player.docked(args)
        args.state.level_complete = true
      elsif args.state.goal_positions.empty?
        Sound.cleanup_completed(args)
      else
        Sound.trash_pickup(args)
      end

    else
      args.state.missed_goal = true
      args.state.in_error_state = true
      args.state.reset_at_tick = args.state.tick_count + 120
      args.audio[:music] = nil
      Sound.vacuum_off(args)

    end

  end
end

def vertical_line(column, args)
  {
    x: column * args.state.grid_box.w,
    y: 0,
    w: 2,
    h: args.state.grid_total.h * args.state.grid_box.h,
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
  text = if args.state.blocked_route
           'Error, the way is shut! Resetting position...'
         else
           'Missed the goal! Resetting position...'
         end
  args.outputs.labels << { x: 50, y: 700, text: text, size_enum: 20, r: 255, g: 0,
                           b: 0 }
end

def display_completed_goals_msg(args)
  text = args.state.level_complete ? 'Level completed, press "N" to go to the next level' : 'The house is clean! Return to home base to charge'
  args.outputs.labels << { x: 30, y: 700, text: text, size_enum: 16, r: 0, g: 255,
                           b: 0 }
end

def display_commands(args)
  items_per_line = 21
  label_width = 60
  size_enum = 20
  # for dragonruby size_enum 0 is 18 pixel, and every size increase, adds 2 pixels
  line_height = 18 + 2 * size_enum

  args.state.move_queue.each_with_index do |command, index|
    line = (index / items_per_line).to_i
    column = index % items_per_line

    args.outputs.labels << {
      x: 30 + (column * label_width),
      y: 710 - (line * line_height),
      text: command_display(command),
      size_enum: size_enum,
      r: 255,
      g: 255,
      b: 255
    }
  end
end

def command_display(command)
  {
    'up' => '⇧',
    'down' => '⇩',
    'left' => '⇦',
    'right' => '⇨'
  }[command]
  # should I need a default, instead of [command], I can use instead  {...}.fetch(command,"default")
end

def reset_player(args)
  args.state.player_grid = args.state.starting_position.clone
  args.state.direction = args.state.starting_position[:direction]

  sprite = args.state.player_sprites[args.state.direction.to_sym].dup
  sprite.x = args.state.player_grid[:col] * args.state.grid_box.w
  sprite.y = args.state.player_grid[:row] * args.state.grid_box.h
  args.state.player = sprite
  args.state.missed_goal = false
  args.state.in_error_state = false
  args.state.blocked_route = false
end

def reached_goal?(args)
  grid = args.state.player_grid
  goals = args.state.goal_positions

  # player reaches goal when lands on a goal position, or  reaches home base after all positions are reached
  goals.any? do |goal|
    grid[:col] == goal[:col] && grid[:row] == goal[:row]
  end || reached_home?(args)
end

def reached_home?(args)
  grid = args.state.player_grid
  home = args.state.home_position
  goals = args.state.goal_positions
  # reached home returns true only when goals are done
  goals.empty? && grid[:row] == home[:row] && grid[:col] == home[:col]
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

def blocked?(args, next_pos, direction)
  # Grid bounds
  return true if outside_grid_x?(args, next_pos) || outside_grid_y?(args, next_pos)

  # Sprite collision
  player_sprite = args.state.player_sprites[direction.to_sym].dup
  player_sprite.x = next_pos[:col] * args.state.grid_box.w
  player_sprite.y = next_pos[:row] * args.state.grid_box.h

  args.state.furniture.any? { |f| args.geometry.intersect_rect?(player_sprite, f) }
end

def outside_grid_x?(args, next_pos)
  next_pos[:col] < 0 || next_pos[:col] >= args.state.grid_total.w
end

def outside_grid_y?(args, next_pos)
  next_pos[:row] < 0 || next_pos[:row] >= args.state.grid_total.h
end

def will_collide_with_furniture?(args)
  player_sprite = args.state.player
  args.state.furniture.any? { |f| args.geometry.intersect_rect?(player_sprite, f) }
end

def next_grid_position(grid, direction)
  deltas = {
    'up' => [0, 1],
    'down' => [0, -1],
    'left' => [-1, 0],
    'right' => [1, 0]
  }

  dx, dy = deltas[direction]
  { col: grid[:col] + dx, row: grid[:row] + dy }
end
