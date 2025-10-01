# Floorboard tiles class
class Furniture
  class << self
    def sofa_back(col = 0, row = 0, variant = 1, args)
      { x: col * args.state.grid_box.w,
        y: row * args.state.grid_box.h,
        w: 158,
        h: 79,
        tile_w: 53,
        tile_h: 30,
        tile_x: 22,
        tile_y: 162,
        path: "sprites/background/TopDownHouse_FurnitureState#{variant}.png" }
    end

    def sofa_front(col = 0, row = 0, variant = 1, args)
      { x: col * args.state.grid_box.w,
        y: row * args.state.grid_box.h,
        w: 158,
        h: 79,
        tile_w: 53,
        tile_h: 34,
        tile_x: 85,
        tile_y: 158,
        path: "sprites/background/TopDownHouse_FurnitureState#{variant}.png" }
    end

    def sofa_right(col = 0, row = 0, variant = 1, args)
      { x: col * args.state.grid_box.w,
        y: row * args.state.grid_box.h,
        w: 79,
        h: 159,
        tile_w: 34,
        tile_h: 60,
        tile_x: -8,
        tile_y: 195,
        path: "sprites/background/TopDownHouse_FurnitureState#{variant}.png" }
    end

    def sofa_left(col = 0, row = 0, variant = 1, args)
      { x: col * args.state.grid_box.w,
        y: row * args.state.grid_box.h,
        w: 79,
        h: 159,
        tile_w: 34,
        tile_h: 60,
        tile_x: -8,
        tile_y: 195,
        flip_horizontally: true,
        path: "sprites/background/TopDownHouse_FurnitureState#{variant}.png" }
    end

    def fridge(col = 0, row = 0, variant = 1, args)
      { x: col * args.state.grid_box.w,
        y: row * args.state.grid_box.h,
        w: 79,
        h: 159,
        tile_w: 34,
        tile_h: 63,
        tile_x: 30,
        tile_y: 195,
        path: "sprites/background/TopDownHouse_FurnitureState#{variant}.png" }
    end

    def oven(col = 0, row = 0, variant = 1, args)
      { x: col * args.state.grid_box.w,
        y: row * args.state.grid_box.h,
        w: 79,
        h: 119,
        tile_w: 34,
        tile_h: 45,
        tile_x: 62,
        tile_y: 195,
        path: "sprites/background/TopDownHouse_FurnitureState#{variant}.png" }
    end

    def single_sofa_front(row = 0, col = 0, variant = 1, args)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 79,
        tile_w: 34,
        tile_h: 34,
        tile_x: 142,
        tile_y: 158,
        path: "sprites/background/TopDownHouse_FurnitureState#{variant}.png" }
    end

    def single_sofa_back(row = 0, col = 0, variant = 1, args)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 79,
        tile_w: 34,
        tile_h: 34,
        tile_x: 176,
        tile_y: 158,
        path: "sprites/background/TopDownHouse_FurnitureState#{variant}.png" }
    end

    def single_sofa_right(row = 0, col = 0, variant = 1, args)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 79,
        tile_w: 34,
        tile_h: 38,
        tile_x: 172,
        tile_y: 115,
        path: "sprites/background/TopDownHouse_FurnitureState#{variant}.png" }
    end

    def single_sofa_left(row = 0, col = 0, variant = 1, args)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 79,
        tile_w: 34,
        tile_h: 38,
        tile_x: 172,
        tile_y: 115,
        flip_horizontally: true,
        path: "sprites/background/TopDownHouse_FurnitureState#{variant}.png" }
    end
  end
end
