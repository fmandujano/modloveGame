local colors = {
    {255, 0, 0},       -- Rojo
    {0, 255, 0},       -- Verde
    {0, 0, 255},       -- Azul
    {255, 255, 0},     -- Amarillo
    {0, 255, 255},     -- Cian
    {255, 0, 255},     -- Magenta
    {255, 165, 0},     -- Naranja
    {128, 128, 128},   -- Gris
}
local currColorIdx = 1

function getRandomColor()
	return colors[love.math.random(1,#colors)]
end

function getNextColor()
	currColorIdx = (currColorIdx+1) % (#colors)
	print(currColorIdx)
	--return colors[currColorIdx ]
	return colors[currColorIdx+1]
end


function love.load()
	--msg="holla mundoo"
	msg=holamundo()
	x,y= 300,300
	vx, vy = 150,150
	font = love.graphics.getFont()
	currColor = getRandomColor()
end

function love.update(dt)
	x = x + vx*dt
	y = y + vy*dt
	
	if x<0 or x+font:getWidth(msg) > love.graphics.getWidth() then
		vx = -vx
		--currColor = getRandomColor()
		currColor = getNextColor()
	end	
	if y<0 or y+font:getHeight(msg) > love.graphics.getHeight() then
		vy = -vy	
		--currColor = getRandomColor()
		currColor = getNextColor()
	end
end

function love.draw()
	love.graphics.setColor(currColor)
	love.graphics.print(msg, x,y)
end
