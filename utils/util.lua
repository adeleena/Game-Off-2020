local util={

    isColliding = function(obj1, obj2)
        --TODO
        return false
    end,

    isHovered = function(obj)
        local mouse_x, mouse_y = love.mouse.getPosition()
        return mouse_x > obj.x and mouse_x < obj.x + obj.width and mouse_y > obj.y and mouse_y < obj.y + obj.height
    end,
}

return util