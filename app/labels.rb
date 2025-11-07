# frozen_string_literal: true

TRANSLATIONS = {
  en: {
    title: "Roxanne's Quest",
    start: 'Press S to START the game',
    description: 'Program Roxanne the robot vacuum to move exactly on top of dirty spots, then back to base',
    how_to_play: 'How to play:',
    controls_moves: 'Press arrow keys to program moves | E to execute them',
    controls_clear: 'C to clear move sequence or D to remove last step',
    password_prompt: 'Press P to enter a password to start at an advanced level',
    switch_lang: 'Press L to switch language',

    thanks: 'THANK YOU FOR PLAYING!',
    enjoyed: 'I hope you enjoyed the game!',
    new_game: 'Press S to start a new game',
    exit_game: 'Press X to exit the game',

    saving_point: 'Hooray, you reached a saving point!',
    write_password: 'Write down the following password so you may start the game at level %<level>s:',
    resume: 'Press N to resume the game',

    enter_password: 'Enter password to unlock advanced level:',
    type_here: 'Type here...',
    submit_password: 'Press Enter to submit. Backspace to delete.',
    escape_title: 'Press Escape to return to title screen',

    level: 'Lvl: ',
    wrong_password: 'Wrong password! Try again.',

    error_obstacle: 'Error, obstacle found! Resetting position...',
    error_early_home: 'Error, returned to home too early! Resetting position...',
    error_missed: 'Missed the goal! Resetting position...',

    level_complete: 'Level completed, press N to go to the next level',
    return_home: 'The house is clean! Return to home base',

    command_help: 'Press C to clear queue, or D to delete last step, E to execute'
  },
  gre: {
    title: 'Η Αποστολή της Ρωξάνης',
    start: 'Πάτα S για ΕΝΑΡΞΗ',
    description: 'Οδήγησε τη ρομποτική σκούπα Ροξάννη ακριβώς πάνω στις βρωμιές και μετά γύρισέ την στη βάση',
    how_to_play: 'Πώς παίζεται:',
    controls_moves: 'Πάτα τα βελάκια για προγραμματισμό κινήσεων | E για εκτέλεση',
    controls_clear: 'C για καθάρισμα κινήσεων ή D για αφαίρεση τελευταίας κίνησης',
    password_prompt: 'Πάτα P για εισαγωγή κωδικού και έναρξη από προχωρημένο επιπέδο',
    switch_lang: 'Πάτα L για αλλαγή γλώσσας',

    thanks: 'ΟΛΑ ΠΕΝΤΑΚΑΘΑΡΑ!',
    enjoyed: 'Ελπίζω να σου άρεσε το παιχνίδι!',
    new_game: 'Πάτα S για νέο παιχνίδι',
    exit_game: 'Πάτα X για έξοδο',

    saving_point: 'Μπράβο, έφτασες σε σημείο αποθήκευσης!',
    write_password: 'Γράψε τον παρακάτω κωδικό για να ξεκινήσεις από το επίπεδο %<level>s:',
    resume: 'Πάτα N για συνέχεια',

    enter_password: 'Εισαγωγή κωδικού για προχωρημένα επίπεδα:',
    type_here: 'Γράψε εδώ...',
    submit_password: 'Enter για εισαγωγή. Backspace για διαγραφή.',
    escape_title: 'Escape για επιστροφή στο μενού',

    level: 'Επίπ: ',
    wrong_password: 'Λάθος κωδικός! Προσπάθησε ξανά.',

    error_obstacle: 'Έπεσες σε εμπόδιο! Επαναφορά θέσης...',
    error_early_home: 'Σφάλμα, γύρισες σπίτι νωρίς! Επαναφορά...',
    error_missed: 'Έχασες τον στόχο! Επαναφορά θέσης...',

    level_complete: 'Το επίπεδο ολοκληρώθηκε, πάτα N για το επόμενο',
    return_home: 'Το σπίτι είναι καθαρό! Γύρνα στη βάση',

    command_help: 'C για καθαρισμό κινήσεων, D για διαγραφή τελευταίας, E για εκτέλεση'
  }
}.freeze

