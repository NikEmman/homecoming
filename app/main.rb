# frozen_string_literal: true

require_relative 'player'
require_relative 'floor'
require_relative 'furniture'
require_relative 'sounds'
require_relative 'level'
require_relative 'carpet'
require_relative 'wall'
require_relative 'biome'
require_relative 'labels'
require_relative 'shapes'

def tick(args)
  # 5,10 subject to change depending on after which lvl will password screen appear
  args.state.password_list ||= { 6 => %w[ABN HKT OEM YAX 765],
                                 11 => %w[TOBN MEKT NOIM 1337 M77M] }

  args.state.scene ||= 'title' # options are title, password, end, gameplay
  send("#{args.state.scene}_tick", args)
end

def title_tick(args)
  Sound.title_music(args)
  if args.inputs.keyboard.key_down.s
    Sound.area_cleanup(args)
    args.state.scene = 'gameplay'
    args.audio[:music] = nil # cancels the title music
    return
  end

  if args.inputs.keyboard.key_down.p
    args.state.scene = 'input'
    return
  end

  Labels.title(args).each do |label|
    display_label_with_background(args, label)
  end
  # title scene background
  args.outputs.solids << Shapes.scene_background(args)
end

def end_tick(args)
  Sound.title_music(args)
  if args.inputs.keyboard.key_down.s
    Sound.area_cleanup(args)
    args.state.scene = 'gameplay'
    args.audio[:music] = nil
    args.state.level = 1
    reset_level(args)
    return
  end
  if args.inputs.keyboard.key_down.x
    GTK.request_quit
    return
  end

  Labels.end(args).each do |label|
    display_label_with_background(args, label)
  end
  args.outputs.solids << Shapes.scene_background(args)
end

def password_tick(args)
  Sound.password_music(args)
  generate_password(args)
  if args.inputs.keyboard.key_down.n
    Sound.area_cleanup(args) # needs new sound resuming cleanup
    args.state.scene = 'gameplay'
    args.audio[:music] = nil
    args.state.password = nil
    return
  end
  if args.inputs.keyboard.key_down.x
    GTK.request_quit
    return
  end

  Labels.password(args).each do |label|
    display_label_with_background(args, label)
  end
  args.outputs.solids << Shapes.scene_background(args)
end

def input_tick(args)
  args.outputs.solids << Shapes.scene_background(args)
  args.state.password_input ||= []
  Labels.input(args).each do |label|
    display_label_with_background(args, label)
  end

  args.state.password_input += args.inputs.text unless args.inputs.text.empty?

  # Handle backspace/delete
  args.state.password_input.pop if args.inputs.keyboard.key_down.backspace

  # display error message for 2 sec
  if args.state.error_flash && args.state.tick_count - args.state.error_flash < 120
    display_label_with_background(args, Labels.wrong_password)
  else
    args.state.error_flash = nil
  end
  args.state.scene = 'title' if args.inputs.keyboard.key_down.escape
  # Handle Enter to submit
  return unless args.inputs.keyboard.key_down.enter

  if password_correct?(args, args.state.password_input.join)
    args.state.level ||= find_level_for_password(args, args.state.password_input.join)
    args.state.scene = 'gameplay'
    Sound.area_cleanup(args)
    args.audio[:music] = nil # cancels the title music

    args.state.password_input = []

  else
    # Wrong password: Flash error or reset (example: reset input)
    args.state.password_input = []
    args.state.error_flash ||= args.state.tick_count
  end
end

