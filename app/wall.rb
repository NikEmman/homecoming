class Wall
  class << self
    def green_wallpaper(args, row = 0, col = 0)
      { x: row * args.state.grid_box.w * 2,
        y: col * args.state.grid_box.h * 2,
        w: args.state.grid_box.w * 4,
        h: args.state.grid_box.h * 4,
        tile_w: 62,
        tile_h: 64,
        tile_x: 17,
        tile_y: 17,
        path: 'sprites/background/topdownhouse_floorsandwalls.png' }
    end

    def beige_wallpaper(args, row = 0, col = 0)
      { x: row * args.state.grid_box.w * 2,
        y: col * args.state.grid_box.h * 2,
        w: args.state.grid_box.w * 4,
        h: args.state.grid_box.h * 4,
        tile_w: 61,
        tile_h: 64,
        tile_x: 146,
        tile_y: 17,
        path: 'sprites/background/topdownhouse_floorsandwalls.png' }
    end
  end
end
