player = require("player")

function getCenterPos(x,y,w,h)p={}p["x"]=x+(w/2)p["y"]=y+(h/2)return p end

function love.load()
    -- Create variables
    speed = 4
    position = {}
    winSize = {}
    plrSize = 40

    -- Set table values
    winSize["w"] = 800
    winSize["h"] = 600
    position["x"] = winSize["w"] / 2 - plrSize / 2
    position["y"] = winSize["h"] / 2 - plrSize / 2
end

function love.update(dt)
    player.playerUpdate(position,speed,winSize,plrSize)
end

function love.draw()
    player.draw()
end
--#ffd88a