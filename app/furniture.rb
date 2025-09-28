# Floorboard tiles class
class Furniture
  class << self
    def sofa(row = 0, col = 0)
      { x: row * 200,
        y: col * 200,
        w: 160,
        h: 160,
        tile_w: 53,
        tile_h: 40,
        tile_x: 20,
        tile_y: 160,
        path: 'sprites/background/TopDownHouse_FurnitureState2.png' }
    end
  end
end
