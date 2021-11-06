local sugar_glider = {}
local speed = 200
local texture = love.graphics.newImage('textures/Sugardaddy_test.png')

function sugar_glider.load()
    sugar_glider.img = texture
    sugar_glider.x = love.graphics.getWidth() / 4
    sugar_glider.y = (love.graphics.getHeight() / 2) - (sugar_glider.img:getHeight() / 2)
    sugar_glider.speed = speed
end

function sugar_glider.draw()
    love.graphics.draw(sugar_glider.img, sugar_glider.x, sugar_glider.y, 0, 5, 5)
end

function sugar_glider.move(dt)
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

return sugar_glider