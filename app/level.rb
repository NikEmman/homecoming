class Level
  class << self
    def load_1(args)
      args.state.home_position ||= { col: 0, row: 3, direction: 'home' }
      args.state.goal_positions ||= [{ col: 3, row: 2 }]
      args.state.carpets ||= [Carpet.big_horizontal(args, 2, 2, 1), Carpet.round(args, 12, 5)]
      args.state.floor_type ||= 'carpeted'
      args.state.trash_type ||= 2
      args.state.grid_total ||= { h: 6, w: 16 }

      args.state.furniture ||= []
      # args.state.miscellaneous ||= []

      # args.state.furniture ||= [Furniture.sofa_front(args, 2, 4, 2),
      #                           Furniture.single_sofa_left(args, 4, 2)]
      args.state.miscellaneous ||= [Wall.beige_wallpaper(args, 0, 3),
                                    Wall.beige_wallpaper(args, 1, 3),
                                    Wall.beige_wallpaper(args, 2, 3),
                                    Wall.beige_wallpaper(args, 3, 3),
                                    Wall.beige_wallpaper(args, 4, 3),
                                    Wall.beige_wallpaper(args, 5, 3),
                                    Wall.beige_wallpaper(args, 6, 3)]
    end
  end
end
# FURNITURE NAMES
# sofa_back, sofa_front, sofa_right, sofa_left, fridge, oven, counter, counter_corner,
# single_sofa_front, single_sofa_back, single_sofa_right, single_sofa_left,
# fireplace, clock, drawer_right, drawer_left, drawer_front, library_front, library_left,
# complex_front, complex_left, complex_right, bathtub, toilet_front, sink,
# ironing_board, lamp, record_player, nightstand, stairs_front, stairs_side,
# door, door_open, window, window_single
