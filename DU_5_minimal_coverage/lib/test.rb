# To change this template, choose Tools | Templates
# and open the template in the editor.

module Coverage
  class Test
    attr_accessor :m, :lines
  
		def initialize(m, lines)
			@m = m
			@lines = lines
		end
  
		def solve    
			found_to = 0;
			output_lines = []
			begin 
				added_line = @lines.select { 
					|line|
					line.left_coord <= found_to && line.right_coord > found_to				
				}.sort { |a,b| 
					if a.right_coord > b.right_coord 
						-1
					else
						1
					end
				}.first
				if added_line
					output_lines << added_line 
					found_to = added_line.right_coord
				end
			end until !added_line || added_line.right_coord >= m 
			return [] if m > found_to
			return output_lines
		end  
		def to_s
			return "[Test:m=#{@m}#{@lines.each { |i| print i  }}]"
		end
  end
end
