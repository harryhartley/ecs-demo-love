local push = require('lib.push')
local Concord = require('lib.concord')

local tileSize, gridWidth, gridHeight = 16, 32, 16
local gameWidth, gameHeight = gridWidth*tileSize, gridHeight*tileSize
local windowWidth, windowHeight = love.window.getDesktopDimensions()
windowWidth, windowHeight = windowWidth*.7, windowHeight*.7

push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = false, pixelperfect = true})

Concord.utils.loadNamespace('components')

local Systems = {}
Concord.utils.loadNamespace('systems', Systems)

local world = Concord.world()
world:addSystems(
  Systems.MapSystem,
  Systems.MoveSystem,
  Systems.DrawSystem,
  Systems.ControlSystem
)

local spritesheet = love.graphics.newImage('img/spritesheet.png')
local playerQuad = love.graphics.newQuad(0*tileSize, 0*tileSize, tileSize, tileSize, spritesheet:getDimensions())

local map = Concord.entity(world)
:give('map', gridWidth, gridHeight)

local player = Concord.entity(world)
:give('position', math.floor(gridWidth/2), math.floor(gridHeight/2))
:give('velocity', 0, 0)
:give('image', playerQuad)
:give('drawable')
:give('control', 'w', 'a', 's', 'd')

function love.load()
  world:emit('load')
end

function love.keypressed(key)
  world:emit('keypressed', key)
end

function love.update(dt)
  world:emit('update')
  world:emit('move', gridWidth, gridHeight)
end

function love.draw()
  push:start()
  world:emit('draw', spritesheet)
  push:finish()
end