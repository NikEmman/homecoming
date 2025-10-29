class Level
  class << self
    def load1(args)
      Biome.number_one(args)
      args.state.home_position ||= { col: 0, row: 2, direction: 'home' }
      args.state.goal_positions ||= [{ col: 2, row: 2 }]
    end

    def load2(args)
      Biome.number_one(args)
      args.state.home_position ||= { col: 0, row: 3, direction: 'home' }
      args.state.goal_positions ||= [{ col: 3, row: 2 }]
    end

    def load3(args)
      Biome.number_one(args)
      args.state.home_position ||= { col: 0, row: 2, direction: 'home' }
      args.state.goal_positions ||= [{ col: 2, row: 0 }]
    end

    def load4(args)
      Biome.number_one(args)
      args.state.home_position ||= { col: 0, row: 2, direction: 'home' }
      args.state.goal_positions ||= [{ col: 5, row: 2 }]
    end

    def load5(args)
      Biome.number_one(args)
      args.state.home_position ||= { col: 0, row: 1, direction: 'home' }
      args.state.goal_positions ||= [{ col: 3, row: 2 }, { col: 5, row: 0 }]
    end
  end
end
