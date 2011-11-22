

class Solver
	
	def initialize(board_dim_x, board_dim_y,piece_dim_x , piece_dim_y)
		@board_dim_x = board_dim_x;
		@board_dim_y = board_dim_y;
		@board = Array.new(board_dim_x*board_dim_y) {false  }#filled or not
		#represented as indexes
		@pieces = Array.new
		@pieces.push(rotate_pieces(piece_dim_x, piece_dim_y))		
		@pieces.push(rotate_pieces(piece_dim_y, piece_dim_x))
		@in_board = Array.new	
		@tried = Array.new	

	end
	def rotate_pieces( piece_dim_x , piece_dim_y)		
		piece = Array.new
		piece_dim_y.times { |i|  	
			piece_dim_x.times { |i2|  
				piece.push(i*@board_dim_x+ i2)
			}
		}
		return piece
	end
	def solve
		if solve_internal(@board, 0, 0)
			puts "Succesfully filled"
			@tried.each { |object|  
				print "item: "
				object.each{
					|item|
					print "[#{item/@board_dim_x},#{item%@board_dim_x}] "
				}
				puts
			}
		else
			puts "No solution found"
		end
		
	end
	private
	def solve_internal(board, translateX, translateY)
		#		print "#{translateX}, #{translateY}"
		#		puts
		@pieces.each { 
			|piece|  
			piece = translate(piece.clone, translateX, translateY)
			branch_board = board
			if(!branch_board[translateX + translateY*@board_dim_x])#no need to test, our objects are rectangular, must also fill the left bottom corner
				#				branch_board = board.clone
				place(branch_board, piece)
				#				print branch_board
				#				puts 
				#				print "#{translateX}, #{translateY}"
				#				puts
				if solved(branch_board)
					return true;
				end
			end
			if (translateX < @board_dim_x)
				return true if solve_internal(branch_board, translateX+1, translateY) 
			end
			return true if solve_internal(branch_board, translateX, translateY+1) if (translateY < @board_dim_y)
		}
		return false;
	end
	def translate(piece, translateX, translateY)
		return piece.collect { 
			|item| 
			item + translateX + translateY*@board_dim_x;
		}
	end
	def place(board, piece)
		piece.each { |index|
			if(board.length<= index)
				return false;
			end
			if(board[index])
				return false;
			end
		}		
		@in_board.push(piece)
		@tried.push(piece)
		piece.each { |index|  
			board[index]= true;
		}
	end
	def solved(board)
		board.each{
			|item|
			if !item
				return false;
			end
		}
		return true;
	end
end

solver = Solver.new(8, 3, 1, 3)
solver.solve



