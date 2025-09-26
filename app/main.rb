def tick(args)
  args.outputs.sprites << { x: 0,
                            y: 0,
                            w: 780,
                            h: 320,
                            tile_w: 60,
                            tile_h: 55,
                            tile_x: 18,
                            tile_y: 18,
                            path: 'sprites/background/TopDownHouse_FloorsAndWalls.png' }
  args.outputs.sprites << { x: 0,
                            y: 0,
                            w: 80,
                            h: 80,
                            path: 'sprites/robot2.png',
                            tile_w: 64,
                            tile_h: 64,
                            tile_x: 0,
                            tile_y: 0 }
  args.outputs.sprites << { x: 600,
                            y: 300,
                            w: 80,
                            h: 80,
                            path: 'sprites/robot2.png',
                            tile_w: 64,
                            tile_h: 64,
                            tile_x: 64,
                            tile_y: 0 }
end
