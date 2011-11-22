require_relative 'square'

module Rectangles
	class Input
		def get_line(input_line)
			print input_line
			return gets.strip
		end
		def get_input_squares
			squares = []
			begin
				side = Float(get_line('Zadejte delku hrany prvniho ctverce:'))
				raise ArgumentError if side < 0
				x_possition = Float(get_line('Zadejte x-ovou souradnici stredu prvniho ctverce: '))
				y_possition = Float(get_line('Zadejte y-ovou souradnici stredu prvniho ctverce: '))
				squares << Square.new(x_possition, y_possition, side)
				side = Float(get_line('Zadejte delku hrany druheho ctverce:'))
				raise ArgumentError if side < 0
				x_possition = Float(get_line('Zadejte x-ovou souradnici stredu druheho ctverce: '))
				y_possition = Float(get_line('Zadejte y-ovou souradnici stredu druheho ctverce: '))
				squares << Square.new(x_possition, y_possition, side)
			rescue ArgumentError => e
				abort("Spatny vstup.")
			end
			return squares
		end
	end
end