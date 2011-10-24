fibonacci = Fiber.new do  
  x, y = 0, 1 
	loop do  
		Fiber.yield y 
		x,y = y,x+y 
	end 
end 


for i in(0 .. 100) do
	value=fibonacci.resume
	puts value
end