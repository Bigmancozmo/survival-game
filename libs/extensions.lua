extensions = {}

function extensions.getCenterPos(x,y,w,h)
	p={}
	p["x"]=x+(w/2)
	p["y"]=y+(h/2)
	return p
end

-- I made this function before I knew proper collisions, so it's sorta broken.
function extensions.isColliding(obj1x,obj1y,obj1w,obj1h,obj2x,obj2y,obj2w,obj2h)
	obj1l = obj1x
	obj1r = obj1x + obj1w
	obj1t = obj1y 
	obj1b = obj1y + obj1h
	obj2l = obj2x
	obj2r = obj2x + obj2w
	obj2t = obj2y
	obj2b = obj2y + obj2h
	if obj1r > obj2l and obj1l < obj2r then
		if obj1b > obj2t and obj1t < obj2b then
			return true
		else
			return false
		end
	else
		return false
	end
end

function extensions.split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

return extensions