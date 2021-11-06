local wall = {}
local base_speed = 700
local texture_wall = love.graphics.newImage('textures/Mur_test.png')
local texture_foreground = love.graphics.newImage('textures/Arche_1erplan_test.png')
local top = {}
local opening = {}
local foreground = {}
local bottom = {}

texture_opening = love.graphics.newImage('textures/Arche_test.png')

function wall:create(x)
    local new_wall = {}
    new_wall.x = x
    new_wall.speed = base_speed

    top.img = texture_wall
    top.y = 0

    opening.img = texture_opening
    -- math.randomseed(os.time())
    -- opening.y = math.random(0, love.graphics.getHeight() - opening.img:getHeight() / 2)
    
    foreground.img = texture_foreground

    bottom.img = texture_wall
    -- bottom.y = opening.y + opening.img:getHeight()

    new_wall.top = top
    new_wall.opening = opening
    new_wall.foreground = foreground
    new_wall.bottom = bottom

    return new_wall
end

function wall:draw(wall_to_draw, y_opening)
    local y_scale_factor = y_opening / wall_to_draw.top.img:getHeight() + 0.1
    love.graphics.draw(wall_to_draw.top.img, wall_to_draw.x, wall_to_draw.top.y, 0, wall_x_scale_factor, y_scale_factor)
    love.graphics.draw(wall_to_draw.opening.img, wall_to_draw.x, y_opening - wall_to_draw.opening.img:getHeight() / 2, 0, wall_x_scale_factor)
    love.graphics.draw(wall_to_draw.bottom.img, wall_to_draw.x, y_opening + opening.img:getHeight(), 0, wall_x_scale_factor, 10)
end

function wall:draw_foreground(wall_to_draw, y_opening)
    love.graphics.draw(wall_to_draw.foreground.img, wall_to_draw.x, y_opening - wall_to_draw.foreground.img:getHeight() / 2, 0, wall_x_scale_factor)
end

function wall:update(dt)

end

return wall