def gameplay_tick(args)
  # custom grid size for grid and grid boxes
  args.state.grid_box ||= { w: 80, h: 80 }

  args.state.level ||= 11
  args.state.max_level ||= 15

  Level.send("load#{args.state.level}", args)

  args.state.starting_position ||= args.state.home_position.dup

  args.state.player_grid ||= args.state.starting_position.dup
  args.state.direction ||= args.state.player_grid[:direction].dup

  args.state.move_queue ||= []
  args.state.executing ||= false
  args.state.frame_delay ||= 60
  args.state.missed_goal ||= false
  args.state.blocked_route ||= false
  args.state.in_error_state ||= false
  args.state.level_complete ||= false

  args.state.player_sprites ||= {
    up: Player.up(args),
    down: Player.down(args),
    left: Player.left(args),
    right: Player.right(args),
    home: Player.docked(args)
  }
  args.state.player ||= args.state.player_sprites[args.state.direction.to_sym].dup
  args.state.execute_at_tick ||= nil

  display_floor(args)

  display_grid_lines(args)

  display_carpets(args)

  display_furniture(args)

  # display goal positions
  display_goal_positions(args)

  # home base

  args.outputs.sprites << Player.empty_dock(args)

  display_miscellaneous(args)
  display_furniture(args)
  display_label_with_background(args, Labels.current_level(args))
  unless args.state.executing || args.state.in_error_state
    display_commands(args)
    display_reset_instruction(args)
  end

  # player
  args.outputs.sprites << args.state.player

  # Execute scheduled reset, see below in Move processor, PLAYER MOVEMENT
  if args.state.execute_at_tick && args.state.tick_count >= args.state.execute_at_tick
    reset_player(args)

    args.state.execute_at_tick = nil
  end

  display_label_with_background(args, Labels.missed_goal(args)) if args.state.missed_goal

  display_label_with_background(args, Labels.goals_complete(args)) if all_goals_completed?(args.state)

  # execute queued moves by pressing 'e'
  if args.inputs.keyboard.key_down.e && !args.state.level_complete
    args.outputs.sounds = []
    args.state.executing = true
    Sound.vacuum_on(args)
  end

  # !state.executing && !state.in_error_state && !state.level_complete
  if args.inputs.keyboard.key_down.d && can_queue_moves?(args.state)

    args.state.move_queue.pop
    args.state.executing = false
  end
  # clear queued moves by pressing 'c'
  if args.inputs.keyboard.key_down.c && can_queue_moves?(args.state)

    args.state.move_queue.clear
    args.state.executing = false
  end

  if args.inputs.keyboard.key_down.n && args.state.level_complete
    if args.state.level + 1 > args.state.max_level
      args.state.scene = 'end'
      return
    else
      args.state.level += 1
    end
    args.state.scene = 'password' if args.state.password_list.key?(args.state.level)
    reset_level(args)
    args.audio[:return_home] = nil

  end

  # queue moves with arrow keys
  if can_queue_moves?(args.state)
    %i[up down left right].each do |direction|
      args.state.move_queue << direction.to_s if args.inputs.keyboard.key_down.send(direction)
    end
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
      args.state.execute_at_tick = args.state.tick_count + 120 # Schedule reset in 2 seconds
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
        args.audio[:cleanup_completed] = nil # cancels the cleanup complete sound
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
      args.state.execute_at_tick = args.state.tick_count + 120
      args.audio[:music] = nil # cancels the on sound loop that started when execution started
      Sound.error(args)
    end

  end
end

def display_reset_instruction(args)
  return if args.state.move_queue.empty?

  display_label_with_background(args, Labels.command_deletion)
end

def display_goal_positions(args)
  args.state.goal_positions.each do |pos|
    args.outputs.sprites <<
      { x: pos.col * args.state.grid_box.w,
        y: pos.row * args.state.grid_box.h,
        w: args.state.grid_box.w,
        h: args.state.grid_box.h,
        path: "sprites/trash#{args.state.trash_type}.png" }
  end
end

def display_label_with_background(args, label_hash)
  # Extract label properties with defaults
  config = {
    x: 0,
    y: 0,
    text: '',
    size_enum: 0,
    r: 255,
    g: 255,
    b: 255,
    a: 255,
    font: nil
  }.merge(label_hash)

  # Calculate text dimensions
  text_w, text_h = args.gtk.calcstringbox(config[:text], config[:size_enum])
  padding = 4

  # Background box position and size (top-left aligned with padding)
  box = {
    x: config[:x] - padding,
    y: config[:y] - text_h - padding,
    w: text_w + (2 * padding),
    h: text_h + (2 * padding)
  }

  # Render semi-transparent dark background box
  args.outputs.primitives << Shapes.label_background(box[:x], box[:y], box[:w], box[:h])

  # Render label
  args.outputs.labels << config.slice(:x, :y, :text, :size_enum, :r, :g, :b, :a, :font)
end

def display_commands(args)
  items_per_line = 18
  label_width = 65
  size_enum = 20

  line_height = 31 + 2 * size_enum

  args.state.move_queue.each_with_index do |command, index|
    line = (index / items_per_line).to_i
    column = index % items_per_line

    display_label_with_background(args, Labels.command(line, column, label_width, line_height, command, size_enum))
  end
end

def reset_player(args)
  args.state.player_grid = args.state.starting_position.dup
  args.state.direction = args.state.starting_position[:direction]

  sprite = args.state.player_sprites[args.state.direction.to_sym].dup
  sprite.x = args.state.player_grid[:col] * args.state.grid_box.w
  sprite.y = args.state.player_grid[:row] * args.state.grid_box.h
  args.state.player = sprite
  args.state.missed_goal = false
  args.state.in_error_state = false
  args.state.blocked_route = false
