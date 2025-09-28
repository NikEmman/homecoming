# Player class for ....well, the Player
class Player
  class << self
    def move_direction(args, direction)
      grid = args.state.player_grid
      case direction
      when 'up'    then grid.row += 1 if grid.row < 8
      when 'down'  then grid.row -= 1 if grid.row > 0
      when 'left'  then grid.col -= 1 if grid.col > 0
      when 'right' then grid.col += 1 if grid.col < 15
      end

      # Update sprite position
      sprite = args.state.player_sprites[direction.to_sym].dup
      sprite.x = grid.col * 80
      sprite.y = grid.row * 80
      args.state.player = sprite
    end

    def up
      { x: 0,
        y: 0,
        w: 60,
        h: 60,
        path: 'sprites/robot2.png',
        tile_w: 64,
        tile_h: 64,
        tile_x: 64,
        tile_y: 0,
        speed: 41 }
    end

    def down
      { x: 200,
        y: 300,
        w: 60,
        h: 60,
        path: 'sprites/robot2.png',
        tile_w: 64,
        tile_h: 64,
        tile_x: 0,
        tile_y: 0 }
    end

    def left
      { x: 200,
        y: 300,
        w: 80,
        h: 80,
        path: 'sprites/robot.png',
        tile_w: 64,
        tile_h: 64,
        tile_x: 0,
        tile_y: 64 }
    end

    def right
      { x: 200,
        y: 300,
        w: 80,
        h: 80,
        path: 'sprites/robot.png',
        tile_w: 64,
        tile_h: 64,
        tile_x: 0,
        tile_y: 0 }
    end

    # def inbounds?(args, sprite)
    #   x = sprite.x
    #   y = sprite.y

    #   # This ensures that bounds work, since up and down sprites are smaller than 80x80
    #   w = [sprite.w, 80].max
    #   h = [sprite.h, 80].max

    #   x >= 0 &&
    #     y >= 0 &&
    #     x + w <= args.grid.w &&
    #     y + h <= args.grid.h
    # end
  end
end
