healthReqquire = {}
require("../libs/colorize")

function healthReqquire.draw(healthAmount,barX,barY)
	love.graphics.setColor(hex("#ff0000"))
	love.graphics.rectangle("fill",barX,barY,100 / 1.5,10)
	love.graphics.setColor(hex("#00ff00"))
	love.graphics.rectangle("fill",barX,barY,healthAmount / 1.5,10)
end

return healthReqquire