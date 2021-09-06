extensions = {}

function extensions.getCenterPos(x,y,w,h)
	p={}
	p["x"]=x+(w/2)
	p["y"]=y+(h/2)
	return p
end

return extensions
