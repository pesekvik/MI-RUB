require_relative 'line'
require_relative 'test'


module Coverage
	class Input
		def get_tests_from_input
			tests_cases = []
			tests_number = Integer(gets)
			gets
			tests_number.times do
				lines = []  
				m = Integer(gets) 
  
				while true do    
					input_line = gets.split(" ")   
					if input_line.count > 1 
						if input_line[0] == "0" and input_line[1] == "0"       
							break
						end
						lines << Line.new(input_line[0],input_line[1])
					end
					#p a
				end 
    
				t = Test.new(m, lines)
				tests_cases << t
    
				gets
			end
			return tests_cases
		end
	end
end