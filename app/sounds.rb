# game sounds class
class Sound
  class << self
    def area_cleanup(args)
      args.outputs.sounds << 'sounds/start_area_cleanup.mp3'
    end
  end
end
