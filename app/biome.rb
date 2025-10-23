class Biome
  class << self
    def number_one(args)
      args.state.carpets ||= [Carpet.big_horizontal(args, 2, 2, 1), Carpet.small_horizontal(args, 12, 1, 2),
                              Carpet.round(args, 12, 5)]
      args.state.floor_type ||= 'carpeted'
      args.state.trash_type ||= 2
      args.state.grid_total ||= { h: 6, w: 16 }

      args.state.furniture ||= [Furniture.sofa_front(args, 2, 4, 2),
                                Furniture.table_small(args, 2, 3, 2),
                                Furniture.record_player(args, 4, 4),
                                Furniture.stairs_side(args, 0, 5),
                                Furniture.lamp(args, 0, 4),
                                Furniture.chair_right(args, 8, 2, 2),
                                Furniture.chair_right(args, 8, 3, 2),
                                Furniture.dinning_table_vertical(args, 7, 2),
                                Furniture.chair_back(args, 7, 1.2, 2),
                                Furniture.counter_corner(args, 15, 1.2),
                                Furniture.fireplace(args, 12, 5.9, 2),
                                Furniture.single_sofa_right(args, 11, 5),
                                Furniture.single_sofa_left(args, 13, 5),
                                Furniture.single_sofa_left(args, 4, 2, 2),
                                Furniture.door(args, 3, 6),
                                Furniture.window(args, 4, 6.5),
                                Furniture.window_single(args, 13, 6.5),
                                Furniture.window_single(args, 11, 6.5),
                                Furniture.coat_rack(args, 2, 5.5),
                                Furniture.library_front(args, 8, 5, 2),
                                Furniture.counter(args, 11, 2, 2),
                                Furniture.fridge(args, 14, 2)]
      args.state.miscellaneous ||= [Wall.green_wallpaper(args, 0, 3),
                                    Wall.green_wallpaper(args, 1, 3),
                                    Wall.green_wallpaper(args, 2, 3),
                                    Wall.green_wallpaper(args, 3, 3),
                                    Wall.green_wallpaper(args, 4, 3),
                                    Wall.green_wallpaper(args, 5, 3),
                                    Wall.green_wallpaper(args, 6, 3),
                                    Furniture.shelf(args, 6, 7, 2),
                                    Furniture.flowerpot(args, 6, 7)]
    end
  end
end
