local Concord = require('lib.concord')

Concord.component('health', function(c, current, max)
  c.current = current
  c.max = max
end)