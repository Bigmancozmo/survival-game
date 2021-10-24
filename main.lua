-- main.lua - stitch together all the scripts to make a fun game --

require("player")
require("ui/fps")
require("libs/colorize")
require("ui/button")
require("libs/extensions")

function love.load()
    -- Create variables
    gameVersionn = "1"
    gamestate = "menu"
    speed = 4
    plrPosition = {}
    winSize = {}
    plrSize = 40
    local healthn = 100
    local hasPlayed

    if not love.filesystem.exists("game.sav") then
        savename = "game.sav"
        saveGame()
        success = love.filesystem.write(savename, datacomp)
    end
    love.setDeprecationOutput(false)
    savename = "game.sav"
    chunk = love.filesystem.load(savename)
    chunk()

    -- Set table values
    winSize["w"] = 800
    winSize["h"] = 600
    plrPosition["x"] = winSize["w"] / 2 - plrSize / 2
    plrPosition["y"] = winSize["h"] / 2 - plrSize / 2
end

function love.update(dt)
    if gamestate == "play" then
        player.playerUpdate(plrPosition,speed,winSize,plrSize)
    end
end

function saveGame()
    savename = "game.sav"
    datacomp = "health="..health..";".."gameVersion="..gameVersionn..";"
    success = love.filesystem.write(savename, datacomp)
end

function getHurt(dmg)
    health = health - dmg;
end

function love.draw()
    if gamestate == "play" or gamestate == "pause" then
        love.graphics.setColor(rgba(255,0,0,1))
        love.graphics.rectangle("fill",450,450,40,40)
        player.draw(health)
        love.graphics.setColor(hex("#fff"))
        love.graphics.rectangle("fill",700,0,100,50)
        love.graphics.setColor(hex("#000"))
        love.graphics.print("Save",730,10,0,2)
        if button.isMouseOver(700,0,100,50) then
            love.graphics.setColor(hex("#bbb"))
            if button.click() then
                gamestate = "play"
                saveGame();
            end
        end
    end
    if gamestate == "menu" then
        if button.isMouseOver(300,380,200,60) then
            love.graphics.setColor(hex("#bbb"))
            if button.click() then
                gamestate = "play"
            end
        else
            love.graphics.setColor(rgba(255,255,255,1))
        end
        love.graphics.rectangle("fill",300,380,200,60)
        local mid = extensions.getCenterPos(200,60,300,380)
        love.graphics.setColor(0,0,0,1)
        love.graphics.print("Play",mid["x"] + 10,mid["y"] + 140, 0, 3)
        love.graphics.setColor(hex("#fff"))
        love.graphics.print("*Please remember to save\n before quitting!\n I have not coded autosave\n yet.",300,200, 0, 2)
    end
    love.graphics.setColor(hex("#fff"))
    fps.draw()
end
