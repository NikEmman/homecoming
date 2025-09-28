require_relative 'player'
require_relative 'floor'

def tick(args)
  args.state.starting_position ||= { col: 4, row: 5, direction: 'up' }
  # args.state.player ||= Player.up(args)
  args.state.goal_positions ||= [{ col: 5, row: 6 }, { col: 6, row: 7 }, { col: 9, row: 8 }]
  args.state.player_grid ||= args.state.starting_position.clone

  args.state.move_queue ||= []
  args.state.executing ||= false
  args.state.direction ||= 'up'

  args.state.player_sprites ||= {
    up: Player.up(args),
    down: Player.down,
    left: Player.left,
    right: Player.right
  }
  args.state.player ||= args.state.player_sprites[args.state.direction.to_sym].dup

  unless args.state.executing
    display_commands(args)
    args.outputs.labels << { x: 30, y: 40, text: 'Press C to clear queue', size_enum: 7, r: 255, g: 255, b: 255 }
  end

  # args.outputs.sprites << Floor.tarp
  # args.outputs.sprites << Floor.laminate
  # args.outputs.sprites << Floor.hardwood
  # args.outputs.sprites << Floor.tiles
  cover_floor(args, 'tarp')

  args.state.goal_positions.each do |pos|
    args.outputs.primitives << {
      x: pos.col * 80,
      y: pos.row * 80,
      w: 80,
      h: 80,
      r: 0,
      g: 255,
      b: 0,
      a: 100,
      primitive_marker: :solid
    }
  end
  (1..15).each do |i|
    args.outputs.primitives << vertical_line(i, args)
  end
  (1..9).each do |i|
    args.outputs.primitives << horizontal_line(i, args)
  end

  args.outputs.sprites << args.state.player
  # execute queued moves by pressing 'e'
  args.state.executing = true if args.inputs.keyboard.key_down.e
  # clear queued moves by pressing 'c'
  if args.inputs.keyboard.key_down.c
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

  if args.state.tick_count % 60 == 0 && args.state.move_queue.any?
    Player.move_direction(args, args.state.move_queue.shift)
  elsif args.state.executing && args.state.move_queue.empty?
    args.state.executing = false

    # Check if player reached the goal
    if reached_goal?(args)
      update_player_position(args)
      reject_goal(args)
    else
      reset_player(args)

    end
    reset_player(args)

  end
end

def vertical_line(column, args)
  {
    x: column * 80,
    y: 0,
    w: 2,
    h: args.grid.h,
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
    y: row * 80,
    w: args.grid.w,
    h: 2,
    r: 92,
    g: 120,
    b: 230,
    a: 128,
    primitive_marker: :solid
  }
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
  sprite.x = args.state.player_grid.col * 80
  sprite.y = args.state.player_grid.row * 80
  args.state.player = sprite
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
