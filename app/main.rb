def tick(args)
  args.state.player ||= Player.left
  args.state.direction ||= 'down'
  args.outputs.sprites << FloorBoard.tarp
  args.outputs.sprites << FloorBoard.laminate
  args.outputs.sprites << FloorBoard.hardwood

  args.outputs.sprites << args.state.player
  if args.inputs.down
    player = Player.down
    player.x = args.state.player.x
    player.y = args.state.player.y - args.state.player.speed
    args.state.player = player
  end
  if args.inputs.up
    player = Player.up
    player.x = args.state.player.x
    player.y = args.state.player.y + args.state.player.speed
    args.state.player = player
  end
  if args.inputs.left
    player = Player.left
    player.x = args.state.player.x - args.state.player.speed
    player.y = args.state.player.y
    args.state.player = player
  end
  if args.inputs.right
    player = Player.right
    player.x = args.state.player.x + args.state.player.speed
    player.y = args.state.player.y
    args.state.player = player
  end

  args.state.player.up
end

# Player class for ....well, the Player
class Player
  class << self
    def up
      { x: 200,
        y: 300,
        w: 80,
        h: 80,
        path: 'sprites/robot2.png',
        tile_w: 64,
        tile_h: 64,
        tile_x: 64,
        tile_y: 0,
        speed: 10 }
    end

    def down
      { x: 200,
        y: 300,
        w: 80,
        h: 80,
        path: 'sprites/robot2.png',
        tile_w: 64,
        tile_h: 64,
        tile_x: 0,
        tile_y: 0,
        speed: 10 }
    end

    def left
      { x: 200,
        y: 300,
        w: 100,
        h: 100,
        path: 'sprites/robot.png',
        tile_w: 64,
        tile_h: 64,
        tile_x: 0,
        tile_y: 64,
        speed: 10 }
    end

    def right
      { x: 200,
        y: 300,
        w: 100,
        h: 100,
        path: 'sprites/robot.png',
        tile_w: 64,
        tile_h: 64,
        tile_x: 0,
        tile_y: 0,
        speed: 10 }
    end
  end
end

# Floorboard tiles class
class FloorBoard
  class << self
    def tarp
      { x: 0,
        y: 0,
        w: 200,
        h: 200,
        tile_w: 60,
        tile_h: 55,
        tile_x: 18,
        tile_y: 18,
        path: 'sprites/background/topDownHouse_floorsAndWalls.png' }
    end

    def laminate
      { x: 200,
        y: 0,
        w: 200,
        h: 200,
        tile_w: 64,
        tile_h: 47,
        tile_x: 144,
        tile_y: 81,
        path: 'sprites/background/topDownHouse_floorsAndWalls.png' }
    end

    def hardwood
      { x: 400,
        y: 0,
        w: 200,
        h: 200,
        tile_w: 61,
        tile_h: 47,
        tile_x: 17,
        tile_y: 81,
        path: 'sprites/background/topDownHouse_floorsAndWalls.png' }
    end
  end
end
