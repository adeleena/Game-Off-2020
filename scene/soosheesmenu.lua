local soosheesmenu = {
    --Todo: @boctavian96 update this
    ui = require 'lib.gspot',
    title = {},
    center_h = love.graphics.getHeight() / 2,
    center_w = love.graphics.getWidth() / 2,
    unit_size = 32,

    init = function(self)
        --Simple ui text...

        self.unit_size = self.ui.style.unit

        local update_function = function(this, dt)
            this.pos.x = self.center_w - self.unit_size / 2
            this.pos.y = self.center_h + this.offset * self.unit_size * 2
        end

        local welcomeText = self.ui:text('Main Menu', {x = self.center_w, y = self.center_h, w = 128, h = self.unit_size})
        welcomeText.update = update_function
        welcomeText.offset = 0

        local exitButton = self.ui:button('Exit', {x = center_w, y = 21 * self.unit_size, w = 128, h = self.unit_size})
        exitButton.click = function()
            --Debug
            print('[DEBUG]: I\'m clicking exit')
            love.event.quit(1)
        end

        exitButton.update = update_function
        exitButton.offset = 4

    end,

    update = function(self, dt)
        self.ui:update(dt)
        self.center_h = love.graphics.getHeight() / 2
        self.center_w = love.graphics.getWidth() / 2
    end,

    draw = function(self)
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

return soosheesmenu