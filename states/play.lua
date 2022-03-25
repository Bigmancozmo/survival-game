play = {}

require("player")
require("data/autosave")

function play.update(data)
	if gamestate == "play" then
        player.playerUpdate(plrPosition,speed,winSize,plrSize)
    end
    autosave.update(data)
end

function play.draw()
	if gamestate == "play" or gamestate == "pause" then
        love.graphics.setColor(rgba(255,0,0,1))
        love.graphics.rectangle("fill",450,450,40,40)
        player.draw(health)
        love.graphics.setColor(hex("#fff"))
        love.graphics.rectangle("fill",700,0,100,50)
        love.graphics.setColor(hex("#000"))
        love.graphics.print("Menu",730,10,0,2)
        if button.isMouseOver(700,0,100,50) then
            love.graphics.setColor(hex("#bbb"))
            if button.click() then
                gamestate = "menu"
                saveGame(false);
            end
        end
        love.graphics.setColor(hex("#fff"))
        autosave.draw()
    end
end