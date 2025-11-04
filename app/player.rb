# frozen_string_literal: true

# Player class for ....well, the Player
class Player
  class << self
    def move_direction(args, direction)
      grid = args.state.player_grid
      case direction
      when 'up'    then grid.row += 1 if grid.row < args.state.grid_total.h - 1
      when 'down'  then grid.row -= 1 if grid.row > 0
      when 'left'  then grid.col -= 1 if grid.col > 0
      when 'right' then grid.col += 1 if grid.col < args.state.grid_total.w - 1
      when 'home'  then grid.col = args.state.home_position[:col]
                        grid.row = args.state.home_position[:row]
      end
      update_sprite(args, direction, grid)
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
        tile_y: 0 }
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
        w: 75,
        h: 75,
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
        w: 75,
        h: 75,
        path: 'sprites/robot.png',
        tile_w: 64,
        tile_h: 64,
        tile_x: 0,
        tile_y: 0 }
    end

    def docked(args, faced_right: true)
      grid = args.state.home_position
      sprite = args.state.level < 11 ? '1' : '2'
      width  = args.state.level < 11 ? 100 : 64
      { x: grid.col * args.state.grid_box.h,
        y: grid.row * args.state.grid_box.w,
        tile_x: 0,
        w: width,
        h: 80,
        flip_horizontally: faced_right,
        path: "sprites/docked#{sprite}.png" }
    end

    def empty_dock(args, faced_right: true)
      sprite = args.state.level < 11 ? '1' : '2'
      width = args.state.level < 11 ? 100 : 64
      grid = args.state.home_position
      { x: grid.col * args.state.grid_box.h,
        y: grid.row * args.state.grid_box.w,
        tile_x: 0,
        w: width,
        h: 80,
        flip_horizontally: faced_right,
        path: "sprites/empty_dock#{sprite}.png" }
    end

    def update_sprite(args, direction, grid)
      sprite = args.state.player_sprites[direction.to_sym].dup
      sprite.x = grid.col * args.state.grid_box.h
      sprite.y = grid.row * args.state.grid_box.w
      args.state.player = sprite
      args.state.direction = direction
    end
  end
end
