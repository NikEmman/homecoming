class Carpet
  class << self
    def carpet_horizontal(row = 0, col = 0)
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
  end
end
