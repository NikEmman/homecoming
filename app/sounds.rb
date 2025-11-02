# game sounds class
class Sound
  class << self
    def area_cleanup(args)
      args.outputs.sounds << 'sounds/start_area_cleanup.mp3'
    end

    def vacuum_on(args)
      args.audio[:music] ||=
        { input: 'sounds/on.mp3', looping: true }
    end

    def cleanup_completed(args)
      args.audio[:cleanup_completed] ||= { input: 'sounds/cleanup_completed.mp3' }
    end

    def trash_pickup(args)
      args.outputs.sounds << 'sounds/trash_pickup.mp3'
    end

    def return_home(args)
      args.audio[:return_home] ||= { input: 'sounds/return_home.mp3' }
    end

    def error(args)
      args.outputs.sounds << 'sounds/error.mp3'
    end

    def title_music(args)
      args.audio[:music] ||=
        { input: 'sounds/title_scene.mp3', looping: true, gain: 0.3 }
    end

    def password_music(args)
      args.audio[:music] ||=
        { input: 'sounds/password_scene.mp3', looping: true, gain: 0.3 }
    end
  end
end
