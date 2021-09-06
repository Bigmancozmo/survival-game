fps = {}
require("libs/colorize")
function fps.draw()
	f = love.timer.getFPS()
	love.graphics.setColor(1,1,1,1)
	love.graphics.print(tostring(f).." FPS")
end
return fps
