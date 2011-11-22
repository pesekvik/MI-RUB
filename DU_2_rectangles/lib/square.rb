module Rectangles
	class Square
		attr_accessor :coordinates, :side, :area
		def initialize(xpos, ypos, side)
			@side = Float(side)
			@area = Float(side * side)

			@coordinates = {
				'x_min' => xpos - Float(@side/2),
				'x_max' => xpos + Float(@side/2),
				'y_min' => ypos - Float(@side/2),
				'y_max' => ypos + Float(@side/2),
				}
		end
		def overlap(left_square)
			right = @coordinates
			left = left_square.coordinates
			if	(	right['x_min'] < left['x_max'] and
						right['x_max'] > left['x_min'] and
						right['y_min'] < left['y_max'] and
						right['y_max'] > left['y_min']
					) # overlap found, where it lies?
				x_min = [right['x_min'], left['x_min']].max
				x_max = [right['x_max'], left['x_max']].min
				y_min = [right['y_min'], left['y_min']].max
				y_max = [right['y_max'], left['y_max']].min
				return (x_max - x_min)*(y_max - y_min)
			end
			return false
		end
	end
end