Assets = {}

local dirSeparator = function()
    if love.system.getOS() == "Windows" then
        return "\\"
    else
        return "/"
    end
end

-- Creates new assets container.
-- @return Assets
function Assets:new()
    local assetsDirectory = "assets" .. dirSeparator()

    local assets = {
        fontsDirectory  = assetsDirectory .. "fonts" .. dirSeparator(),
        imagesDirectory = assetsDirectory .. "images" .. dirSeparator(),
        audioDirectory  = assetsDirectory .. "audio" .. dirSeparator()
    }
    
    setmetatable(assets, { __index = Assets })
    return assets
end

-- Returns font asset.
-- @return Font
function Assets:newFont(name, size)
    local font = self.fontsDirectory .. name
    return love.graphics.newFont(font, size)
end

-- Returns image asset.
-- @return Image
function Assets:newImage(name)
    local image = self.audioDirectory .. name
    return love.graphics.newImage(image)
end

-- Returns audio asset.
-- @return Source
function Assets:newAudio(name)
    local audio = self.audioDirectory .. name
    return love.audio.newSource(audio)
end