player = {}

require("libs/colorize")

edge = false
up = love.keyboard.isDown("up")
right = love.keyboard.isDown("right")
down = love.keyboard.isDown("down")
left = love.keyboard.isDown("left")
moving = up or left or down or right

function player.checkPlayerBounds(position,winSize,plrSize)
    u = false
    l = false
    d = false
    r = false
    if(position["x"] < 0) then
        position["x"] = 0
        l = true
    end
    if(position["x"] > winSize["w"] - plrSize) then
        position["x"] = winSize["w"] - plrSize
        r = true
    end
    if(position["y"] < 0) then
        position["y"] = 0
        u = true
    end
    if(position["y"] > winSize["h"] - plrSize) then
        position["y"] = winSize["h"] - plrSize
        d = true
    end
    if u or l or d or r then
        edge = true
    else
        edge = false
    end
end
function player.isTouchingScreenSide()
    r={}
    r["movingOnEdge"]=edge
    r["dirMoving"]="none"
    if left then
        r["dirMoving"]="left"
    end
    if right then
        r["dirMoving"]="right"
    end
    return r
end
function player.playerUpdate(position,speed,winSize,plrSize)
    up = love.keyboard.isDown("up")
    right = love.keyboard.isDown("right")
    down = love.keyboard.isDown("down")
    left = love.keyboard.isDown("left")
    moving = up or left or down or right
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
    -- Some small data
    eyeMargin = 8

    -- Basic box
    love.graphics.setColor(hex("#ffd88a")); -- Tan. Will later be the user's choice of color.
    love.graphics.rectangle("fill",position["x"],position["y"],plrSize,plrSize);

    -- Clothes
    love.graphics.setColor(hex("#382500")); -- 
    love.graphics.rectangle("fill",position["x"],position["y"] + (plrSize / 3) * 2,plrSize,plrSize / 3);

    -- Face
    love.graphics.setColor(hex("#000")); -- Black
    love.graphics.rectangle("fill",position["x"] + eyeMargin,position["y"] + 10,plrSize / 6,plrSize / 6); -- Left eye
    love.graphics.rectangle("fill",position["x"] + (plrSize - (eyeMargin * 2)),position["y"] + 10,plrSize / 6,plrSize / 6); -- Right eye
end
return player
