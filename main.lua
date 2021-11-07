local game = require("game")
local menu = require("menus")
love.window.setMode(0,0)
volume = 0.7
local start_source = love.audio.newSource("music/ambuscade.mp3", "stream")
local game_source = love.audio.newSource("music/up_your_street.mp3", "stream")
end_source = love.audio.newSource("music/game_over.wav", "stream")
state = "start"

function love.load()
  game.load()
end

function love.draw()
    if state == "start" then
      love.audio.play(start_source)
      menu.start_menu()
    elseif state == "game" then
      once = true
      love.audio.stop(start_source)
      love.audio.stop(end_source)
      love.audio.play(game_source)
      game.draw()
    elseif state == "pause" then
      menu.pause_menu(score)
    elseif state == "end" then
      if once then
        love.audio.stop(game_source)
        love.audio.play(end_source)
        once = false
      end
      menu.end_menu(final_score)
      game.load()
    end
end

function love.update(dt)
  love.audio.setVolume(volume)
  if state == "game" then
      game.update(dt)
  end
end
