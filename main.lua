require("ui/fps")
require("libs/colorize")
require("ui/button")
require("libs/extensions")
require("states/mainmenu")
require("states/play")
require("data/autosave")

gameVersionn = "1"
healthn = 100
plrPosition = {}
winSize = {}
plrSize = 40
winSize["w"] = 800
winSize["h"] = 600
speed = 4
plrPosition["x"] = winSize["w"] / 2 - plrSize / 2
plrPosition["y"] = winSize["h"] / 2 - plrSize / 2


function resetPlayerVariables()

end

function love.load()
    gamestate = "menu"

    local hasPlayed

    if not love.filesystem.exists("game.sav") then
        savename = "game.sav"
        saveGame(true)
        success = love.filesystem.write(savename, datacomp)
    end
    love.setDeprecationOutput(false)
    savename = "game.sav"
    chunk = love.filesystem.load(savename)
    chunk()
    resetPlayerVariables()
    plrPosition["x"] = plrX
    plrPosition["y"] = plrY
end

function love.update(dt)
    local aaaaaaaaaaaaa
    if hasPlayed then
        aaaaaaaaaaaaa = healthn
    else
        aaaaaaaaaaaaa = health
    end
    local bbbbbbbbbbbbb = "1.0.0"
    local ccccccccccccc = plrPosition["x"]
    local ddddddddddddd = plrPosition["y"]
    local eeeeeeeeeeeee = {}
    eeeeeeeeeeeee["hpv"] = aaaaaaaaaaaaa
    eeeeeeeeeeeee["gvs"] = bbbbbbbbbbbbb
    eeeeeeeeeeeee["plx"] = ccccccccccccc
    eeeeeeeeeeeee["ply"] = ddddddddddddd
    play.update(eeeeeeeeeeeee)
end

function getHurt(dmg)
    health = health - dmg;
end

function love.draw()
    play.draw()
    if gamestate == "menu" then
        mainmenu.update()
        mainmenu.draw()
    end
    love.graphics.setColor(hex("#fff"))
    fps.draw()
end
