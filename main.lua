
CAMERA = require 'lib.hump.camera'
TIMER = require 'lib.hump.timer'
COLORS = require 'utils.colors'
UTIL = require 'utils.util'

--State of the games.
STATE = require 'gamestate'

DEBUG_MODE = false

function love.load()

    debug = require 'utils.debug'
    debug:init()

    mainmenu = require 'scene.mainmenu'
    mainmenu:init()

    --Load here scenes.
    STATE:addState(mainmenu)
    STATE:addState(about)

    --Check old mouse.
    oldLMBDown = false    
    oldRMBDown = false
end

function love.update(dt)

    STATE:update(dt)
    debug:update(dt)

    oldLMBDown = love.mouse.isDown(1)
    oldRMBDown = love.mouse.isDown(2)
end

function love.draw()
    STATE:draw()
    debug:draw()
end

function love.keypressed(key, scancode, isrepeat)
    --Global keyboard.
    if key == 'q' then 
        print('[WARN]: Quit from global')
        love.event.quit(1)
    end

    if key == '`' then 
        print('[INFO]: Switching to the DEBUG_MODE')
        DEBUG_MODE = not DEBUG_MODE
    end

    --Local state keyboard.
    STATE:keyboard(dt, key, scancode, isrepeat)
end

--Registering mouse events.
love.mousepressed = function(x, y, button)
	STATE:mouseP(x, y, button)
end
love.mousereleased = function(x, y, button)
	STATE:mouseR(x, y, button)
end
love.wheelmoved = function(x, y)
	STATE:mouseW(x, y)
end

--Load an animation.
function newAnimation(spreadsheet, width, height, duration)
    --@boctavian96: TODO.
end