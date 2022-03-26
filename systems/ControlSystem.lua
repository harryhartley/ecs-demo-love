local Concord = require('lib.concord')

local ControlSystem = Concord.system({
  pool = {'position', 'velocity', 'control'}
})

function ControlSystem:keypressed(key)
  for _, e in ipairs(self.pool) do
    if key == e.control.up then
      e.velocity.y = e.velocity.y - 1
    end
    if key == e.control.left then
      e.velocity.x = e.velocity.x - 1
    end
    if key == e.control.down then
      e.velocity.y = e.velocity.y+1
    end
    if key == e.control.right then
      e.velocity.x = e.velocity.x+1
    end
  end
end

return ControlSystem