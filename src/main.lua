function love.load(func, chunkname)
	font = love.graphics.setNewFont(40)
	currentTime = 0.000	
	startTime = 0.000	
	stopTime = 0.000	
	running = false
	heldTime = 0.000
	textColor = {1, 1, 1, 1}
end

function start()
	currentTime = 0.000
	startTime = 0.000	
	stopTime = 0.000	
	heldTime = 0.000
	startTime = love.timer.getTime()
	running = true
	textColor = {1, 1, 1, 1}
end

function stop()
	stopTime = 0.000	
	stopTime = love.timer.getTime()
	running = false
end

function held()
	heldTime = love.timer.getTime()
	textColor = {0, 1, 1, 1}
end

function early()
	textColor = {1, 1, 1, 1}
end

function ready()
	if (running == false and (love.timer.getTime() - heldTime) > 2 and love.keyboard.isDown("space")) then
		textColor = {0, 1, 0, 1}
	else
		textColor = {1, 1, 1, 1}
	end
end

function love.update(dt)
	ready()
	if running == true then
		currentTime = (love.timer.getTime() - startTime)
	else
		currentTime = (stopTime - startTime)
	end
end

function love.draw()
	love.graphics.setColor(textColor)
	love.graphics.print(string.format("%.3f", currentTime), 100, 100)
end

function love.keyreleased(key)
	if key == "escape" then
		love.event.quit()
	end
	if (key == "space" and running == false and (love.timer.getTime() - heldTime) > 2) then
		start()
	end
	if (key == "space" and running == false and (love.timer.getTime() - heldTime) < 2) then
		early()
	end
end

function love.keypressed(key)
	if (key == "space" and running == true) then
		stop()
	end
	if (key == "space" and running == false) then
		held()
	end
end