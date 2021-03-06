require 'player'
require 'assets'

function love.load()
   player = Player:new()
   assets = Assets:new()

   timer = 60

   timerFont = assets:newFont("digital-7.ttf", 20)
   backgroundMusic = assets:newAudio("background.mp3")
   point = assets:newAudio("point.wav")

   backgroundMusic:setLooping(true)
   backgroundMusic:play()
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

    -- draws the doors
    love.graphics.setColor(128, 0, 0)
    love.graphics.rectangle("fill", 190, 30, 50, 5) -- top left door 
    love.graphics.rectangle("fill", 375, 30, 50, 5) -- top middle door
    love.graphics.rectangle("fill", 560, 30, 50, 5) -- top right door

    love.graphics.rectangle("fill", 190, Space.window.height - 35, 50, 5) -- bottom left door
    love.graphics.rectangle("fill", 375, Space.window.height - 35, 50, 5) -- bottom middle door
    love.graphics.rectangle("fill", 560, Space.window.height - 35, 50, 5) -- bottom right door

    -- draws the timer
    love.graphics.setFont(timerFont)
    love.graphics.print(math.floor(timer), 100, Space.window.height / 2);

    -- draws the score
    love.graphics.setColor(0, 0, 0)
    love.graphics.print(player.score, 10, 10)
end

function love.update(dt)
    timer = timer - 0.015

    -- this should be refactored and bringed to separate function
    if love.keyboard.isDown("up") then
        if not player:reachedTopBorder() then
            if player:reachedTopLeftDoor() then
                player:returnToStart()
                point:play()
            elseif player:reachedTopMiddleDoor() then
                player:returnToStart()
                point:play()
            elseif player:reachedTopRightDoor() then
                player:returnToStart()
                point:play()
            elseif player:reachedBottomLeftDoor() then
                player:returnToStart()
                point:play()
            elseif player:reachedBottomMiddleDoor() then
                player:returnToStart()
                point:play()
            elseif player:reachedBottomRightDoor() then
                player:returnToStart()
                point:play()
            else
                player.y = player.y - player.speed
            end
        end
    end

    if love.keyboard.isDown("down") then
        if not player:reachedBottomBorder() then
            if player:reachedTopLeftDoor() then
                player:returnToStart()
                point:play()
            elseif player:reachedTopMiddleDoor() then
                player:returnToStart()
                point:play()
            elseif player:reachedTopRightDoor() then
                player:returnToStart()
                point:play()
            elseif player:reachedBottomLeftDoor() then
                player:returnToStart()
                point:play()
            elseif player:reachedBottomMiddleDoor() then
                player:returnToStart()
                point:play()
            elseif player:reachedBottomRightDoor() then
                player:returnToStart()
                point:play()
            else
                player.y = player.y + player.speed
            end
        end
    end

    if love.keyboard.isDown("left") then
        if not player:reachedLeftBorder() then
            if player:reachedTopLeftDoor() then
                player:returnToStart()
                point:play()
            elseif player:reachedTopMiddleDoor() then
                player:returnToStart()
                point:play()
            elseif player:reachedTopRightDoor() then
                player:returnToStart()
                point:play()
            elseif player:reachedBottomLeftDoor() then
                player:returnToStart()
                point:play()
            elseif player:reachedBottomMiddleDoor() then
                player:returnToStart()
                point:play()
            elseif player:reachedBottomRightDoor() then
                player:returnToStart()
                point:play()
            else
                player.x = player.x - player.speed
            end
        end
    end

    if love.keyboard.isDown("right") then
        if not player:reachedRightBorder() then
            if player:reachedTopLeftDoor() then
                player:returnToStart()
                point:play()
            elseif player:reachedTopMiddleDoor() then
                player:returnToStart()
                point:play()
            elseif player:reachedTopRightDoor() then
                player:returnToStart()
                point:play()
            elseif player:reachedBottomLeftDoor() then
                player:returnToStart()
                point:play()
            elseif player:reachedBottomMiddleDoor() then
                player:returnToStart()
                point:play()
            elseif player:reachedBottomRightDoor() then
                player:returnToStart()
                point:play()
            else
                player.x = player.x + player.speed
            end
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