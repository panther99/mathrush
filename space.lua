Space = {
    window = {
        width        = love.graphics.getWidth(),
        height       = love.graphics.getHeight(),
        leftBorder   = 0,
        rightBorder  = love.graphics.getWidth(),
        topBorder    = 0,
        bottomBorder = love.graphics.getHeight()
    },
    objects = {
        topWall      = { width = love.graphics.getWidth(), height = 30 },
        bottomWall   = { width = love.graphics.getWidth(), height = 30 },
        leftWall     = { width = 30, height = love.graphics.getHeight() },
        rightWall    = { width = 30, height = love.graphics.getHeight() },
        door         = { width = 60, height = 5 }
    }
}

-- Checks if object have reached the left border.
-- @param number x Coordinate
-- @return boolean
function Space:reachedLeftBorder(x)
    if x == (Space.window.leftBorder + Space.objects.leftWall.width) then 
        return true 
    end
    
    return false
end

-- Checks if object have reached the right border.
-- @param number x Coordinate
-- @param number width Width of the object
-- @return boolean
function Space:reachedRightBorder(x, width)
    if x == (Space.window.rightBorder - Space.objects.rightWall.width - width) then 
        return true 
    end
    
    return false
end

-- Checks if object have reached the top border.
-- @param number y Coordinate
-- @return boolean
function Space:reachedTopBorder(y)
    if y == (Space.window.topBorder + Space.objects.topWall.height) then 
        return true 
    end

    return false
end

-- Checks if object have reached the bottom border.
-- @param number y Coordinate
-- @param number height Height of the object
-- @return boolean
function Space:reachedBottomBorder(y, height)
    if y == (Space.window.bottomBorder - Space.objects.bottomWall.height - height) then
        return true 
    end

    return false
end