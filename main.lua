local game = require("game")
local menu = require("menus")
-- love.window.setFullscreen(true)
love.window.setMode(0,0)

function love.load()
    game.load()
end

function love.draw()
    if menu.start_menu() then
        game.draw()
    end
end

function love.update(dt)
    if menu.start_menu() then
        game.update(dt)
    end
end
