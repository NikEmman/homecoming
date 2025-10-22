class Level
  class << self
    def load_1(args)
      Biome.number_one(args)
      args.state.home_position ||= { col: 0, row: 1, direction: 'home' }
      args.state.goal_positions ||= [{ col: 1, row: 2 }]
    end

    def load_2(args)
      Biome.number_one(args)
      args.state.home_position ||= { col: 0, row: 1, direction: 'home' }
      args.state.goal_positions ||= [{ col: 3, row: 2 }]
    end

    def load_3(args)
      Biome.number_one(args)
      args.state.home_position ||= { col: 0, row: 1, direction: 'home' }
      args.state.goal_positions ||= [{ col: 5, row: 3 }]
    end

    def load_4(args)
      Biome.number_one(args)
      args.state.home_position ||= { col: 0, row: 1, direction: 'home' }
      args.state.goal_positions ||= [{ col: 8, row: 4 }]
    end

    def load_5(args)
      Biome.number_one(args)
      args.state.home_position ||= { col: 0, row: 1, direction: 'home' }
      args.state.goal_positions ||= [{ col: 4, row: 3 }, { col: 5, row: 0 }]
    end
  end
end
