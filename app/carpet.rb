class Carpet
  class << self
    def big_horizontal(row = 0, col = 0, variant = 1)
      { x: row * 200,
        y: col * 200,
        w: 200,
        h: 150,
        tile_w: 48,
        tile_h: 32,
        tile_x: 160,
        tile_y: 32,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def big_vertical(row = 0, col = 0, variant = 1)
      { x: row * 200,
        y: col * 200,
        w: 150,
        h: 200,
        tile_w: 48,
        tile_h: 48,
        tile_x: 160,
        tile_y: 64,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def small_vertical(row = 0, col = 0, variant = 1)
      { x: row * 200,
        y: col * 200,
        w: 80,
        h: 150,
        tile_w: 18,
        tile_h: 32,
        tile_x: 110,
        tile_y: 32,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def small_horizontal(row = 0, col = 0, variant = 1)
      { x: row * 200,
        y: col * 200,
        w: 150,
        h: 80,
        tile_w: 32,
        tile_h: 18,
        tile_x: 128,
        tile_y: 32,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end

    def round(row = 0, col = 0, variant = 1)
      { x: row * 200,
        y: col * 200,
        w: 80,
        h: 80,
        tile_w: 23,
        tile_h: 16,
        tile_x: 132,
        tile_y: 48,
        path: "sprites/background/topdownhouse_furniturestate#{variant}.png" }
    end
  end
end
