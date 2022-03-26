local Concord = require('lib.concord')

local Systems = {}
Concord.utils.loadNamespace('systems', Systems)

Concord.utils.loadNamespace('components')

local world = Concord.world()
world:addSystems(Systems.moveSystem, Systems.drawSystem)

local entity_1 = Concord.entity(world)
:give('position', 100, 100)
:give('velocity', 100, 0)
:give('image', 'img/idle/Warrior_Idle_1.png')
:give('drawable')

function love.update(dt)
  world:emit('update', dt)
end

function love.draw()
  world:emit('draw')
  for k, v in pairs(Systems) do
    print(k, v)
  end
end