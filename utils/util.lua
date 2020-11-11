local util={

    isColliding = function(obj1, obj2)
        --TODO
        return false
    end,

    isHovered = function(obj)
        local mouse_x, mouse_y = love.mouse.getPosition()
        return mouse_x > obj.x and mouse_x < obj.x + obj.width and mouse_y > obj.y and mouse_y < obj.y + obj.height
    end,

    isSquareHovered = function(sq_x, sq_y, w)
        local mouse_x, mouse_y = love.mouse.getPosition()
        return mouse_x > sq_x and mouse_x < sq_x + w and mouse_y > sq_y and mouse_y < sq_y + w
    end,

    worldDebugDraw = function(self, worldUnitX, worldUnitY)

        for i=0, WORLD_WIDTH, worldUnitX do 
            for j=0, WORLD_HEIGHT, worldUnitY do
                if(self.isSquareHovered(i, j, worldUnitX)) then
                    love.graphics.setColor(COLORS.YELLOW)
                    love.graphics.print('Square(x, y): ' .. i .. ', ' .. j, 0, 300)
                else
                    love.graphics.setColor(COLORS.WHITE)
                end
                love.graphics.rectangle('line', i, j, worldUnitX, worldUnitY)
            end
        end
    end
}

return util