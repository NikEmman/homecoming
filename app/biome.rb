# frozen_string_literal: true

# Biome class draws backgrounds and furniture
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
                                Furniture.stairs_right(args, 0, 5),
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
                                Furniture.fridge(args, 14, 2),
                                Furniture.pet_bed(args, 1, 0)]
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

    def number_two(args)
      args.state.carpets ||= [Carpet.big_horizontal(args, 1, 3, 1), Carpet.big_horizontal(args, 12, 3, 2),
                              Carpet.small_horizontal(args, 8.5, 5)]
      args.state.floor_type ||= 'laminate'
      args.state.trash_type ||= 2
      args.state.grid_total ||= { h: 6, w: 16 }

      args.state.furniture ||= [Furniture.sofa_right(args, 0, 3, 2),
                                Furniture.sofa_left(args, 4, 3, 2),
                                Furniture.sofa_back(args, 2, 2, 2),
                                Furniture.drawer_front(args, 7, 5),

                                Furniture.record_player(args, 4, 2, 2),
                                Furniture.stairs_left(args, 14, 5),
                                Furniture.lamp(args, 2, 5, 2),
                                Furniture.chair_right(args, 8, 1),
                                Furniture.chair_right(args, 8, 2),
                                Furniture.chair_front(args, 7, 2),
                                Furniture.dinning_table_vertical(args, 7, 1, 2),
                                Furniture.flowerpot(args, 7.5, 1.8, 2),
                                Furniture.counter_corner(args, 15, 1.2, 2),
                                Furniture.door(args, 9, 6, 2),
                                Furniture.window(args, 8, 6.5, 2),
                                Furniture.window(args, 10, 6.5, 2),
                                Furniture.library_front(args, 0, 5, 2),
                                Furniture.library_front(args, 3, 5, 2),
                                Furniture.counter(args, 11, 2),
                                Furniture.fridge(args, 10, 2),
                                Furniture.oven(args, 14, 2, 2),
                                Furniture.ironing_board(args, 11, 0, 2),
                                Furniture.pet_bed(args, 3, 0)]
      args.state.miscellaneous ||= [Wall.beige_wallpaper(args, 0, 3),
                                    Wall.beige_wallpaper(args, 1, 3),
                                    Wall.beige_wallpaper(args, 2, 3),
                                    Wall.beige_wallpaper(args, 3, 3),
                                    Wall.beige_wallpaper(args, 4, 3),
                                    Wall.beige_wallpaper(args, 5, 3),
                                    Wall.beige_wallpaper(args, 6, 3),
                                    Furniture.shelf(args, 12, 7),
                                    Furniture.flowerpot(args, 13, 7, 2)]
    end

    def number_three(args)
      args.state.carpets ||= [Carpet.big_horizontal(args, 1, 3, 1),
                              Carpet.small_vertical(args, 11.5, 3.2),
                              Carpet.small_horizontal(args, 13, 4.8)]
      args.state.floor_type ||= 'fishbone'
      args.state.trash_type ||= 2
      args.state.grid_total ||= { h: 6, w: 16 }

      args.state.furniture ||= [Furniture.sofa_right(args, 0, 3, 2),
                                Furniture.sofa_left(args, 4, 3, 2),
                                Furniture.sofa_back(args, 2, 2, 2),
                                Furniture.drawer_front(args, 7, 5),

                                Furniture.record_player(args, 4, 2, 2),
                                Furniture.stairs_front_reverse(args, 11, 5.4, 2),
                                Furniture.stairs_front_reverse(args, 11, 8, 2),

                                Furniture.stairs_front_reverse(args, 11, 7, 2),
                                Furniture.stairs_front(args, 11.1, 8, 2),
                                Furniture.stairs_front(args, 11.1, 7, 2),

                                Furniture.stairs_front(args, 11.1, 5.4, 2),
                                Furniture.bathtub(args, 14, 3, 2),
                                Furniture.toilet_left(args, 15.1, 5),
                                Furniture.sink(args, 13, 6, 2),

                                Furniture.lamp(args, 2, 5, 2),
                                Furniture.chair_right(args, 8, 1),
                                Furniture.chair_right(args, 8, 2),
                                Furniture.chair_front(args, 7, 2),
                                Furniture.dinning_table_vertical(args, 7, 1, 2),
                                Furniture.flowerpot(args, 7.5, 1.8, 2),
                                Furniture.door(args, 9, 6, 2),
                                Furniture.window(args, 8, 6.5, 2),
                                Furniture.window(args, 10, 6.5, 2),
                                Furniture.library_front(args, 0, 5, 2),
                                Furniture.library_front(args, 3, 5, 2),
                                Furniture.complex_front(args, 11.2, 1),
                                Furniture.complex_front(args, 13.1, 1),
                                Furniture.complex_front(args, 15, 1),

                                Furniture.counter(args, 11.1, 0),
                                Furniture.counter_reverse(args, 14, 0, 2),

                                Furniture.pet_bed(args, 10, 5)]
      args.state.miscellaneous ||= [Wall.green_wallpaper(args, 0, 3),
                                    Wall.green_wallpaper(args, 1, 3),
                                    Wall.green_wallpaper(args, 2, 3),
                                    Wall.green_wallpaper(args, 3, 3),
                                    Wall.green_wallpaper(args, 4, 3),
                                    Wall.green_wallpaper(args, 5, 3),
                                    Wall.red_wallpaper(args, 6, 3),
                                    Furniture.shelf(args, 6, 7),
                                    Furniture.flowerpot(args, 7, 7, 2)]
    end
  end
end
