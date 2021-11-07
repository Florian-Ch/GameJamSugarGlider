local menus = {}
local suit = require 'libraries.suit'
width, height = love.window.getDesktopDimensions()
love.window.setMode(0,0)
local font = love.graphics.newFont("fonts/upheavtt.ttf", 20)
local name_font = love.graphics.newFont("fonts/QuantumProfit.ttf", 60)
local title_font = love.graphics.newFont("fonts/upheavtt.ttf", 60)
local phrase_font = love.graphics.newFont("fonts/upheavtt.ttf", 40)
love.graphics.setFont(font)

local design = require("design")

function menus.start_menu()
  design.menu()
  local font = love.graphics.newFont("fonts/QuantumProfit.ttf", 20)
  love.graphics.setFont(font)

  -- put the layout origin at position (100,100)
  -- the layout will grow down and to the right from this point
  suit.layout:reset(width/2-200, height/2-90)
  suit.layout:padding(10,10)

  -- put a label that displays the text below the first cell
  -- the cell size is the same as the last one (200x30 px)
  -- the label text will be aligned to the left
  suit.Label("Welcome to", {align = "center", font = title_font}, suit.layout:row(400,30))

  -- put an empty cell that has the same size as the last cell (200x30 px)
  suit.layout:row()

  suit.Label("Sugar Glider", {align = "center", font = name_font}, suit.layout:row(400,30))

  -- put an empty cell that has the same size as the last cell (200x30 px)
  suit.layout:row()
  suit.layout:row(100,30)
  if suit.Button("Start Game", suit.layout:col(200,30)).hit then
      state = "game"
  end

  -- put an empty cell that has the same size as the last cell (200x30 px)
  -- suit.layout:row()
  -- put a button of size 200x30 px in the cell below
  -- if the button is pressed, quit the game
  if suit.Button("Quit Game", suit.layout:row()).hit then
      love.event.quit()
  end

  suit.draw()

end

function menus.end_menu(score)
    design.menu()
  -- love.window.setFullscreen(true)
  -- love.window.setMode(1920,1200)

  -- j'sais pas pourquoi ça crée des crises d'épilepsie, j'voulais juste mettre en plein écran
  -- love.window.setMode(0,0)

  -- put the layout origin at position (100,100)
  -- the layout will grow down and to the right from this point
  suit.layout:reset(width/2-400, height/2-90)
  suit.layout:padding(10,10)

  -- put a label that displays the text below the first cell
  -- the cell size is the same as the last one (200x30 px)
  -- the label text will be aligned to the left
  suit.Label("WOW !", {align = "center", font = title_font}, suit.layout:row(800,30))
  suit.Label("You made it this far !", {align = "center", font = phrase_font}, suit.layout:row(800,30))

  -- put an empty cell that has the same size as the last cell (200x30 px)
  suit.layout:row()

  suit.Label(score, {align = "center", font = name_font}, suit.layout:row(800,30))

  -- put an empty cell that has the same size as the last cell (200x30 px)
  suit.layout:row()
  suit.layout:row(300,30)
  if suit.Button("Try Again", suit.layout:col(200,30)).hit then
      state = "game"
  end

  -- put a button of size 200x30 px in the cell below
  -- if the button is pressed, quit the game
  if suit.Button("Quit Game", suit.layout:row()).hit then
      love.event.quit()
  end

  suit.draw()

end

function menus.pause_menu(score)
    design.menu()
  -- put the layout origin at position (100,100)
  -- the layout will grow down and to the right from this point
  suit.layout:reset(width/2-400, height/2-90)
  suit.layout:padding(10,10)

  -- put a label that displays the text below the first cell
  -- the cell size is the same as the last one (200x30 px)
  -- the label text will be aligned to the left
  suit.Label("Keep going ! ", {align = "center", font = title_font}, suit.layout:row(800,30))
  suit.Label("You made it this far already !", {align = "center", font = phrase_font}, suit.layout:row(800,30))


  -- put an empty cell that has the same size as the last cell (200x30 px)
  suit.layout:row()

  suit.Label(score, {align = "center", font = name_font}, suit.layout:row(800,30))

  -- put an empty cell that has the same size as the last cell (200x30 px)
  suit.layout:row()
  suit.layout:row(300,30)
  if suit.Button("Resume", suit.layout:col(200,30)).hit then
      state = "game"
  end


  suit.Label(score, {align = "center", font = name_font}, suit.layout:row(800,30))

  -- put an empty cell that has the same size as the last cell (200x30 px)
  suit.layout:row()
  suit.layout:row(300,30)
  if suit.Button("Resume", suit.layout:col(200,30)).hit then
      state = "game"
  end


  -- put a button of size 200x30 px in the cell below
  -- if the button is pressed, quit the game
  if suit.Button("Quit Game", suit.layout:row()).hit then
      love.event.quit()
  end

  suit.draw()

end

return menus
