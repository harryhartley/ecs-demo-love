local Concord = require('lib.concord')

Concord.component('image', function(c, spritesheet, quad)
  c.spritesheet = spritesheet
  c.quad = quad
end)