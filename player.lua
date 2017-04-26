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

-- Returns player to the start position.
function Player:returnToStart()
    self.x = Space.window.width / 2
    self.y = Space.window.height / 2
    self.score = self.score + 1
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

-- Checks if player have reached the top left door.
-- @return boolean
function Player:reachedTopLeftDoor()
    return Space:reachedTopLeftDoor(self.x, self.y)
end

-- Checks if player have reached the top middle door.
-- @return boolean
function Player:reachedTopMiddleDoor()
    return Space:reachedTopMiddleDoor(self.x, self.y)
end

-- Checks if player have reached the top right door.
-- @return boolean
function Player:reachedTopRightDoor()
    return Space:reachedTopRightDoor(self.x, self.y)
end

-- Checks if player have reached the bottom left door.
-- @return boolean
function Player:reachedBottomLeftDoor()
    return Space:reachedBottomLeftDoor(self.x, self.y, self.height)
end

-- Checks if player have reached the bottom middle door.
-- @return boolean
function Player:reachedBottomMiddleDoor()
    return Space:reachedBottomMiddleDoor(self.x, self.y, self.height)
end

-- Checks if player have reached the bottom right door.
-- @return boolean
function Player:reachedBottomRightDoor()
    return Space:reachedBottomRightDoor(self.x, self.y, self.height)
end