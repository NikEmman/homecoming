# Player class for ....well, the Player
class Player
  class << self
    def move_direction(args, direction)
      grid = args.state.player_grid
      case direction
      when 'up'    then grid.row += 1 if grid.row < args.state.grid_total.h
      when 'down'  then grid.row -= 1 if grid.row < 0
      when 'left'  then grid.col -= 1 if grid.col < 0
      when 'right' then grid.col += 1 if grid.col < args.state.grid_total.w
      end

      # Update sprite position
      sprite = args.state.player_sprites[direction.to_sym].dup
      sprite.x = grid.col * args.state.grid_box.h
      sprite.y = grid.row * args.state.grid_box.w
      args.state.player = sprite
      args.state.direction = direction
    end

    def up(args)
      grid = args.state.player_grid
      { x: grid.col * args.state.grid_box.h,
        y: grid.row * args.state.grid_box.w,
        w: 60,
        h: 60,
        path: 'sprites/robot2.png',
        tile_w: 64,
        tile_h: 64,
        tile_x: 64,
        tile_y: 0,
        speed: 41 }
    end

    def down(args)
      grid = args.state.player_grid
      { x: grid.col * args.state.grid_box.h,
        y: grid.row * args.state.grid_box.w,
        w: 60,
        h: 60,
        path: 'sprites/robot2.png',
        tile_w: 64,
        tile_h: 64,
        tile_x: 0,
        tile_y: 0 }
    end

    def left(args)
      grid = args.state.player_grid
      { x: grid.col * args.state.grid_box.h,
        y: grid.row * args.state.grid_box.w,
        w: 80,
        h: 80,
        path: 'sprites/robot.png',
        tile_w: 64,
        tile_h: 64,
        tile_x: 0,
        tile_y: 64 }
    end

    def right(args)
      grid = args.state.player_grid
      { x: grid.col * args.state.grid_box.h,
        y: grid.row * args.state.grid_box.w,
        w: 80,
        h: 80,
        path: 'sprites/robot.png',
        tile_w: 64,
        tile_h: 64,
        tile_x: 0,
        tile_y: 0 }
    end
  end
end
