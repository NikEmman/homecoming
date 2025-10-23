def title_labels(args)
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

    }
  ]
end

def end_labels(args)
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

def password_labels(args)
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
