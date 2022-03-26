local Concord = require('lib.concord')

Concord.component('map', function(c, width, height)
  c.width = width
  c.height = height
  c.map = {}
  for y = 0, height-1 do
    c.map[y] = {}
    for x = 0, width-1 do
      c.map[y][x] = 0
    end
  end
end)