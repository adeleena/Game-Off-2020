local mainmenu = {
    --Todo: @boctavian96 update this
    ui = require 'lib.gspot',

    init = function(self)
        --Simple ui text...

        --Simple ui buttons
        local startButton = self.ui:button('Start', {x = 128, y = gui.style.unit, w = 128, h = gui.style.unit})
        startButton.click = function()
            --Do some stuff...
        end
    end,

    update = function(self, dt)
        self.ui:update(dt)
    end,

    draw = function(self)
        --self.drawDebug()

        self.ui:draw()
    end,

    mousePress = function(self, x, y, button)
        self.ui:mousepress(x, y, button)
    end,

    mouseRelease = function(self, x, y, button)
        self.ui:mouserelease(x, y, button)
    end, 

    handleKeyboard = function(self, dt, key, scancode, isrepeat)
        --To test local keyboard.
        if key == 'w' then 
            love.event.quit(1)
            print('[DEBUG]: Quit from mainMenu')
        end
    end,

    drawDebug = function() 
        util.worldDebugDraw(20, 20)
        love.graphics.setColor(Colors.RED)
        love.graphics.print('Main Menu', 100, 100)
    end,

}

return mainmenu