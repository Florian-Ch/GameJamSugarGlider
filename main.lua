sugar_glider = {}

function love.load()
    sugar_glider.x = love.graphics.getWidth() / 4
    sugar_glider.y = love.graphics.getHeight() / 2
    sugar_glider.img = love.graphics.newImage('img/frog.png')
    sugar_glider.speed = 200
end


function love.draw()
    love.graphics.draw(sugar_glider.img, sugar_glider.x, sugar_glider.y)
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
end