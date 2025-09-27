# Floorboard tiles class
class Floor
  class << self
    def tarp
      { x: 0,
        y: 0,
        w: 200,
        h: 200,
        tile_w: 60,
        tile_h: 55,
        tile_x: 18,
        tile_y: 18,
        path: 'sprites/background/topDownHouse_floorsAndWalls.png' }
    end

    def laminate
      { x: 200,
        y: 0,
        w: 200,
        h: 200,
        tile_w: 64,
        tile_h: 47,
        tile_x: 144,
        tile_y: 81,
        path: 'sprites/background/topDownHouse_floorsAndWalls.png' }
    end

    def hardwood
      { x: 400,
        y: 0,
        w: 200,
        h: 200,
        tile_w: 61,
        tile_h: 47,
        tile_x: 17,
        tile_y: 81,
        path: 'sprites/background/topDownHouse_floorsAndWalls.png' }
    end

    def tiles
      { x: 600,
        y: 0,
        w: 200,
        h: 200,
        tile_w: 62,
        tile_h: 38,
        tile_x: 209,
        tile_y: 42,
        path: 'sprites/background/topDownHouse_floorsAndWalls.png' }
    end
  end
end
