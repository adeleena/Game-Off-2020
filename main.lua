
Camera = require 'lib.hump.camera'
Timer = require 'lib.hump.timer'
Colors = require 'utils.colors'
util = require 'utils.util'

--UI should not be a global.
--UI = require 'lib.gspot'

--State of the games.
state = require 'gamestate'

mainmenu = require 'scene.mainmenu'

function love.load()

    mainmenu:init()

    --Load here scenes.
    state:addState(mainmenu)

    --Check old mouse.
    oldLMBDown = false    
    oldRMBDown = false
end

function love.update(dt)

    state:update(dt)

    oldLMBDown = love.mouse.isDown(1)
    oldRMBDown = love.mouse.isDown(2)
end

function love.draw()
    state:draw()
end

function love.keypressed(key, scancode, isrepeat)
    --Global keyboard.
    if key == 'q' then 
        love.event.quit(1)
    end

    --Local state keyboard.
    state:keyboard(dt, key, scancode, isrepeat)
end

--Load an animation.
function newAnimation(spreadsheet, width, height, duration)

end

--Registering mouse events.
love.mousepressed = function(x, y, button)
	state:mouse(x, y, button)
end
love.mousereleased = function(x, y, button)
	state:mouse(x, y, button)
end
love.wheelmoved = function(x, y)
	state:mousewheel(x, y)
end