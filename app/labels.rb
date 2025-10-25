# labels class
class Labels
  class << self
    def title(args)
      [
        {
          x: 40,
          y: args.grid.h - 40,
          text: 'Home coming',
          size_enum: 6
        },
        {
          x: 40,
          y: args.grid.h - 88,
          text: 'Lead the vacuum to clean all dirty spots, then guide it to base'
        },
        {
          x: 40,
          y: args.grid.h - 120,
          text: 'by Nikos Emmanouilidis'
        },
        {
          x: 40,
          y: 205,
          text: 'How to play:',
          size_enum: 3
        },
        {
          x: 40,
          y: 160,
          text: 'Press arrow keys to program moves | E to execute them'
        },
        {
          x: 40,
          y: 120,
          text: 'C to clear move sequence or D to remove last step'
        },
        {
          x: 40,
          y: 80,
          text: 'S to start the game'

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
                     instruction: "Write down the following password so you start the game at level #{args.state.level}:",
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
  end
end
