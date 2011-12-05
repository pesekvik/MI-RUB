require_relative 'square'
require_relative 'input'
require_relative 'solver'

module Rectangles
	class Runner
		def run
			input = Input.new()
			return count_area(input.get_input_squares())
		end
		
		private
		def count_area(squares)
			solver = Solver.new(squares)
			if !solver.is_overlaping
				puts "Ctverce se ani nedotykaji."
			else				
				puts "Obsah sjednoceni dvou ctvercu je #{solver.overlap_area}."
			end
#			overlap = squares[0].overlap(squares[1])
#			overlap = squares[1].overlap(squares[0]) if !overlap
#			if !overlap
#				puts "Ctverce se ani nedotykaji."
#			else				
#				puts "Obsah sjednoceni dvou ctvercu je #{squares[0].area + squares[1].area - overlap}."
#			end
			
			
		end
	end
end