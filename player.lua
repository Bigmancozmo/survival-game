-- lol it's so hard to locate bugs in this code
-- oh well at least good player functionality requires
-- lots of code!

player = {}

require("libs/colorize")
require("libs/extensions")
local healthReqquire = require("ui/health")

edge = false
up = love.keyboard.isDown("up")
right = love.keyboard.isDown("right")
down = love.keyboard.isDown("down")
left = love.keyboard.isDown("left")
moving = up or left or down or right
eyeOffs = 0
eyeOffsY = 0
isCollidingWithAnObject = false

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
    if right then
        eyeOffs = 5
    elseif left then
        eyeOffs = -5
    else
        eyeOffs = 0
    end
    if up then
        eyeOffsY = -5
    elseif down then
        eyeOffsY = 5
    else
        eyeOffsY = 0
    end

    player.checkPlayerBounds(position,winSize,plrSize)
    player.checkCollisions(position,plrSize)
end
function player.checkCollisionAt(x,y,w,h,position,plrSize)
    isCollidingWithAnObject = false
    if up then 
        position["y"] = position["y"] - 4
        if extensions.isColliding(position["x"],position["y"],plrSize,plrSize,x,y,w,h) then
            position["y"] = position["y"] + 4
            isCollidingWithAnObject = true
        end
        position["y"] = position["y"] + 4
    end
    if down then 
        position["y"] = position["y"] + 4
        if extensions.isColliding(position["x"],position["y"],plrSize,plrSize,x,y,w,h) then
            position["y"] = position["y"] - 4
            isCollidingWithAnObject = true
        end
        position["y"] = position["y"] - 4
    end
    if left then 
        position["x"] = position["x"] - 4
        if extensions.isColliding(position["x"],position["y"],plrSize,plrSize,x,y,w,h) then
            position["x"] = position["x"] + 4
            isCollidingWithAnObject = true
        end
        position["x"] = position["x"] + 4
    end
    if right then 
        position["x"] = position["x"] + 4
        if extensions.isColliding(position["x"],position["y"],plrSize,plrSize,x,y,w,h) then
            position["x"] = position["x"] - 4
            isCollidingWithAnObject = true
        end
        position["x"] = position["x"] - 4
    end
end
function player.checkCollisions(position,plrSize)
    player.checkCollisionAt(450,450,40,40,position,plrSize);
    if isCollidingWithAnObject then
        health = health - 1
    end
end
function player.draw(healthNum)
    eyeMargin = 8

    -- Basic box
    love.graphics.setColor(hex("#ffd88a")); -- Tan. Will later be the user's choice of color.
    love.graphics.rectangle("fill",plrPosition["x"],plrPosition["y"],plrSize,plrSize);
    healthReqquire.draw(healthNum,plrPosition["x"] - 12.5,plrPosition["y"] - 15)

    -- Clothes
    love.graphics.setColor(hex("#382500")); -- Brown
    love.graphics.rectangle("fill",plrPosition["x"],plrPosition["y"] + (plrSize / 3) * 2,plrSize,plrSize / 3);

    -- Face
    love.graphics.setColor(hex("#000")); -- Black
    love.graphics.rectangle("fill",plrPosition["x"] + eyeMargin + eyeOffs,plrPosition["y"] + eyeOffsY + 10,plrSize / 6,plrSize / 6); -- Left eye
    love.graphics.rectangle("fill",plrPosition["x"] + (plrSize - (eyeMargin * 2)) + eyeOffs,plrPosition["y"] + eyeOffsY + 10,plrSize / 6,plrSize / 6); -- Right eye
end
return player