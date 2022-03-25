autosave = {}
datacomp = nil
local counter = 0
local counter2 = 0
local saved = false
require("./libs/colorize")

function defaultSave(data)
    datacomp = "health="..data["hpv"]..";gameVersion="..data["gvs"]..";plrX="..tostring(data["plx"])..";plrY="..tostring(data["ply"])..";"
end

function saveGame(hasNewFile)
    savename = "game.sav"
    if hasNewFile then
        defaultSave({
			["hpv"] = healthn,
			["gvs"] = "Alpha v1.0",
			["plrX"] = plrPosition["x"],
			["plrY"] = plrPosition["y"]
		})
    else
        defaultSave({
			["hpv"] = health,
			["gvs"] = "Alpha 1.0",
			["plrX"] = plrPosition["x"],
			["plrY"] = plrPosition["y"]
		})
    end
    success = love.filesystem.write(savename, datacomp)
end

function autosave.save()
	if not love.filesystem.exists("game.sav") then
        savename = "game.sav"
        saveGame(true)
        success = love.filesystem.write(savename, datacomp)
    else
    	savename = "game.sav"
        saveGame(false)
        success = love.filesystem.write(savename, datacomp)
    end
end

function autosave.draw()
	if saved then
		love.graphics.print("Saving...", 0, 553, 0, 3)
	end
end

function autosave.update(data)
	counter = counter + 1
	if counter > 10 then
		if not saved then
			autosave.save(data)
		end
		saved = true
	end
	if saved then
		counter2 = counter2 + 1
		if counter2 > 49 then
			counter = 0
			saved = false
		end
	end
end

return autosave