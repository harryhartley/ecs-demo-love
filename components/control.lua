local Concord = require('lib.concord')

Concord.component('control', function(c, up, left, down, right)
  c.up = up
  c.left = left
  c.down = down
  c.right = right
end)