require 'space'

Player = {}

function Player:new()
    local p = {
        width = 30,
        height = 30,
        x = Space.window.width / 2,
        y = Space.window.height / 2,
        speed = 2,
        score = 0
    }
    setmetatable(p, { __index = Player })
    return p
end

-- Checks if player have reached the left border.
-- @return boolean
function Player:reachedLeftBorder()
    return Space:reachedLeftBorder(self.x)
end

-- Checks if player have reached the right border.
-- @return boolean
function Player:reachedRightBorder()
    return Space:reachedRightBorder(self.x, self.width)
end

-- Checks if player have reached the top border.
-- @return boolean
function Player:reachedTopBorder()
    return Space:reachedTopBorder(self.y)
end

-- Checks if player have reached the bottom border.
-- @return boolean
function Player:reachedBottomBorder()
    return Space:reachedBottomBorder(self.y, self.height)
end