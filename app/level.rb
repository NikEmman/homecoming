class Level
  class << self
    def load_1(args)
      args.state.home_position ||= { col: 0, row: 5, direction: 'home' }
      args.state.goal_positions ||= [{ col: 5, row: 6 }, { col: 2, row: 5 }]
      args.state.carpets ||= [Carpet.big_horizontal(args, 5, 2, 1)]
      args.state.floor_type ||= 'hex'

      args.state.furniture ||= [Furniture.sofa_back(args, 2, 4, 2),
                                Furniture.sofa_front(args, 2, 7),
                                Furniture.single_sofa_left(args, 5, 5)]
    end
  end
end
