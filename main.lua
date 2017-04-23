require 'player'

timer = 60

function love.load()
   player = Player:new()
end

function love.draw()
    -- sets the background color to black
    love.graphics.setBackgroundColor(0, 0, 0)

    -- sets the drawing color to green
    love.graphics.setColor(50, 205, 50)

    -- draws the player
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
    
    -- draws the walls
    love.graphics.rectangle("fill", 0, 0, Space.window.width, 30)  -- top
    love.graphics.rectangle("fill", 0, 0, 30, Space.window.height) -- left
    love.graphics.rectangle("fill", Space.window.width - 30, 30, 30, Space.window.height) -- right
    love.graphics.rectangle("fill", 30, Space.window.height - 30, Space.window.width, 30) -- bottom

    -- draws the timer
    love.graphics.print(math.floor(timer), 100, 100);
end

function love.update(dt)
    timer = timer - 0.015

    if love.keyboard.isDown("up") then
        if not player:reachedTopBorder() then
            player.y = player.y - player.speed
        end
    end

    if love.keyboard.isDown("down") then
        if not player:reachedBottomBorder() then
            player.y = player.y + player.speed
        end
    end

    if love.keyboard.isDown("left") then
        if not player:reachedLeftBorder() then
            player.x = player.x - player.speed
        end
    end

    if love.keyboard.isDown("right") then
        if not player:reachedRightBorder() then
            player.x = player.x + player.speed
        end
    end
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function love.keyreleased(key)
    if key == "space" then
        player.speed = 2
    end
end