local GameState = {
    state,

    update = function(self, dt) 
        self.state:update(dt)
        self:mouseP()
        self:mouseR()
        self:mouseW()
    end,

    draw = function(self)
        self.state:draw()
    end,

    keyboard = function(self, dt, key, scancode, isrepeat)
        self.state:handleKeyboard(dt, key, scancode, isrepeat)
    end,

    mouseP = function(self, x, y, button)
        self.state:mousePress(x, y, button)
    end,

    mouseR = function(self, x, y, button)
        self.state:mouseRelease(x, y, button)
    end,

    mouseW = function(self, x, y)
        --TODO: Check if this feature in needed...
    end,

    switchTo = function(self, new_state)
        --Dispose the old state.
        self.state:dispose()

        --Set the new state.
        self.state = new_state
    end,

}

return GameState