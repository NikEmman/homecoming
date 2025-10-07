# game sounds class
class Sound
  class << self
    def area_cleanup(args)
      args.outputs.sounds << 'sounds/start_area_cleanup.mp3'
    end

    def vacuum_on(args)
      args.outputs.sounds << 'sounds/on.mp3'
    end

    def vacuum_off(args)
      args.outputs.sounds << 'sounds/off.mp3'
    end

    def charging(args)
      # TODO: merge with collect_dust
      args.outputs.sounds << 'sounds/charging.mp3'
    end

    def cleanup_completed(args)
      args.outputs.sounds << 'sounds/cleanup_completed .mp3'
    end

    def trash_pickup(args)
      args.outputs.sounds << 'sounds/trash_pickup.mp3'
    end

    def collect_dust(args)
      args.outputs.sounds << 'sounds/collect_dust.mp3'
    end

    def vacuuming(args)
      args.outputs.sounds << 'sounds/vacuuming.mp3'
    end

    def movement_sounds(args)
      sounds << on
      args.move_queue.each do
        sounds << vacuuming
      end
      sounds << off
      args.state.sounds  ||= sounds

      args.outputs.sounds << args.state.sounds
    end
  end
end
