player = {}

require("libs/colorize")

function player.checkPlayerBounds(position,winSize,plrSize)
    if(position["x"] < 0) then
        position["x"] = 0
    end
    if(position["x"] > winSize["w"] - plrSize) then
        position["x"] = winSize["w"] - plrSize
    end
    if(position["y"] < 0) then
        position["y"] = 0
    end
    if(position["y"] > winSize["h"] - plrSize) then
        position["y"] = winSize["h"] - plrSize
    end
end
function player.playerUpdate(position,speed,winSize,plrSize)
    up = love.keyboard.isDown("up")
    right = love.keyboard.isDown("right")
    down = love.keyboard.isDown("down")
    left = love.keyboard.isDown("left")
    moving = up and left and down and right
    if(love.keyboard.isDown("up")) then
        position["y"] = position["y"] - speed
    end
    if(love.keyboard.isDown("down")) then
        position["y"] = position["y"] + speed
    end
    if(love.keyboard.isDown("left")) then
        position["x"] = position["x"] - speed
    end
    if(love.keyboard.isDown("right")) then
        position["x"] = position["x"] + speed
    end
    player.checkPlayerBounds(position,winSize,plrSize)
end
function player.draw()
    love.graphics.setColor(hex("#ffd88a"));
    love.graphics.rectangle("fill",position["x"],position["y"],plrSize,plrSize); -- player
    love.graphics.setColor(hex("#382500"));
    love.graphics.rectangle("fill",position["x"],position["y"] + (plrSize / 3) * 2,plrSize,plrSize / 3); -- player
    love.graphics.setColor(hex("#fff"));
end
return player
