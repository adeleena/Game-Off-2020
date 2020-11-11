--Dependency for class
local class = require 'lib.middleclass'

--Creating the class
local AbstractScene = class('AbstractScene')

--Some member variables.
AbstractScene.ui = require 'lib.gspot'

--The functions
----Hide the UI for the scene. To be used before SCENE.switchTo(...)
function AbstractScene:dispose()
    for k, v in ipairs(self.ui) do 
        v:hide()
    end
end

function AbstractScene:show()
    for k, v in ipairs(self.ui) do 
        v:show()
    end
end

function AbstractScene:mousePress(x, y, button)
    self.ui:mousepress(x, y, button)
end

function AbstractScene:mouseRelease(x, y, button)
    self.ui:mouserelease(x, y, button)
end

return AbstractScene