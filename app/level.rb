# frozen_string_literal: true

# class to set each lvl's variables
class Level
  class << self
    def load1(args)
      Biome.number_one(args)
      args.state.home_position ||= { col: 0, row: 2, direction: 'home' }
      args.state.goal_positions ||= [{ col: 2, row: 2 }]
    end

    def load2(args)
      Biome.number_one(args)
      args.state.home_position ||= { col: 0, row: 2, direction: 'home' }
      args.state.goal_positions ||= [{ col: 1, row: 4 }]
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
      args.state.goal_positions ||= [{ col: 3, row: 2 }, { col: 4, row: 0 }]
    end

    def load6(args)
      Biome.number_two(args)
      args.state.home_position ||= { col: 0, row: 1, direction: 'home' }
      args.state.goal_positions ||= [{ col: 2, row: 3 }, { col: 2, row: 1 }]
    end

    def load7(args)
      Biome.number_two(args)
      args.state.home_position ||= { col: 0, row: 1, direction: 'home' }
      args.state.goal_positions ||= [{ col: 3, row: 3 }, { col: 1, row: 4 }]
    end

    def load8(args)
      Biome.number_two(args)
      args.state.home_position ||= { col: 0, row: 1, direction: 'home' }
      args.state.goal_positions ||= [{ col: 2, row: 0 }, { col: 1, row: 3 }]
    end

    def load9(args)
      Biome.number_two(args)
      args.state.home_position ||= { col: 0, row: 1, direction: 'home' }
      args.state.goal_positions ||= [{ col: 4, row: 1 }, { col: 1, row: 4 }]
    end

    def load10(args)
      Biome.number_two(args)
      args.state.home_position ||= { col: 0, row: 1, direction: 'home' }
      args.state.goal_positions ||= [{ col: 4, row: 0 }, { col: 5, row: 5 }]
    end

    def load11(args)
      Biome.number_three(args)
      args.state.home_position ||= { col: 0, row: 1, direction: 'home' }
      args.state.goal_positions ||= [{ col: 4, row: 0 }, { col: 5, row: 5 }]
    end
  end
end
