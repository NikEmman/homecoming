# frozen_string_literal: true

# class to draw shapes, like grid lines
class Shapes
  class << self
    def vertical_line(column, args)
      {
        x: column * args.state.grid_box.w,
        y: 0,
        w: 2,
        h: args.state.grid_total.h * args.state.grid_box.h,
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
        y: row * args.state.grid_box.h,
        w: args.state.grid_total.w * args.state.grid_box.w,
        h: 2,
        r: 92,
        g: 120,
        b: 230,
        a: 128,
        primitive_marker: :solid
      }
    end

    def label_background(box_x, box_y, box_w, box_h)
      {
        x: box_x,
        y: box_y,
        w: box_w,
        h: box_h,
        r: 0,
        g: 0,
        b: 0,
        a: 60,
        primitive_marker: :solid
      }
    end

    def scene_background(args)
      { x: 0, y: 0, w: args.grid.w, h: args.grid.h, r: 73, g: 139, b: 227 }
    end
  end
end
