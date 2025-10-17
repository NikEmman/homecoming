class Level
  class << self
    def load_1(args)
      args.state.home_position ||= { col: 0, row: 3, direction: 'home' }
      args.state.goal_positions ||= [{ col: 5, row: 2 }, { col: 2, row: 4 }]
      args.state.carpets ||= [Carpet.big_horizontal(args, 3, 2, 1), Carpet.small_vertical(args, 2, 0, 2)]
      args.state.floor_type ||= 'fishbone'
      args.state.trash_type ||= 1
      args.state.grid_total ||= { h: 6, w: 16 }

      # args.state.furniture ||= []
      # args.state.miscellaneous ||= []

      args.state.furniture ||= [Furniture.sofa_back(args, 2, 4, 2),
                                Furniture.sofa_front(args, 2, 7),
                                Furniture.single_sofa_left(args, 5, 5)]
      args.state.miscellaneous ||= [Wall.beige_wallpaper(args, 0, 3),
                                    Wall.beige_wallpaper(args, 1, 3),
                                    Wall.beige_wallpaper(args, 2, 3),
                                    Wall.beige_wallpaper(args, 3, 3),
                                    Wall.beige_wallpaper(args, 4, 3),
                                    Wall.beige_wallpaper(args, 5, 3),
                                    Wall.beige_wallpaper(args, 6, 3),
                                    Furniture.stairs_front(args, 0, 5)]
    end
  end
end
