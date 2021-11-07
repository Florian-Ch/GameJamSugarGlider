local sugar_glider = {}
local speed = 500
local texture = love.graphics.newImage('textures/Sugar_Glider_Normal.png')
local texture_up = love.graphics.newImage('textures/Sugar_Glider_Up.png')
local texture_down = love.graphics.newImage('textures/Sugar_Glider_Down.png')
sugar_glider_texture_scale = 2

function sugar_glider.load()
    sugar_glider.img = texture
    sugar_glider.x = love.graphics.getWidth() / 4
    sugar_glider.y = (love.graphics.getHeight() / 2) - (sugar_glider.img:getHeight() / 2)
    sugar_glider.speed = speed
end

function sugar_glider.draw()
    love.graphics.draw(sugar_glider.img, sugar_glider.x, sugar_glider.y, 0, sugar_glider_texture_scale, sugar_glider_texture_scale)
end

function sugar_glider.move(dt)
    sugar_glider.img = texture
    if love.keyboard.isDown('d') or love.keyboard.isDown('right') then
        if sugar_glider.x < (love.graphics.getWidth() - sugar_glider.img:getWidth() * sugar_glider_texture_scale) then
            sugar_glider.x = sugar_glider.x + sugar_glider.speed * dt
        end
    end
    if love.keyboard.isDown('q') or love.keyboard.isDown('left') then
        if sugar_glider.x > 0 then
            sugar_glider.x = sugar_glider.x - sugar_glider.speed * dt
        end
    end

    if love.keyboard.isDown('z') or love.keyboard.isDown('up') then
        if sugar_glider.y > 0 then
            sugar_glider.y = sugar_glider.y - sugar_glider.speed * dt
            sugar_glider.img = texture_up
        end
    end
    if love.keyboard.isDown('s') or love.keyboard.isDown('down') then
        if sugar_glider.y < (love.graphics.getHeight() - sugar_glider.img:getHeight() * sugar_glider_texture_scale) then
            sugar_glider.y = sugar_glider.y + sugar_glider.speed * dt
            sugar_glider.img = texture_down
        end
    end
end



return sugar_glider