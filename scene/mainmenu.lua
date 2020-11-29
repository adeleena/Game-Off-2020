--Get the dependencies.
local class = require 'lib.middleclass'
local AbstractScene = require 'scene.abstract_scene'

local mainmenu = class('Mainmenu', AbstractScene)

mainmenu.title = {}

function mainmenu:init()

    local center = ALIGNMENT.centerX()

    local update_function = function(this, dt)
        this.pos.x = ALIGNMENT.centerX(this.offsetX)
        this.pos.y = ALIGNMENT.centerY(this.offsetY)
    end

    --Simple ui buttons
    local startButton = self.ui:button('Start', {x = center, y = 15 * WORLD_UNIT, w = 128, h = WORLD_UNIT})
    startButton.update = update_function
    startButton.offsetX = 0
    startButton.offsetY = 0
    startButton.click = function()
        print('[INFO]: I\'m clicking start')
    end

    local optionsButton = self.ui:button('Settings', {x = center, y = 17 * WORLD_UNIT, w = 128, h = WORLD_UNIT})
    optionsButton.update = update_function
    optionsButton.offsetX = 0
    optionsButton.offsetY = 2
    optionsButton.click = function()
        print('[INFO]: I\'m clicking settings')
    end

    local aboutButton = self.ui:button('About', {x = center, y = 19 * WORLD_UNIT, w = 128, h = WORLD_UNIT})
    aboutButton.update = update_function
    aboutButton.offsetX = 0
    aboutButton.offsetY = 4
    aboutButton.click = function()
        print('[INFO]: I\'m clicking about')
        self:dispose()
        about = require 'scene.about'
        about:init()
        STATE:switchTo(about)
    end

    local exitButton = self.ui:button('Exit', {x = center, y = 21 * WORLD_UNIT, w = 128, h = WORLD_UNIT})
    exitButton.update = update_function
    exitButton.offsetX = 0
    exitButton.offsetY = 6
    exitButton.click = function()
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
    table.insert(self.title, WORLD_UNIT)

end

function mainmenu:update(dt)
    self.ui:update(dt)
end

function mainmenu:draw()
    love.graphics.print(self.title[1], self.title[2], self.title[3])

    self.ui:draw()
end

return mainmenu