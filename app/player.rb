# Player class for ....well, the Player
class Player
  class << self
    def move_direction(args, direction)
      sprites = args.state.player_sprites
      current = args.state.player
      # use dup to avoid mutating the original sprite
      target = sprites[direction.to_sym].dup

      # Copy current position
      target.x = current.x
      target.y = current.y

      # Apply movement
      case direction
      when 'up'
        target.y += target.speed
      when 'down'
        target.y -= target.speed
      when 'left'
        target.x -= target.speed
      when 'right'
        target.x += target.speed
      end

      # Only update if within bounds
      return unless inbounds?(args, target)

      args.state.player = target
      args.state.direction = direction
    end

    def up
      { x: 200,
        y: 300,
        w: 80,
        h: 80,
        path: 'sprites/robot2.png',
        tile_w: 64,
        tile_h: 64,
        tile_x: 64,
        tile_y: 0,
        speed: 10 }
    end

    def down
      { x: 200,
        y: 300,
        w: 80,
        h: 80,
        path: 'sprites/robot2.png',
        tile_w: 64,
        tile_h: 64,
        tile_x: 0,
        tile_y: 0,
        speed: 10 }
    end

    def left
      { x: 200,
        y: 300,
        w: 100,
        h: 100,
        path: 'sprites/robot.png',
        tile_w: 64,
        tile_h: 64,
        tile_x: 0,
        tile_y: 64,
        speed: 10 }
    end

    def right
      { x: 200,
        y: 300,
        w: 100,
        h: 100,
        path: 'sprites/robot.png',
        tile_w: 64,
        tile_h: 64,
        tile_x: 0,
        tile_y: 0,
        speed: 10 }
    end

    def inbounds?(args, sprite)
      x = sprite.x
      y = sprite.y

      # This ensures that bounds work, since up and down sprites are smaller than 100x100
      w = [sprite.w, 100].max
      h = [sprite.h, 100].max

      x >= 0 &&
        y >= 0 &&
        x + w <= args.grid.w &&
        y + h <= args.grid.h
    end
  end
end
