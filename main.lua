sugar_glider = {}
walls = {}
distance_between_walls = 100
number_of_walls = 15
wall_base_speed = 200

function love.load()
    sugar_glider.x = love.graphics.getWidth() / 4
    sugar_glider.y = love.graphics.getHeight() / 2
    sugar_glider.img = love.graphics.newImage('img/frog.png')
    sugar_glider.speed = 200

    for i=0, number_of_walls - 1 do
        wall = {}
        wall.x = love.graphics.getWidth() + i * distance_between_walls
        wall.y = 0
        wall.speed = wall_base_speed
        wall.img = love.graphics.newImage('img/test.jpg')
        walls[i] = wall
    end

end


function love.draw()
    love.graphics.draw(sugar_glider.img, sugar_glider.x, sugar_glider.y)
    for i=0, number_of_walls - 1 do
        love.graphics.draw(walls[i].img, walls[i].x, walls[i].y, 0, 0.1, 0.5)
    end
end

function love.update(dt)
    if love.keyboard.isDown('d') then
        if sugar_glider.x < (love.graphics.getWidth() - sugar_glider.img:getWidth()) then
            sugar_glider.x = sugar_glider.x + sugar_glider.speed * dt
        end
    end
    if love.keyboard.isDown('q') then
        if sugar_glider.x > 0 then
            sugar_glider.x = sugar_glider.x - sugar_glider.speed * dt
        end
    end

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
            wall.img = love.graphics.newImage('img/test.jpg')
            walls[number_of_walls - 1] = wall
        end
    end
end