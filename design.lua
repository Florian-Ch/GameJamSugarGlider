local design = {}
local primary = {} -- violet
local secondary = {} -- gris
local accent = {} -- orange
local dark = {} -- noir
local light = {}


-- Def Primary color
primary[0] = 180 / 255
primary[1] = 152 / 255
primary[2] = 192 / 255
primary[3] = 1
-- Def Secondary color
secondary[0] = 149 / 255
secondary[1] = 149 / 255
secondary[2] = 149 / 255
secondary[3] = 1
-- Def Accent color
accent[0] = 230 / 255
accent[1] = 143 / 255
accent[2] = 28 / 255
accent[3] = 1
-- Def Dark color
dark[0] = 25 /255
dark[1] = 24 /255
dark[2] = 22 /255
dark[3] = 0.8
-- Def Light color
light[0] = 1
light[1] = 1
light[2] = 1
light[3] = 1

function design.menu()
    choose_bck_color = primary
    background_menu = love.graphics.setBackgroundColor( choose_bck_color[0], choose_bck_color[1], choose_bck_color[2], choose_bck_color[3] )
end

function design.game()
    choose_color = primary
    background_game = love.graphics.newImage('textures/background_blur.jpg')
    for i = 0, love.graphics.getWidth() / background_game:getWidth() do
        for j = 0, love.graphics.getHeight() / background_game:getHeight() do
            love.graphics.draw(background_game, i * background_game:getWidth(), j * background_game:getHeight() )
        end
    end
end

return design