local mainmenu = {
    --Todo: @boctavian96 update this
    ui = {}

    update = function(self, dt)

    end,

    draw = function(self)
        util.worldDebugDraw(20, 20)
        love.graphics.setColor(Colors.RED)
        love.graphics.print('Main Menu', 100, 100)
    end

}

return mainmenu