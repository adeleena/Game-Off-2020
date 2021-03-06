--Get the dependencies.
local class = require 'lib.middleclass'
local AbstractScene = require 'scene.abstract_scene'

local mainmenu = class('Mainmenu', AbstractScene)

mainmenu.title = {}

function mainmenu:init()

    local unit_size = self.ui.style.unit
    local center = unit_size * 20

    --Simple ui buttons
    local startButton = self.ui:button('Start', {x = center, y = 15 * unit_size, w = 128, h = unit_size})
    startButton.click = function()
        --Debug
        print('[INFO]: I\'m clicking start')
    end

    local optionsButton = self.ui:button('Settings', {x = center, y = 17 * unit_size, w = 128, h = unit_size})
    optionsButton.click = function()
        --Debug 
        print('[INFO]: I\'m clicking settings')
    end

    local aboutButton = self.ui:button('About', {x = center, y = 19 * unit_size, w = 128, h = unit_size})
    aboutButton.click = function()
        --Debug
        print('[INFO]: I\'m clicking about')
        self:dispose()
        about = require 'scene.about'
        about:init()
        STATE:switchTo(about)
    end

    local exitButton = self.ui:button('Exit', {x = center, y = 21 * unit_size, w = 128, h = unit_size})
    exitButton.click = function()
        --Debug
        print('[INFO]: I\'m clicking exit')
        love.event.quit(1)
    end

    --Add the ui elements in a table.
    table.insert(self.ui_elements, startButton)
    table.insert(self.ui_elements, optionsButton)
    table.insert(self.ui_elements, aboutButton)
    table.insert(self.ui_elements, exitButton)

    table.insert(self.title, 'Main Menu')
    table.insert(self.title, center)
    table.insert(self.title, unit_size)

end

function mainmenu:update(dt)
    self.ui:update(dt)
end

function mainmenu:draw()
    love.graphics.print(self.title[1], self.title[2], self.title[3])

    self.ui:draw()

    if(DEBUG_MODE) then 
        --self:drawDebug()
    end
end

function mainmenu:drawDebug()
    UTIL.worldDebugDraw(self.ui.style.unit, self.ui.style.unit)
end

return mainmenu