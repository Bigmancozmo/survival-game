button = {}

function button.isMouseOver(x,y,width,height)
	mousex,mousey = love.mouse.getPosition()
	return mousex > x and mousex < x + width and mousey > y and mousey < y + height
end

function button.click()
	return love.mouse.isDown(1)
end

return button