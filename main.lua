
Camera = require 'lib.hump.camera'
Timer = require 'lib.hump.timer'
Colors = require 'utils.colors'
util = require 'utils.util'

--UI should not be a global.
UI = require 'lib.gspot'

--State of the games.
state = require 'gamestate'

mainmenu = require 'scene.mainmenu'

function love.load()

    --state.init()
    state:addState(mainmenu)

    --Load here scenes.
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

--Global keyboard
function love.keypressed(key, scancode, isrepeat)
    if key == 'q' then 
        love.event.quit(1)
    end
end

--Load an animation.
function newAnimation(spreadsheet, width, height, duration)

end