# Helper to get current language translations
def self.t(key, **interpolations)
  lang = $args&.state&.lang || 'en'
  text = TRANSLATIONS[lang.to_sym][key] || TRANSLATIONS[:en][key] || "??#{key}??"
  interpolations.empty? ? text : text % interpolations
end

class Labels
  class << self
    # title screen
    def title(args)
      title_text = t(:title)
      start_text = t(:start)

      title_w, = GTK.calcstringbox(title_text, size_enum: 20)
      start_w, = GTK.calcstringbox(start_text, size_enum: 2)

      [
        { x: (args.grid.w - title_w) / 2, y: args.grid.h - 40, text: title_text, size_enum: 20 },
        { x: 40, y: args.grid.h - 180, text: t(:description) },
        { x: 40, y: 235, text: t(:how_to_play), size_enum: 3 },
        { x: 40, y: 180, text: t(:controls_moves) },
        { x: 40, y: 140, text: t(:controls_clear) },
        { x: (args.grid.w - start_w) / 2, y: 80, text: start_text, size_enum: 2 },
        { x: 40, y: 400, text: t(:password_prompt) },
        { x: 1000, y: 270, text: t(:switch_lang) }
      ]
    end

    def end(args)
      [
        { x: 300, y: args.grid.h - 40, text: t(:thanks), size_enum: 20 },
        { x: 40, y: args.grid.h - 200, text: t(:enjoyed) },
        { x: 40, y: 160, text: t(:new_game) },
        { x: 40, y: 80, text: t(:exit_game) }
      ]
    end

    def password(args)
      top_w, = GTK.calcstringbox(t(:saving_point), size_enum: 15)
      instruction_w, = GTK.calcstringbox(t(:write_password, level: args.state.level))
      password_w, = GTK.calcstringbox(args.state.password.to_s, size_enum: 40)

      [
        { x: (args.grid.w - top_w) / 2, y: args.grid.h - 40, text: t(:saving_point), size_enum: 15 },
        { x: (args.grid.w - instruction_w) / 2, y: args.grid.h - 200,
          text: t(:write_password, level: args.state.level) },
        { x: (args.grid.w - password_w) / 2, y: args.grid.h - 300, text: args.state.password.to_s, size_enum: 40 },
        { x: 40, y: 160, text: t(:resume) },
        { x: 40, y: 80, text: t(:exit_game) }
      ]
    end

    def input(args)
      [
        { x: 40, y: 500, text: t(:enter_password), r: 255, g: 255, b: 255, size_enum: 10 },
        { x: 40, y: 350, text: args.state.password_input.empty? ? t(:type_here) : args.state.password_input.join(''),
          r: 255, g: 255, b: 255, size_enum: 8 },
        { x: 40, y: 200, text: t(:submit_password), r: 128, g: 228, b: 128, size_enum: 5 },
        { x: 40, y: 100, text: t(:escape_title), r: 255, g: 255, b: 255 }
      ]
    end

    def current_level(args)
      { x: 1200, y: 700, text: t(:level) + args.state.level.to_s, r: 255, g: 255, b: 255 }
    end

    def wrong_password
      { x: 40, y: 600, text: t(:wrong_password), r: 255, g: 80, b: 80, size_enum: 10 }
    end

    def missed_goal(args)
      text = if args.state.blocked_route
               t(:error_obstacle)
             elsif args.state.player_grid[:col] == args.state.home_position[:col] && args.state.player_grid[:row] == args.state.home_position[:row]
               t(:error_early_home)
             else
               t(:error_missed)
             end
      { x: 50, y: 700, text: text, size_enum: 8, r: 255, g: 120, b: 120 }
    end

    def goals_complete(args)
      text = args.state.level_complete ? t(:level_complete) : t(:return_home)
      { x: 30, y: 60, text: text, size_enum: 8, r: 255, g: 255, b: 255 }
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
      { x: 30, y: 60, text: t(:command_help), size_enum: 7, r: 255, g: 255, b: 255 }
    end

    def t(key, **interpolations)
      lang = $args.state.lang
      text = TRANSLATIONS[lang.to_sym][key]
      interpolations.empty? ? text : text % interpolations
    end
  end
end
