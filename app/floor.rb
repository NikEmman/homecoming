# Floorboard tiles class
class Floor
  class << self
    def laminate(row = 0, col = 1)
      { x: row * 200,
        y: col * 200,
        w: 200,
        h: 200,
        tile_w: 61,
        tile_h: 46,
        tile_x: 17,
        tile_y: 81,
        path: 'sprites/background/topdownhouse_floorsandwalls.png' }
    end

    def carpeted(row = 0, col = 1)
      { x: row * 200,
        y: col * 200,
        w: 200,
        h: 200,
        tile_w: 61,
        tile_h: 46,
        tile_x: 81,
        tile_y: 81,
        path: 'sprites/background/topdownhouse_floorsandwalls.png' }
    end

    def hardwood(row = 0, col = 2)
      { x: row * 200,
        y: col * 200,
        w: 200,
        h: 200,
        tile_w: 200,
        tile_h: 200,
        tile_x: 0,
        tile_y: 60,
        path: 'sprites/background/laminate.jpg' }
    end

    def fishbone(row = 0, col = 1)
      { x: row * 200,
        y: col * 200,
        w: 200,
        h: 200,
        tile_w: 800,
        tile_h: 900,
        tile_x: 0,
        tile_y: 140,
        path: 'sprites/background/fishbone.png' }
    end

    def hex(row = 0, col = 1)
      { x: row * 200,
        y: col * 200,
        w: 200,
        h: 200,
        tile_w: 636,
        tile_h: 800,
        tile_x: 0,
        tile_y: 270,
        path: 'sprites/background/hex.png' }
    end

    def floorboard(row = 0, col = 1)
      { x: row * 200,
        y: col * 200,
        w: 200,
        h: 200,
        tile_h: 940,
        tile_y: 20,
        path: 'sprites/background/floorboard.png' }
    end

    def tiles(row = 0, col = 1)
      { x: row * 200,
        y: col * 200,
        w: 200,
        h: 200,
        path: 'sprites/background/tiles2.png' }
    end
  end
end
