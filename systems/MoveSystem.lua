local Concord = require('lib.concord')

local MoveSystem = Concord.system({
  pool = {'position', 'velocity'},
  mapPool = {'map'}
})

function MoveSystem:move(gridWidth, gridHeight)
  -- local map = self.mapPool[1]
  for _, e in ipairs(self.pool) do
    -- if map.map[e.position.x+e.velocity.x][e.position.y+e.velocity.y] == 2 then --nil reference
    --   return
    -- end
    e.position.x = math.min(math.max(e.position.x+e.velocity.x, 0), gridWidth-1)
    e.position.y = math.min(math.max(e.position.y+e.velocity.y, 0), gridHeight-1)
    e.velocity.x, e.velocity.y = 0, 0
  end
end

return MoveSystem