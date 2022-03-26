local Concord = require('lib/concord')

local DrawSystem = Concord.system({
  pool = {'position', 'image', 'drawable'}
})

function DrawSystem:draw()
  for _, e in ipairs(self.pool) do
    love.graphics.draw(e.image.image, e.position.x, e.position.y)
  end
end

return DrawSystem