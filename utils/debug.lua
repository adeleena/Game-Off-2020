debug = {
    screenWidth = 0,
    screenHeight = 0,
    unitSize = 0,
    widthUnits = 0,
    heightUnits = 0,
    fps = 0,
    mx = 0,
    my = 0,
    showGrid,
    oldGDown,

    init = function(self)
        self.screenWidth = love.graphics.getWidth()
        self.screenHeight = love.graphics.getHeight()
        self.unitSize = 16
        self.widthUnits = self.screenWidth / self.unitSize
        self.heightUnits = self.screenHeight / self.unitSize
        self.fps = 0
        self.showGrid = false
        self.oldGDown = false
    end,

    update = function(self, dt)
        if(DEBUG_MODE) then
            self.fps = 1 / dt

            self.mx, self.my = love.mouse.getPosition()

            if (love.keyboard.isDown('g') and not self.oldGDown) then 
                self.showGrid = not self.showGrid

                if(self.showGrid) then
                    print('[INFO]: Showing the grid')
                else
                    print('[INFO]: Hidding the grid')
                end

            end

            self.oldGDown = love.keyboard.isDown('g')
        end
    end,

    draw = function(self)
        if(DEBUG_MODE) then 

            love.graphics.setFont(love.graphics.newFont(15))
            if(self.showGrid) then
                UTIL:worldDebugDraw(self.unitSize, self.unitSize)
            end

            r, g, b, a = love.graphics.getColor()
            love.graphics.setColor(COLORS.RED)
            love.graphics.print('ScreenWidth: ' .. self.screenWidth, 0, 0)
            love.graphics.print('ScreenHeight: ' .. self.screenHeight, 0, self.unitSize)
            love.graphics.print('WorldUnit: ' .. self.unitSize, 0, 2 * self.unitSize)
            love.graphics.print('Units(W): ' .. self.widthUnits, 0, 3 * self.unitSize)
            love.graphics.print('Units(H): ' .. self.heightUnits, 0, 4 * self.unitSize)
            love.graphics.print('FPS: ' .. self.fps, 0, 5 * self.unitSize)
            love.graphics.print('Mouse(x, y): ' .. self.mx .. ', ' .. self.my , 0, 6 * self.unitSize)
            love.graphics.setColor(r, g, b, a)

            love.graphics.setFont(love.graphics.newFont(12))
        end
    end,
}

return debug