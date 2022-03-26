local Concord = require('../lib/concord')

Concord.component('image', function(c, sprite)
  c.image = love.graphics.newImage(sprite)
end)