local GameState = {
    states={},
    state=1,

    update = function(self, dt) 
        self.states[self.state]:update(dt)
        --self:keyboard(dt)
        self:mouse()
    end,

    draw = function(self)
        self.states[self.state]:draw()
    end,

    keyboard = function(self, dt, key, scancode, isrepeat)
        self.states[self.state]:handleKeyboard(dt, key, scancode, isrepeat)
    end,

    mouse = function(self, x, y, button)
        self.states[self.state]:mousePress(x, y, button)
        self.states[self.state]:mouseRelease(x, y, button)
    end,

    addState = function(self, new_state)
        table.insert(self.states, new_state)
    end,

    switchTo = function(self, state_id)
        self.state = state_id
    end
}

return GameState