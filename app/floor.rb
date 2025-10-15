# Floorboard tiles class
class Floor
  class << self
    def tarp(row = 0, col = 0)
      { x: row * 200,
        y: col * 200,
        w: 200,
        h: 200,
        tile_w: 60,
        tile_h: 55,
        tile_x: 18,
        tile_y: 18,
        path: 'sprites/background/topdownhouse_floorsandwalls.png' }
    end

    def laminate(row = 0, col = 1)
      { x: row * 200,
        y: col * 200,
        w: 200,
        h: 200,
        tile_w: 200,
        tile_h: 200,
        tile_x: 0,
        tile_y: 60,
        path: 'sprites/background/laminate2.jpg' }
    end

    def hardwood(row = 0, col = 2)
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
        tile_w: 2500,
        tile_h: 2500,
        tile_x: 0,
        tile_y: 270,
        path: 'sprites/background/hex.png' }
    end
  end
end
