# frozen_string_literal: true

# class to set each lvl's variables
class Level
  class << self
    def load1(args)
      Biome.number_one(args)
      args.state.home_position ||= { col: 0, row: 2, direction: 'home' }
      args.state.goal_positions ||= [
        [{ col: 2, row: 2 }],
        [{ col: 1, row: 3 }],
        [{ col: 1, row: 1 }]
      ].sample
    end

    def load2(args)
      Biome.number_one(args)
      args.state.home_position ||= { col: 0, row: 2, direction: 'home' }
      args.state.goal_positions ||= [
        [{ col: 1, row: 4 }],
        [{ col: 3, row: 2 }],
        [{ col: 2, row: 3 }],
        [{ col: 2, row: 1 }]
      ].sample
    end

    def load3(args)
      Biome.number_one(args)
      args.state.home_position ||= { col: 0, row: 2, direction: 'home' }
      args.state.goal_positions ||= [
        [{ col: 2, row: 0 }],
        [{ col: 3, row: 1 }],
        [{ col: 2, row: 4 }]

      ].sample
    end

    def load4(args)
      Biome.number_one(args)
      args.state.home_position ||= { col: 0, row: 2, direction: 'home' }
      args.state.goal_positions ||= [
        [{ col: 5, row: 2 }],
        [{ col: 4, row: 5 }],
        [{ col: 5, row: 0 }],
        [{ col: 6, row: 1 }]
      ].sample
    end

    def load5(args)
      Biome.number_one(args)
      args.state.home_position ||= { col: 0, row: 1, direction: 'home' }
      args.state.goal_positions ||= [
        [{ col: 1, row: 3 }, { col: 2, row: 1 }],
        [{ col: 0, row: 3 }, { col: 2, row: 2 }],
        [{ col: 2, row: 1 }, { col: 3, row: 0 }],
        [{ col: 2, row: 0 }, { col: 3, row: 2 }]
      ].sample
    end

    def load6(args)
      Biome.number_two(args)
      args.state.home_position ||= { col: 0, row: 1, direction: 'home' }
      args.state.goal_positions ||= [
        [{ col: 3, row: 3 }, { col: 1, row: 4 }],
        [{ col: 3, row: 1 }, { col: 1, row: 4 }],
        [{ col: 2, row: 3 }, { col: 2, row: 0 }]
      ].sample
    end

    def load7(args)
      Biome.number_two(args)
      args.state.home_position ||= { col: 0, row: 1, direction: 'home' }
      args.state.goal_positions ||= [
        [{ col: 3, row: 3 }, { col: 4, row: 0 }],
        [{ col: 1, row: 3 }, { col: 6, row: 2 }],
        [{ col: 2, row: 3 }, { col: 5, row: 1 }],
        [{ col: 3, row: 4 }, { col: 5, row: 1 }]
      ].sample
    end

    def load8(args)
      Biome.number_two(args)
      args.state.home_position ||= { col: 0, row: 1, direction: 'home' }
      args.state.goal_positions ||= [
        [{ col: 5, row: 1 }, { col: 1, row: 3 }],
        [{ col: 4, row: 0 }, { col: 2, row: 3 }],
        [{ col: 5, row: 3 }, { col: 1, row: 4 }],
        [{ col: 6, row: 1 }, { col: 3, row: 3 }]
      ].sample
    end

    def load9(args)
      Biome.number_two(args)
      args.state.home_position ||= { col: 0, row: 1, direction: 'home' }
      args.state.goal_positions ||= [
        [{ col: 4, row: 1 }, { col: 2, row: 4 }],
        [{ col: 5, row: 0 }, { col: 1, row: 3 }],
        [{ col: 5, row: 1 }, { col: 2, row: 3 }],
        [{ col: 5, row: 3 }, { col: 1, row: 0 }]
      ].sample
    end

    def load10(args)
      Biome.number_two(args)
      args.state.home_position ||= { col: 0, row: 1, direction: 'home' }
      args.state.goal_positions ||= [
        [{ col: 4, row: 0 }, { col: 5, row: 4 }],
        [{ col: 6, row: 4 }, { col: 2, row: 0 }],
        [{ col: 5, row: 0 }, { col: 6, row: 3 }],
        [{ col: 1, row: 4 }, { col: 6, row: 1 }]
      ].sample
    end

    def load11(args)
      Biome.number_three(args)
      args.state.home_position ||= { col: 7, row: 5, direction: 'home' }
      args.state.goal_positions ||= [
        [{ col: 8, row: 1 }, { col: 4, row: 5 }],
        [{ col: 6, row: 0 }, { col: 3, row: 5 }],
        [{ col: 10, row: 1 }, { col: 5, row: 3 }],
        [{ col: 8, row: 0 }, { col: 6, row: 5 }]
      ].sample
    end

    def load12(args)
      Biome.number_three(args)
      args.state.home_position ||= { col: 7, row: 5, direction: 'home' }
      args.state.goal_positions ||= [
        [{ col: 10, row: 5 }, { col: 4, row: 3 }],
        [{ col: 2, row: 5 }, { col: 7, row: 2 }],
        [{ col: 3, row: 4 }, { col: 10, row: 4 }],
        [{ col: 5, row: 3 }, { col: 9, row: 1 }]
      ].sample
    end

    def load13(args)
      Biome.number_three(args)
      args.state.home_position ||= { col: 7, row: 5, direction: 'home' }
      args.state.goal_positions ||= [
        [{ col: 13, row: 4 }, { col: 8, row: 2 }],
        [{ col: 4, row: 1 }, { col: 10, row: 3 }],
        [{ col: 3, row: 5 }, { col: 10, row: 1 }],
        [{ col: 5, row: 4 }, { col: 8, row: 0 }]
      ].sample
    end

    def load14(args)
      Biome.number_three(args)
      args.state.home_position ||= { col: 7, row: 5, direction: 'home' }
      args.state.goal_positions ||= [
        [{ col: 0, row: 4 }, { col: 5, row: 2 }],
        [{ col: 2, row: 2 }, { col: 10, row: 4 }],
        [{ col: 13, row: 5 }, { col: 4, row: 4 }],
        [{ col: 0, row: 3 }, { col: 5, row: 2 }]
      ].sample
    end

    def load15(args)
      Biome.number_three(args)
      args.state.home_position ||= { col: 7, row: 5, direction: 'home' }
      args.state.goal_positions ||= [
        [{ col: 4, row: 5 }, { col: 7, row: 2 }, { col: 10, row: 2 }],
        [{ col: 3, row: 4 }, { col: 5, row: 2 }, { col: 10, row: 5 }],
        [{ col: 2, row: 5 }, { col: 5, row: 3 }, { col: 8, row: 2 }],
        [{ col: 4, row: 5 }, { col: 10, row: 5 }, { col: 7, row: 2 }]
      ].sample
    end

    def load16(args)
      Biome.number_four(args)
      args.state.home_position ||= { col: 10, row: 5, direction: 'home' }
      args.state.goal_positions ||= [
        [{ col: 5, row: 4 }, { col: 8, row: 1 }, { col: 13, row: 2 }],
        [{ col: 5, row: 3 }, { col: 9, row: 0 }, { col: 13, row: 1 }],
        [{ col: 6, row: 5 }, { col: 10, row: 0 }, { col: 14, row: 5 }],
        [{ col: 3, row: 4 }, { col: 12, row: 5 }, { col: 9, row: 1 }]
      ].sample
    end

    def load17(args)
      Biome.number_four(args)
      args.state.home_position ||= { col: 10, row: 5, direction: 'home' }
      args.state.goal_positions ||= [
        [{ col: 2, row: 3 }, { col: 5, row: 1 }, { col: 9, row: 2 }],
        [{ col: 3, row: 4 }, { col: 6, row: 1 }, { col: 9, row: 2 }],
        [{ col: 5, row: 5 }, { col: 9, row: 1 }, { col: 13, row: 5 }],
        [{ col: 4, row: 2 }, { col: 7, row: 1 }, { col: 12, row: 4 }]
      ].sample
    end

    def load18(args)
      Biome.number_four(args)
      args.state.home_position ||= { col: 10, row: 5, direction: 'home' }
      args.state.goal_positions ||= [
        [{ col: 3, row: 4 }, { col: 6, row: 0 }, { col: 12, row: 3 }],
        [{ col: 5, row: 3 }, { col: 4, row: 0 }, { col: 1, row: 3 }],
        [{ col: 8, row: 5 }, { col: 12, row: 0 }, { col: 4, row: 1 }],
        [{ col: 6, row: 5 }, { col: 10, row: 0 }, { col: 2, row: 3 }]
      ].sample
    end

    def load19(args)
      Biome.number_four(args)
      args.state.home_position ||= { col: 10, row: 5, direction: 'home' }
      args.state.goal_positions ||= [
        [{ col: 12, row: 0 }, { col: 4, row: 5 }, { col: 14, row: 5 }],
        [{ col: 0, row: 1 }, { col: 6, row: 2 }, { col: 13, row: 2 }],
        [{ col: 9, row: 0 }, { col: 5, row: 5 }, { col: 13, row: 1 }],
        [{ col: 3, row: 3 }, { col: 8, row: 0 }, { col: 15, row: 3 }]
      ].sample
    end

    def load20(args)
      Biome.number_four(args)
      args.state.home_position ||= { col: 10, row: 5, direction: 'home' }
      args.state.goal_positions ||= [
        [{ col: 14, row: 0 }, { col: 7, row: 5 }, { col: 7, row: 0 }, { col: 5, row: 3 }],
        [{ col: 3, row: 2 }, { col: 6, row: 5 }, { col: 13, row: 4 }, { col: 9, row: 1 }],
        [{ col: 12, row: 0 }, { col: 3, row: 4 }, { col: 8, row: 5 }, { col: 13, row: 2 }],
        [{ col: 5, row: 5 }, { col: 9, row: 0 }, { col: 3, row: 3 }, { col: 13, row: 5 }]
      ].sample
    end
  end
end
