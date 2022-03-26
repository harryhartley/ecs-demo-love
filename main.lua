local push = require('lib.push')
local Concord = require('lib.concord')

local tileSize, gridWidth, gridHeight = 16, 32, 16
local gameWidth, gameHeight = gridWidth * tileSize, gridHeight * tileSize
local windowWidth, windowHeight = love.window.getDesktopDimensions()
windowWidth, windowHeight = windowWidth * .7, windowHeight * .7

push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = false, pixelperfect = true})

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
local playerQuad = love.graphics.newQuad(0 * tileSize, 0 * tileSize, tileSize, tileSize, spritesheet:getDimensions())
local floorQuad = love.graphics.newQuad(2 * tileSize, 0 * tileSize, tileSize, tileSize, spritesheet:getDimensions())
local wallQuad = love.graphics.newQuad(3 * tileSize, 0 * tileSize, tileSize, tileSize, spritesheet:getDimensions())

local player = Concord.entity(world)
:give('position', 0, 0)
:give('velocity', 0, 0)
:give('image', spritesheet, playerQuad)
:give('drawable')
:give('control', 'w', 'a', 's', 'd')

function love.load()
  world:emit('load')
end

function love.keypressed(key)
  world:emit('keypressed', key)
end

function love.update(dt)
  world:emit('update', dt)
end

function love.draw()
  push:start()
  world:emit('draw')
  push:finish()
end