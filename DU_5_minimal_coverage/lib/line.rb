module Coverage
  class Line
		attr_accessor :left_coord, :right_coord
		
    def initialize( left,right)
			@left_coord=Integer(left)
			@right_coord=Integer(right) 
    end
		def to_s
			#			return "[#{@left_coord},#{right_coord}]"
			return "#{@left_coord} #{@right_coord}"
		end
  end
end
