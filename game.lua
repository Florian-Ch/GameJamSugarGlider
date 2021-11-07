local game = {}
local sugar_glider = require("sugar_glider")
local wall = require("wall")
local suit = require "libraries.suit"
local text_font = love.graphics.newFont("fonts/upheavtt.ttf", 20)
local score_font = love.graphics.newFont("fonts/QuantumProfit.ttf", 20)
local walls = {}
local distance_between_walls = 750
local number_of_walls = 8
local walls_vertical_speed = 100
local walls_opening_height = {}
score = 0
local design = require("design")

wall_x_scale_factor = 2

function game.load()
    sugar_glider.load()
    score = 0
    for i=0, number_of_walls - 1 do
        -- walls[i] = wall:create(love.graphics.getWidth() + i * distance_between_walls)
        walls[i] = wall:create(love.graphics.getWidth() + i * distance_between_walls)
        math.randomseed(os.time()-i)
        walls_opening_height[i] = math.random(0, love.graphics.getHeight() - texture_opening:getHeight())
    end

end

function game.draw()
    design.game()
    for i=0, number_of_walls - 1 do
        wall:draw(walls[i], walls_opening_height[i])
    end
    sugar_glider.draw()
    for i=0, number_of_walls - 1 do
        wall:draw_foreground(walls[i], walls_opening_height[i])
    end
    suit.layout:reset(10,10)
    suit.layout:padding(10,10)
    suit.Label("Score :", {font = text_font}, suit.layout:row(100,30))
    suit.Label(score, {font = score_font}, suit.layout:col(100,30))
    suit.draw()
end

function game.update(dt)
    sugar_glider.move(dt)
    score = score + 1
    for i=0, number_of_walls - 1 do
        walls[i].x = walls[i].x - walls[i].speed * dt
        if walls[i].x < 0 - (walls[i].top.img:getWidth() * wall_x_scale_factor) then
            for j=i+1, number_of_walls - 1 do
                walls[j-1] = walls[j]
                walls_opening_height[j-1] = walls_opening_height[j]
            end
            math.randomseed(os.time())
            local new_wall = wall:create(walls[number_of_walls - 2].x + math.random(500, 750))
            walls[number_of_walls - 1] = new_wall
            walls_opening_height[number_of_walls - 1] = math.random(0, love.graphics.getHeight() - texture_opening:getHeight() / 2)
        end

        -- collisions
        if (sugar_glider.x < walls[i].x + texture_opening:getWidth() / 2) and (walls[i].x + texture_opening:getWidth() / 2 < sugar_glider.x + sugar_glider.img:getWidth() * 5) then
            if sugar_glider.y < walls_opening_height[i] or sugar_glider.y > walls_opening_height[i] + texture_opening:getHeight() then
                final_score = score
                state = "end"
            end
        end
    end

    -- if love.keyboard.isDown('z') or love.keyboard.isDown('up') then
    --     for i=0, number_of_walls - 1 do
    --         walls[i].top.y = walls[i].top.y - walls_vertical_speed * dt
    --         walls_opening_height[i] = walls_opening_height[i] - walls_vertical_speed * dt
    --     end
    -- end
    -- if love.keyboard.isDown('s') or love.keyboard.isDown('down') then
    --     for i=0, number_of_walls - 1 do
    --         walls[i].top.y = walls[i].top.y + walls_vertical_speed * dt
    --         walls_opening_height[i] = walls_opening_height[i] + walls_vertical_speed * dt
    --     end
    -- end

    if love.keyboard.isDown('escape') then
        state = "pause"
    end
end

return game