end

def reset_level(args)
  args.state.home_position = nil
  args.state.goal_positions = nil
  args.state.furniture = nil
  args.state.miscellaneous = nil
  args.state.carpets = nil
  args.state.floor_type = nil
  args.state.trash_type = nil
  args.state.grid_total = nil
  args.state.starting_position = nil
  args.state.player_grid = nil
  args.state.level_complete = false
  args.state.player = nil
  args.state.direction = nil
  args.state.player_sprites = nil
  args.outputs.sprites.clear
end

def can_queue_moves?(state)
  !state.executing && !state.in_error_state && !state.level_complete
end

def all_goals_completed?(state)
  state.goal_positions&.empty? &&
    state.home_position &&
    !state.executing &&
    !state.in_error_state &&
    state.move_queue.empty?
end

def same_grid_position?(pos1, pos2)
  pos1[:row] == pos2[:row] && pos1[:col] == pos2[:col]
end

def reached_goal?(args)
  grid = args.state.player_grid
  goals = args.state.goal_positions

  # Only count as reaching goal if:
  # 1. Move queue is empty (this is the final position)
  # 2. Player is on a goal OR (all goals done AND on home)
  # 3. NOT in error state
  return false if args.state.in_error_state
  return false unless args.state.move_queue.empty?

  # Check if on a goal position
  on_goal = goals.any? { |goal| same_grid_position?(grid, goal) }

  # Or if all goals collected and on home
  on_home = goals.empty? && same_grid_position?(grid, args.state.home_position)

  on_goal || on_home
end

def reached_home?(args)
  grid = args.state.player_grid.dup
  home = args.state.home_position
  goals = args.state.goal_positions

  # reached home returns true only when goals are done
  goals.empty? && same_grid_position?(grid, home)
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
  goals.reject! { |goal| same_grid_position?(grid, goal) }
end

def display_floor(args)
  args.state.floor_tiles.each do |tile|
    args.outputs.sprites << tile
  end
end

def display_grid_lines(args)
  (1..args.state.grid_total.w).each do |i|
    args.outputs.primitives << Shapes.vertical_line(i, args)
  end
  (1..args.state.grid_total.h).each do |i|
    args.outputs.primitives << Shapes.horizontal_line(i, args)
  end
end

def display_furniture(args)
  args.state.furniture.each do |f|
    args.outputs.primitives << f
  end
end

def display_miscellaneous(args)
  args.state.miscellaneous.each do |m|
    args.outputs.primitives << m
  end
end

def display_carpets(args)
  args.state.carpets.each do |c|
    args.outputs.sprites << c
  end
end

def blocked?(args, next_pos, direction)
  # Grid bounds
  return true if outside_grid_x?(args, next_pos) || outside_grid_y?(args, next_pos)

  # Premature landing on goal or home
  goals = args.state.goal_positions

  if goals.empty? && same_grid_position?(next_pos, args.state.home_position) && args.state.move_queue.length > 1
    args.state.missed_goal = true
    args.state.blocked_route = false
    return true
  end

  # Sprite collision
  player_sprite = args.state.player_sprites[direction.to_sym].dup
  player_sprite.x = next_pos[:col] * args.state.grid_box.w
  player_sprite.y = next_pos[:row] * args.state.grid_box.h

  furniture_collision?(args, player_sprite) || miscellaneous_collision?(args, player_sprite)
end

def furniture_collision?(args, player_sprite)
  args.state.furniture.any? { |f| args.geometry.intersect_rect?(player_sprite, f) }
end

def miscellaneous_collision?(args, player_sprite)
  args.state.miscellaneous.any? { |m| args.geometry.intersect_rect?(player_sprite, m) }
end

def outside_grid_x?(args, next_pos)
  next_pos[:col] < 0 || next_pos[:col] >= args.state.grid_total.w
end

def outside_grid_y?(args, next_pos)
  next_pos[:row] < 0 || next_pos[:row] >= args.state.grid_total.h
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

def generate_password(args)
  # will call the proper key from password_list and then pick a random password
  args.state.password ||= args.state.password_list[args.state.level].sample
end

def password_correct?(args, password)
  cleaned = password.strip.upcase
  args.state.password_list.any? do |_level, passwords|
    passwords.include?(cleaned)
  end
end

def find_level_for_password(args, password)
  cleaned = password.strip.upcase
  args.state.password_list.find { |_level, passes| passes.include?(cleaned) }.first
end
