-- Game scale
scale = 4
function love.conf( t )
	t.title = "1942 Game Boy"
	t.window.width = 160*scale
	t.window.height = 144*scale
end