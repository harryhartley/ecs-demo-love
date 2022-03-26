local Concord = require('lib.concord')

Concord.utils.loadNamespace('components')

local Systems = {}
Concord.utils.loadNamespace('systems', Systems)

local world = Concord.world()
world:addSystems(
  Systems.MoveSystem,
  Systems.DrawSystem,
  Systems.ControlSystem
)

local spritesheet = love.graphics.newImage('img/spritesheet.png')
local playerQuad = love.graphics.newQuad(0, 0, 16, 16, spritesheet:getDimensions())

local player = Concord.entity(world)
:give('position', 0, 0)
:give('velocity', 0, 0)
:give('image', spritesheet, playerQuad)
:give('drawable')
:give('control', 'w', 'a', 's', 'd')

function love.keypressed(key)
  world:emit('keypressed', key)
end

function love.update(dt)
  world:emit('update', dt)
end

function love.draw()
  world:emit('draw')
end