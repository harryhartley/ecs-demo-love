local Concord = require('lib.concord')

local Map = Concord.system({
  pool = {'map'}
})

local function generateRandomTile()
  local r = math.random()
  if r < 0.7 then
    return 1
  else
    return 2
  end
end

function Map:load()
  for _, e in ipairs(self.pool) do
    for y = 0, e.map.height-1 do
      for x = 0, e.map.width-1 do
        e.map.map[y][x] = generateRandomTile()
      end
    end
  end
end

local function drawTile(tileId, x, y, spritesheet)
  if tileId == 1 then
    local floorQuad = love.graphics.newQuad(2*16, 0*16, 16, 16, spritesheet:getDimensions())
    love.graphics.draw(spritesheet, floorQuad, x*16, y*16)
  end
  if tileId == 2 then
    local wallQuad = love.graphics.newQuad(3*16, 0*16, 16, 16, spritesheet:getDimensions())
    love.graphics.draw(spritesheet, wallQuad, x*16, y*16)
  end
end

function Map:draw(spritesheet)
  for _, e in ipairs(self.pool) do
    for y = 0, e.map.height-1 do
      for x = 0, e.map.width-1 do
        drawTile(e.map.map[y][x], x, y, spritesheet)
      end
    end
  end
end

return Map