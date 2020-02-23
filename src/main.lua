function love.conf(t)
	t.window.width = 800
	t.window.height = 400
	t.modules.joystick = false
	t.modules.physics = false
end

function love.load(func, chunkname)
	currentTime = 0.000	
	startTime = 0.000	
	stopTime = 0.000	
	running = false
	heldTime = 0.000
	textColor = {1, 1, 1, 1}
	waitTime = 1
	display = {}
	display.font = love.graphics.setNewFont("fonts/fantasquesansmono-bold.otf", 100)
	display.text = love.graphics.newText(display.font, "")
	display.x = 0
	display.y = 0
	display.backgroundColor = {0.157, 0.157, 0.157}
	display.accentColor = {0.596, 0.592, 0.102}
	display.fontColor = {0.922, 0.859, 0.698}
end

function start()
	currentTime = 0.000
	startTime = 0.000	
	stopTime = 0.000	
	heldTime = 0.000
	startTime = love.timer.getTime()
	running = true
	textColor = display.fontColor
end

function stop()
	stopTime = 0.000	
	stopTime = love.timer.getTime()
	running = false
end

function held()
	heldTime = love.timer.getTime()
	textColor = display.accentColor
end

function early()
	textColor = display.fontColor
end

function ready()
	if (running == false and (love.timer.getTime() - heldTime) > waitTime and love.keyboard.isDown("space")) then
		textColor = display.accentColor
	else
		textColor = display.fontColor
	end
end

function populateText()
	display.text:set(string.format("%.3f", currentTime))
	display.x = love.graphics.getWidth()/2 - display.text:getWidth()/2
	display.y = love.graphics.getHeight()/2 - display.text:getHeight()/2
end

function love.update(dt)
	ready()
	populateText()
	if running == true then
		currentTime = (love.timer.getTime() - startTime)
	else
		currentTime = (stopTime - startTime)
	end
end

function love.draw()
	love.graphics.setBackgroundColor(display.backgroundColor)
	love.graphics.setColor(textColor)
	love.graphics.draw(display.text, display.x, display.y)
end

function love.keyreleased(key)
	if (key == "space" and running == false and (love.timer.getTime() - heldTime) > waitTime) then
		start()
	end
	if (key == "space" and running == false and (love.timer.getTime() - heldTime) < waitTime) then
		early()
	end
end

function love.keypressed(key)
	if (key == "escape" and running == false) then
		love.event.quit()
	end
	if running == true then
		stop()
	end
	if (key == "space" and running == false) then
		held()
	end
end