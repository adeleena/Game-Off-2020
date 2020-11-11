--[[
    Please note that this utility depends on WORLD_WIDTH, WORLD_HEIGHT and WORLD_UNIT.
]]

local alignment = {

    offsetAlign = function(offsetX, offsetY)
        local offsetX = offsetX or 0
        local offsetY = offsetY or 0

        return offsetX * WORLD_UNIT, offsetY * WORLD_UNIT
    end,
    
    centerX = function(offset)
        local offset = offset or 0
        return love.graphics.getWidth()/2 + offset * WORLD_UNIT
    end,

    centerY = function(offset)
        local offset = offset or 0
        return love.graphics.getHeight()/2 + offset * WORLD_UNIT
    end,

    -- Only for Y Axis
    top = function(offset)
        local offset = offset or 0
        return love.graphics.getHeight() - offset * WORLD_UNIT
    end,

    -- Only for Y Axis
    bottom = function(offset)
        local offset = offset or 0
        return 0 + offset * WORLD_UNIT
    end,

    -- Only for X Axis
    left = function(offset)
        local offset = offset or 0
        return 0 + offset * WORLD_UNIT
    end,

    -- Only for X Axis
    right = function(offset)
        local offset = offset or 0
        return love.graphics.getWidth() - offset * WORLD_UNIT
    end,

}

return alignment