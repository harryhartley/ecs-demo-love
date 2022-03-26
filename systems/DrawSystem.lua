local Concord = require('lib.concord')

local DrawSystem = Concord.system({
  pool = {'position', 'image', 'drawable'}
})

function DrawSystem:draw(spritesheet)
  for _, e in ipairs(self.pool) do
    love.graphics.draw(spritesheet, e.image.quad, e.position.x*16, e.position.y*16)
  end
end

return DrawSystem