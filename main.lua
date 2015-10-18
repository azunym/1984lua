debug = false
require('splash')
require('game')

function love.load(  )
	--load images ( global )
	img_fn = {"bullet", "enemy", "player", "title", "background"}
	imgs = {}
	for _,v in ipairs(img_fn) do
		imgs[v] = love.graphics.newImage("assets/"..v..".gif")
	end

	-- Set filter to nearest
	for _,v in pairs(imgs) do
		v:setFilter("nearest", "nearest")
	end

	music = love.audio.newSource("assets/music.ogg", "stream")
	music:setLooping(true)
	love.audio.play(music)

	--shoot sound
	shoot = love.audio.newSource( "assets/shoot.ogg")

	--font
	font = love.graphics.newFont("assets/font.ttf", 14*scale)
	love.graphics.setFont(font)

	--define colors
	bgcolor = {r=148, g = 191, b= 19}
	fontcolor = {r = 46, g = 115, b = 46}

	state = "splash"

	--load splash
	splash.load()
	game.load()

end

function love.draw(  )
--set color
	love.graphics.setColor(bgcolor.r, bgcolor.g, bgcolor.b )
--Draw background rectangle
	love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
--return color back to normal
love.graphics.setColor(255,255,255)

if state == "splash" then
	splash.draw()
elseif state == "game" then
	game.draw()
end

end

function love.update( dt )
	if state == "splash" then
		splash.update(dt)
	elseif state == "game" then
		game.update(dt)
	end
end

function love.keypressed( key )
	if state == "splash" then
		splash.keypressed(key)
	elseif state == "game" then
		game.keypressed(key)
	end

	if key == "=" then 
		debug = not debug
	end

   if key == "escape" then
      love.event.quit()
   end
end