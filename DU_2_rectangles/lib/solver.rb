# To change this template, choose Tools | Templates
# and open the template in the editor.
module Rectangles
	class Solver
		def initialize(squares)
			@squares = squares
		end
		def is_overlaping
			return overlap;
		end
		def overlap_area			
			if !is_overlaping
				return 0;
			end
			return @squares[0].area + @squares[1].area - overlap
		end
		private 
		def overlap			
			overlap = @squares[0].overlap(@squares[1])
			overlap = @squares[1].overlap(@squares[0]) if !overlap
			return overlap
		end
	end
end
