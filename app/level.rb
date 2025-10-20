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
  end
end
