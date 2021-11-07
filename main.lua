local game = require("game")
local menu = require("menus")
-- love.window.setFullscreen(true)
love.window.setMode(0,0)
state = "start"

function love.load()
  game.load()
end

function love.draw()
    if state == "start" then
      menu.start_menu()
    elseif state == "game" then
      game.draw()
    elseif state == "pause" then
      menu.pause_menu(score)
    elseif state == "end" then
      menu.end_menu(final_score)
      game.load()
    end
end

function love.update(dt)
  if state == "game" then
      game.update(dt)
  end
end
