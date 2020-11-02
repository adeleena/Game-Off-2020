local util={

    isColliding = function(obj1, obj2)
        --TODO
        return false
    end,

    isHovered = function(obj)
        local mouse_x, mouse_y = love.mouse.getPosition()
        return mouse_x > obj.x and mouse_x < obj.x + obj.width and mouse_y > obj.y and mouse_y < obj.y + obj.height
    end,

    worldDebugDraw = function(worldUnitX, worldUnitY)
        screenWidth = love.graphics.getWidth()
        screenHeight = love.graphics.getHeight()

        for i=0, screenWidth, worldUnitX do 
            for j=0, screenHeight, worldUnitY do
                love.graphics.setColor({1, 1, 1, 1})
                love.graphics.rectangle('line', i, j, worldUnitX, worldUnitY)
            end
        end
    end
}

return util