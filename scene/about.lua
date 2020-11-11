--Get the dependencies.
local class = require 'lib.middleclass'
local AbstractScene = require 'scene.abstract_scene'

--Inherit from AbstractScene
local about = class('About', AbstractScene)

about.title = {}

function about:init()

        local unit_size = self.ui.style.unit
        local center = unit_size * 20

        local backButton = self.ui:button('Back', {x = 100, y = 100, w = 128, h = unit_size})
        backButton.click = function()
            local mainmenu = require 'scene.mainmenu'
            mainmenu:init()
            STATE:switchTo(mainmenu)
        end

        table.insert(self.ui_elements, backButton)


        table.insert(self.title, 'About')
        table.insert(self.title, center)
        table.insert(self.title, unit_size)

end

function about:update(dt)
    self.ui:update(dt)
end

function about:draw()
    self.ui:draw()
    love.graphics.print(self.title[1], self.title[2], self.title[3])
end

return about