local class = require 'lib.middleclass'

--Creating the class
local AbstractScene = class('AbstractScene')

--Some member variables.
AbstractScene.ui = require 'lib.gspot'


--The functions

function AbstractScene:dispose()
    for k, v in ipairs(self.ui) do 
        v:hide()
    end
end

function AbstractScene:mousePress(x, y, button)
    self.ui:mousepress(x, y, button)
end

function AbstractScene:mouseRelease(x, y, button)
    self.ui:mouserelease(x, y, button)
end

return AbstractScene