# frozen_string_literal: true

# labels class
class Labels
  class << self
    def title(args)
      title_text = 'Roxanne\'s Quest'
      start_text = 'Press S to START the game'
      title_w, = GTK.calcstringbox(title_text, size_enum: 20)
      start_w, = GTK.calcstringbox(start_text, size_enum: 2)

      [
        {
          x: (args.grid.w - title_w) / 2,
          y: args.grid.h - 40,
          text: title_text,
          size_enum: 20
        },
        {
          x: 40,
          y: args.grid.h - 180,
          text: 'Program Roxanne the robot vacuum to move exactly on top of dirty spots, then back to base'
        },

        {
          x: 40,
          y: 235,
          text: 'How to play:',
          size_enum: 3
        },
        {
          x: 40,
          y: 180,
          text: 'Press arrow keys to program moves | E to execute them'
        },
        {
          x: 40,
          y: 140,
          text: 'C to clear move sequence or D to remove last step'
        },
        {
          x: (args.grid.w - start_w) / 2,
          y: 80,
          text: start_text,
          size_enum: 2

        },
        {
          x: 40,
          y: 400,
          text: 'Press P to enter a password to start at an advanced level'
        }
      ]
    end

    def end(args)
      [
        {
          x: 300,
          y: args.grid.h - 40,
          text: 'THANKS FOR CLEANING!',
          size_enum: 20
        },

        {
          x: 40,
          y: args.grid.h - 200,
          text: 'I hope you enjoyed playing this little game!'
        },
        {
          x: 40,
          y: 160,
          text: 'Press S to start a new game'
        },

        {
          x: 40,
          y: 80,
          text: 'Press X to exit the game'

        }
      ]
    end

    def password(args)
      label_text = { top: 'Hooray, you reached a saving point!',
                     instruction: "Write down the following password so you may start the game at level #{args.state.level}:",
                     password: args.state.password.to_s }

      # we calc the width of the strings, and use it below to center them
      top_w, = GTK.calcstringbox(label_text[:top], size_enum: 15)
      instruction_w, = GTK.calcstringbox(label_text[:instruction])
      password_w, = GTK.calcstringbox(label_text[:password], size_enum: 40)

      [
        {
          x: (args.grid.w - top_w) / 2,
          y: args.grid.h - 40,
          text: label_text[:top],
          size_enum: 15

        },
        {
          x: (args.grid.w - instruction_w) / 2,
          y: args.grid.h - 200,
          text: label_text[:instruction]
        },

        {
          x: (args.grid.w - password_w) / 2,
          y: args.grid.h - 300,
          text: label_text[:password],
          size_enum: 40
        },
        {
          x: 40,
          y: 160,
          text: 'Press N to resume the game'
        },

        {
          x: 40,
          y: 80,
          text: 'Press X to exit the game'

        }
      ]
    end

    def input(args)
      [{
        x: 40,
        y: 500,
        text: 'Enter password to unlock advanced level:',
        r: 255,
        g: 255,
        b: 255,
        a: 255,
        size_enum: 10
      },

       {
         x: 40,
         y: 350,
         text: args.state.password_input.empty? ? 'Type here...' : args.state.password_input.join(''),
         r: 255,
         g: 255,
         b: 255,
         a: 255,
         size_enum: 8
       },

       {
         x: 40,
         y: 200,
         text: 'Press Enter to submit. Backspace to delete.',
         r: 128,
         g: 228,
         b: 128,
         a: 255,
         size_enum: 5
       },
       {
         x: 40,
         y: 100,
         text: 'Press Escape to return to title screen',
         r: 255,
         g: 255,
         b: 255,
         a: 255

       }]
    end

    def current_level(args)
      { x: 1210,
        y: 700,
        text: 'Lvl: ' + args.state.level.to_s,
        r: 255,
        g: 255,
        b: 255,
        a: 255 }
    end

    def wrong_password
      {
        x: 40,
        y: 600,
        text: 'Wrong password! Try again.',
        r: 255,
        g: 80,
        b: 80,
        size_enum: 10
      }
    end

    def missed_goal(args)
      text = if args.state.blocked_route
               'Error, obstacle found! Resetting position...'
             elsif args.state.player_grid[:col] == args.state.home_position[:col] && args.state.player_grid[:row] == args.state.home_position[:row]
               'Error, returned to home too early! Resetting position...'
             else
               'Missed the goal! Resetting position...'
             end
      { x: 50, y: 700, text: text, size_enum: 8, r: 255, g: 120,
        b: 120 }
    end

    def goals_complete(args)
      text = if args.state.level_complete
               'Level completed, press N to go to the next level'
             else
               'The house is clean! Return to home base'
             end
      { x: 30, y: 60, text: text, size_enum: 8, r: 255, g: 255,
        b: 255 }
    end

    def command(line, column, label_width, line_height, command, size_enum)
      text = {
        'up' => '⇧',
        'down' => '⇩',
        'left' => '⇦',
        'right' => '⇨'
      }[command]
      {
        x: 30 + (column * label_width),
        y: 710 - (line * line_height),
        text: text,
        size_enum: size_enum,
        r: 255,
        g: 255,
        b: 255
      }
    end

    def command_deletion
      { x: 30, y: 60, text: 'Press C to clear queue, or D to delete last step, E to execute', size_enum: 7, r: 255, g: 255,
        b: 255 }
    end
  end
end
