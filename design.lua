local design = {}

function design.menu()
    local background_menu = love.graphics.newImage('textures/background_blur.jpg')
    love.graphics.draw(background_menu, 0, 0, 0, width / background_menu:getWidth(), height / background_menu:getHeight())
    
end

function design.game()
    local background_game = love.graphics.newImage('textures/tentative.jpg')
    love.graphics.draw(background_game, 0, 0, 0, width / background_game:getWidth(), height / background_game:getHeight())
end

return design