local menus = {}
local suit = require 'libraries.suit'
center_x = love.graphics.getWidth() / 2
center_y = love.graphics.getHeight() / 2
love.window.setMode(0,0)

function menus.start_menu()
  local font = love.graphics.newFont("fonts/QuantumProfit.ttf", 20)
  love.graphics.setFont(font)
  -- love.window.setFullscreen(true)
  -- love.window.setMode(1920,1200)

  -- j'sais pas pourquoi ça crée des crises d'épilepsie, j'voulais juste mettre en plein écran
  -- love.window.setMode(0,0)

  -- put the layout origin at position (100,100)
  -- the layout will grow down and to the right from this point
  suit.layout:reset(center_x, center_y)

  -- put a label that displays the text below the first cell
  -- the cell size is the same as the last one (200x30 px)
  -- the label text will be aligned to the left
  suit.Label("Welcome, to Sugar Glider ! ", {align = "center"}, suit.layout:row(200,30))

  -- put an empty cell that has the same size as the last cell (200x30 px)
  suit.layout:row()

  if suit.Button("Start Game", suit.layout:row()).hit then
      return true
  end

  -- put an empty cell that has the same size as the last cell (200x30 px)
  suit.layout:row()

  -- put a button of size 200x30 px in the cell below
  -- if the button is pressed, quit the game
  if suit.Button("Quit Game", suit.layout:row()).hit then
      love.event.quit()
  end

  suit.draw()

end

return menus
