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
      args.state.goal_positions ||= [{ col: 1, row: 3 }, { col: 2, row: 1 }]
    end

    def load6(args)
      Biome.number_two(args)
      args.state.home_position ||= { col: 0, row: 1, direction: 'home' }
      args.state.goal_positions ||= [{ col: 3, row: 3 }, { col: 1, row: 4 }]
    end

    def load7(args)
      Biome.number_two(args)
      args.state.home_position ||= { col: 0, row: 1, direction: 'home' }
      args.state.goal_positions ||= [{ col: 3, row: 3 }, { col: 4, row: 0 }]
    end

    def load8(args)
      Biome.number_two(args)
      args.state.home_position ||= { col: 0, row: 1, direction: 'home' }
      args.state.goal_positions ||= [{ col: 5, row: 1 }, { col: 1, row: 3 }]
    end

    def load9(args)
      Biome.number_two(args)
      args.state.home_position ||= { col: 0, row: 1, direction: 'home' }
      args.state.goal_positions ||= [{ col: 4, row: 1 }, { col: 2, row: 4 }]
    end

    def load10(args)
      Biome.number_two(args)
      args.state.home_position ||= { col: 0, row: 1, direction: 'home' }
      args.state.goal_positions ||= [{ col: 4, row: 0 }, { col: 5, row: 4 }]
    end

    def load11(args)
      Biome.number_three(args)
      args.state.home_position ||= { col: 7, row: 5, direction: 'home' }
      args.state.goal_positions ||= [{ col: 8, row: 1 }, { col: 4, row: 5 }]
    end

    def load12(args)
      Biome.number_three(args)
      args.state.home_position ||= { col: 7, row: 5, direction: 'home' }
      args.state.goal_positions ||= [{ col: 10, row: 5 }, { col: 4, row: 3 }]
    end

    def load13(args)
      Biome.number_three(args)
      args.state.home_position ||= { col: 7, row: 5, direction: 'home' }
      args.state.goal_positions ||= [{ col: 13, row: 4 }, { col: 8, row: 2 }]
    end

    def load14(args)
      Biome.number_three(args)
      args.state.home_position ||= { col: 7, row: 5, direction: 'home' }
      args.state.goal_positions ||= [{ col: 0, row: 4 }, { col: 5, row: 2 }]
    end

    def load15(args)
      Biome.number_three(args)
      args.state.home_position ||= { col: 7, row: 5, direction: 'home' }
      args.state.goal_positions ||= [{ col: 4, row: 5 }, { col: 7, row: 2 }, { col: 10, row: 2 }]
    end

    def load16(args)
      Biome.number_four(args)
      args.state.home_position ||= { col: 10, row: 5, direction: 'home' }
      args.state.goal_positions ||= [{ col: 5, row: 4 }, { col: 8, row: 1 }, { col: 11, row: 1 }]
    end

    def load17(args)
      Biome.number_four(args)
      args.state.home_position ||= { col: 10, row: 5, direction: 'home' }
      args.state.goal_positions ||= [{ col: 2, row: 3 }, { col: 4, row: 1 }, { col: 9, row: 2 }]
    end

    def load18(args)
      Biome.number_four(args)
      args.state.home_position ||= { col: 10, row: 5, direction: 'home' }
      args.state.goal_positions ||= [{ col: 3, row: 4 }, { col: 6, row: 0 }, { col: 12, row: 3 }]
    end

    def load19(args)
      Biome.number_four(args)
      args.state.home_position ||= { col: 10, row: 5, direction: 'home' }
      args.state.goal_positions ||= [{ col: 12, row: 0 }, { col: 4, row: 5 }, { col: 14, row: 5 }]
    end

    def load20(args)
      Biome.number_four(args)
      args.state.home_position ||= { col: 10, row: 5, direction: 'home' }
      args.state.goal_positions ||= [{ col: 14, row: 0 }, { col: 7, row: 5 }, { col: 7, row: 0 }, { col: 5, row: 3 }]
    end
  end
end
