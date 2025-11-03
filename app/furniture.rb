# frozen_string_literal: true

# Furniture tiles class
class Furniture
  class << self
    def sofa_back(args, col = 0, row = 0, variant = 1)
      { x: col * args.state.grid_box.w,
        y: row * args.state.grid_box.h,
        w: 158,
        h: 79,
        tile_w: 53,
        tile_h: 30,
        tile_x: 22,
        tile_y: 162,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def sofa_front(args, col = 0, row = 0, variant = 1)
      { x: col * args.state.grid_box.w,
        y: row * args.state.grid_box.h,
        w: 158,
        h: 79,
        tile_w: 50,
        tile_h: 31,
        tile_x: 87,
        tile_y: 161,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def sofa_right(args, col = 0, row = 0, variant = 1)
      { x: col * args.state.grid_box.w,
        y: row * args.state.grid_box.h,
        w: 79,
        h: 159,
        tile_w: 34,
        tile_h: 60,
        tile_x: 0,
        tile_y: 195,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def sofa_left(args, col = 0, row = 0, variant = 1)
      { x: col * args.state.grid_box.w,
        y: row * args.state.grid_box.h,
        w: 79,
        h: 159,
        tile_w: 34,
        tile_h: 60,
        tile_x: 0,
        tile_y: 195,
        flip_horizontally: true,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def fridge(args, col = 0, row = 0, variant = 1)
      { x: col * args.state.grid_box.w,
        y: row * args.state.grid_box.h,
        w: 79,
        h: 159,
        tile_w: 34,
        tile_h: 63,
        tile_x: 30,
        tile_y: 195,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def oven(args, col = 0, row = 0, variant = 1)
      { x: col * args.state.grid_box.w,
        y: (row * args.state.grid_box.h) + (args.state.grid_box.h / 4),
        w: 79,
        h: 119,
        tile_w: 34,
        tile_h: 45,
        tile_x: 62,
        tile_y: 195,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def counter(args, col = 0, row = 0, variant = 1)
      { x: col * args.state.grid_box.w,
        y: (row * args.state.grid_box.h) + (args.state.grid_box.h / 4),
        w: 237,
        h: 119,
        tile_w: 80,
        tile_h: 43,
        tile_x: 96,
        tile_y: 192,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def counter_reverse(args, col = 0, row = 0, variant = 1)
      { x: col * args.state.grid_box.w,
        y: (row * args.state.grid_box.h) + (args.state.grid_box.h / 4),
        w: 237,
        h: 119,
        tile_w: 80,
        tile_h: 43,
        tile_x: 96,
        tile_y: 192,
        flip_horizontally: true,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def counter_corner(args, col = 0, row = 0, variant = 1)
      { x: col * args.state.grid_box.w,
        y: (row * args.state.grid_box.h) + (args.state.grid_box.h / 4),
        w: 83,
        h: 179,
        tile_w: 33,
        tile_h: 64,
        tile_x: 175,
        tile_y: 193,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def single_sofa_front(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 79,
        tile_w: 34,
        tile_h: 34,
        tile_x: 142,
        tile_y: 158,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def single_sofa_back(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 79,
        tile_w: 34,
        tile_h: 34,
        tile_x: 176,
        tile_y: 158,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def single_sofa_right(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 79,
        tile_w: 34,
        tile_h: 38,
        tile_x: 172,
        tile_y: 115,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def single_sofa_left(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 79,
        tile_w: 34,
        tile_h: 38,
        tile_x: 172,
        tile_y: 115,
        flip_horizontally: true,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def fireplace(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 79,
        tile_w: 34,
        tile_h: 38,
        tile_x: 142,
        tile_y: 115,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def clock(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 128,
        tile_w: 24,
        tile_h: 46,
        tile_x: 68,
        tile_y: 112,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def drawer_right(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 128,
        tile_w: 20,
        tile_h: 48,
        tile_x: 29,
        tile_y: 112,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def drawer_left(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 128,
        tile_w: 20,
        tile_h: 48,
        tile_x: 29,
        tile_y: 112,
        flip_horizontally: true,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def drawer_front(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 128,
        tile_w: 27,
        tile_h: 48,
        tile_x: 3,
        tile_y: 112,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def library_front(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 158,
        h: 158,
        tile_w: 48,
        tile_h: 47,
        tile_x: 31,
        tile_y: 64,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def library_left(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 158,
        tile_w: 18,
        tile_h: 48,
        tile_x: 79,
        tile_y: 64,
        flip_horizontally: true,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def complex_front(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 158,
        h: 158,
        tile_w: 48,
        tile_h: 47,
        tile_x: 95,
        tile_y: 65,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def complex_left(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 158,
        tile_w: 18,
        tile_h: 48,
        tile_x: 143,
        tile_y: 64,
        flip_horizontally: true,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def complex_right(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 158,
        tile_w: 18,
        tile_h: 48,
        tile_x: 143,
        tile_y: 64,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def bathtub(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 158,
        h: 79,
        tile_w: 50,
        tile_h: 30,
        tile_x: 77,
        tile_y: 260,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def toilet_left(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 70,
        h: 79,
        tile_w: 22,
        tile_h: 42,
        tile_x: 144,
        tile_y: 256,
        flip_horizontally: true,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def toilet_right(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 70,
        h: 79,
        tile_w: 22,
        tile_h: 42,
        tile_x: 144,
        tile_y: 256,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def sink(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 79,
        tile_w: 25,
        tile_h: 42,
        tile_x: 20,
        tile_y: 256,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def ironing_board(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 79,
        tile_w: 26,
        tile_h: 42,
        tile_x: 50,
        tile_y: 256,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def lamp(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 128,
        tile_w: 25,
        tile_h: 48,
        tile_x: 91,
        tile_y: 112,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def mirror(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 128,
        tile_w: 25,
        tile_h: 48,
        tile_x: 116,
        tile_y: 112,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def coat_rack(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 128,
        tile_w: 20,
        tile_h: 48,
        tile_x: 48,
        tile_y: 112,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def record_player(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 79,
        tile_w: 32,
        tile_h: 32,
        tile_x: 175,
        tile_y: 256,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def nightstand(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 79,
        tile_w: 25,
        tile_h: 25,
        tile_x: 4,
        tile_y: 4,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def stairs_front(args, row = 0, col = 0, variant = 1)
      tile_y = variant == 1 ? 0 : 81
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 158,
        tile_w: 32,
        tile_h: 80,
        tile_x: 0,
        tile_y: tile_y,
        # primitive_marker: :sprite,
        path: 'sprites/background/topdownhousedoorsandwindows.png' }
    end

    def stairs_front_reverse(args, row = 0, col = 0, variant = 1)
      tile_y = variant == 1 ? 0 : 81
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 158,
        tile_w: 32,
        tile_h: 80,
        tile_x: 0,
        tile_y: tile_y,
        flip_horizontally: true,
        path: 'sprites/background/topdownhousedoorsandwindows.png' }
    end

    def stairs_right(args, row = 0, col = 0, variant = 1)
      tile_y = variant == 1 ? 0 : 81
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 158,
        h: 158,
        tile_w: 64,
        tile_h: 80,
        tile_x: 33,
        tile_y: tile_y,
        path: 'sprites/background/topdownhousedoorsandwindows.png' }
    end

    def stairs_left(args, row = 0, col = 0, variant = 1)
      tile_y = variant == 1 ? 0 : 81
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 158,
        h: 158,
        tile_w: 64,
        tile_h: 80,
        tile_x: 33,
        tile_y: tile_y,
        flip_horizontally: true,
        path: 'sprites/background/topdownhousedoorsandwindows.png' }
    end

    def door(args, row = 0, col = 0, variant = 1)
      tile_y = variant == 1 ? 0 : 81
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 140,
        tile_w: 33,
        tile_h: 47,
        tile_x: 128,
        tile_y: tile_y,
        path: 'sprites/background/topdownhousedoorsandwindows.png' }
    end

    def door_open(args, row = 0, col = 0, variant = 1)
      tile_y = variant == 1 ? 2 : 82
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 140,
        tile_w: 33,
        tile_h: 49,
        tile_x: 160,
        tile_y: tile_y,
        path: 'sprites/background/topdownhousedoorsandwindows.png' }
    end

    def window(args, row = 0, col = 0, variant = 1)
      tile_y = variant == 1 ? 49 : 128
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 79,
        tile_w: 33,
        tile_h: 31,
        tile_x: 95,
        tile_y: tile_y,
        path: 'sprites/background/topdownhousedoorsandwindows.png' }
    end

    def window_single(args, row = 0, col = 0, variant = 1)
      tile_y = variant == 1 ? 49 : 128
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 79,
        tile_w: 33,
        tile_h: 31,
        tile_x: 128,
        tile_y: tile_y,
        path: 'sprites/background/topdownhousedoorsandwindows.png',
        primitive_marker: :sprite }
    end

    def dinning_table(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 148,
        h: 148,
        tile_w: 47,
        tile_h: 32,
        tile_x: 0,
        tile_y: 32,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def dinning_table_vertical(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 117,
        h: 148,
        tile_w: 33,
        tile_h: 48,
        tile_x: 0,
        tile_y: 63,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def chair_front(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 60,
        h: 78,
        tile_w: 16,
        tile_h: 28,
        tile_x: 80,
        tile_y: 3,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def chair_left(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 60,
        h: 78,
        tile_w: 16,
        tile_h: 29,
        tile_x: 95,
        tile_y: 3,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def chair_right(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 60,
        h: 78,
        tile_w: 16,
        tile_h: 29,
        tile_x: 95,
        tile_y: 3,
        flip_horizontally: true,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def chair_back(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 60,
        h: 78,
        tile_w: 16,
        tile_h: 29,
        tile_x: 112,
        tile_y: 3,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def table_small(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 150,
        h: 80,
        tile_w: 32,
        tile_h: 21,
        tile_x: 80,
        tile_y: 43,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def shelf(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 159,
        h: 39,
        tile_w: 50,
        tile_h: 20,
        tile_x: 127,
        tile_y: 236,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def pet_bed(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 79,
        tile_w: 30,
        tile_h: 25,
        tile_x: 97,
        tile_y: 236,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def utensils(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 79,
        tile_w: 30,
        tile_h: 25,
        tile_x: 66,
        tile_y: 236,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def flowerpot(args, row = 0, col = 0, variant = 1)
      { x: row * args.state.grid_box.w,
        y: col * args.state.grid_box.h,
        w: 79,
        h: 79,
        tile_w: 24,
        tile_h: 30,
        tile_x: 0,
        tile_y: 165,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end
  end
end
