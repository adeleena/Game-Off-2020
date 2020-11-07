local mainmenu = {
    --Todo: @boctavian96 update this
    ui = require 'lib.gspot',
    title = {},

    init = function(self)
        --Simple ui text...

        local unit_size = self.ui.style.unit
        local center = unit_size * 20

        --Simple ui buttons
        local startButton = self.ui:button('Start', {x = center, y = 15 * unit_size, w = 128, h = unit_size})
        startButton.click = function()
            --Debug
            print('[DEBUG]: I\'m clicking start')
        end

        local aboutButton = self.ui:button('About', {x = center, y = 17 * unit_size, w = 128, h = unit_size})
        aboutButton.click = function()
            --Debug
            print('[DEBUG]: I\'m clicking about')
        end

        local exitButton = self.ui:button('Exit', {x = center, y = 19 * unit_size, w = 128, h = unit_size})
        exitButton.click = function()
            --Debug
            print('[DEBUG]: I\'m clicking exit')
            love.event.quit(1)
        end

        table.insert(self.title, 'Main Menu')
        table.insert(self.title, center)
        table.insert(self.title, unit_size)

    end,

    update = function(self, dt)
        self.ui:update(dt)
    end,

    draw = function(self)
        love.graphics.print(self.title[1], self.title[2], self.title[3])

        self.ui:draw()

        if(DEBUG_MODE) then 
            self:drawDebug()
        end
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

    drawDebug = function(self) 
        UTIL.worldDebugDraw(self.ui.style.unit, self.ui.style.unit)
    end,

}

return mainmenu