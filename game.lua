local game = {}
local sugar_glider = require("sugar_glider")
local wall = require("wall")
local walls = {}
local distance_between_walls = 750
local number_of_walls = 8
local walls_vertical_speed = 100
local walls_opening_height = {}

wall_x_scale_factor = 2

function game.load()
    sugar_glider.load()

    for i=0, number_of_walls - 1 do
        -- walls[i] = wall:create(love.graphics.getWidth() + i * distance_between_walls)
        walls[i] = wall:create(love.graphics.getWidth() + i * distance_between_walls)
        math.randomseed(os.time()-i)
        walls_opening_height[i] = math.random(0, love.graphics.getHeight() - texture_opening:getHeight())
    end

end

function game.draw()
    sugar_glider.draw()
    for i=0, number_of_walls - 1 do
        wall:draw(walls[i], walls_opening_height[i])
    end
end

function game.update(dt)
    sugar_glider.move(dt)

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
        love.event.quit()
    end
end

return game