require_relative 'player'
require_relative 'floor'

def tick(args)
  args.state.player ||= Player.up
  args.state.player_sprites ||= {
    up: Player.up,
    down: Player.down,
    left: Player.left,
    right: Player.right
  }

  args.outputs.sprites << Floor.tarp
  args.outputs.sprites << Floor.laminate
  args.outputs.sprites << Floor.hardwood
  args.outputs.sprites << Floor.tiles

  args.outputs.sprites << args.state.player
  Player.move_direction(args, 'down') if args.inputs.down
  Player.move_direction(args, 'up')   if args.inputs.up
  Player.move_direction(args, 'left') if args.inputs.left
  Player.move_direction(args, 'right') if args.inputs.right

  args.state.player.up
end
