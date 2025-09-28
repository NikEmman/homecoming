require_relative 'player'
require_relative 'floor'

def tick(args)
  args.state.player ||= Player.up
  args.state.player_grid ||= { col: 2, row: 3 }
  args.state.move_queue ||= []
  args.state.executing ||= false

  args.state.player_sprites ||= {
    up: Player.up,
    down: Player.down,
    left: Player.left,
    right: Player.right
  }
  display_commands(args) unless args.state.executing

  args.outputs.sprites << Floor.tarp
  args.outputs.sprites << Floor.laminate
  args.outputs.sprites << Floor.hardwood
  args.outputs.sprites << Floor.tiles
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
  elsif args.state.move_queue.empty?
    args.state.executing = false
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
