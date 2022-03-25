mainmenu = {}

require("libs/extensions")
require("libs/colorize")

function mainmenu.update()
	if button.isMouseOver(300,380,200,60) then
        love.graphics.setColor(hex("#bbb"))
        if button.click() then
            gamestate = "play"
        end
    else
        love.graphics.setColor(rgba(255,255,255,1))
    end
end

function mainmenu.draw()
	love.graphics.rectangle("fill",300,380,200,60)
    local mid = extensions.getCenterPos(200,60,300,380)
    love.graphics.setColor(0,0,0,1)
    love.graphics.print("Play",mid["x"] + 10,mid["y"] + 140, 0, 3)
    love.graphics.setColor(hex("#fff"))
end