local Concord = require('lib.concord')

local MoveSystem = Concord.system({
  pool = {'position', 'velocity'}
})

function MoveSystem:update(dt)
  for _, e in ipairs(self.pool) do
    e.position.x = e.position.x+e.velocity.x
    e.position.y = e.position.y+e.velocity.y
    e.velocity.x = 0
    e.velocity.y = 0
  end
end

return MoveSystem