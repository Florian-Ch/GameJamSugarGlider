local game = {}
local sugar_glider = require("sugar_glider")
local walls = {}
local distance_between_walls = 500
local number_of_walls = 15
local wall_base_speed = 200

function game.load()
    sugar_glider.load()

    for i=0, number_of_walls - 1 do
        wall = {}
        wall.img = love.graphics.newImage('textures/Arche_test.png')
        wall.x = love.graphics.getWidth() + i * distance_between_walls
        wall.y = (love.graphics.getHeight() / 2) - (wall.img:getHeight() / 2)
        wall.speed = wall_base_speed
        walls[i] = wall
    end

end

function game.draw()
    sugar_glider.draw()
    for i=0, number_of_walls - 1 do
        love.graphics.draw(walls[i].img, walls[i].x, walls[i].y, 0, 2, 2)
    end
end

function game.update(dt)
    sugar_glider.move(dt)

    for i=0, number_of_walls - 1 do
        walls[i].x = walls[i].x - walls[i].speed * dt
        if walls[i].x < 0 - walls[i].img:getWidth() then
            for j=i+1, number_of_walls - 1 do
                walls[j-1] = walls[j]
            end

            wall = {}
            wall.x = walls[number_of_walls - 2].x + distance_between_walls
            wall.y = 0
            wall.speed = wall_base_speed
            wall.img = love.graphics.newImage('textures/Arche_test.png')
            walls[number_of_walls - 1] = wall
        end
    end
end

return game