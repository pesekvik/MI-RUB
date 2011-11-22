require_relative 'input'

module Coverage
	class Runner
		def run
			input = Input.new()
			tests = input.get_tests_from_input()
			tests.each { |t|
				puts
				output_lines = t.solve
				if output_lines.empty?
					puts "0"
				else
					puts output_lines.count
					output_lines.each { 
						|i|
						puts "#{i.left_coord} #{i.right_coord}"
					}	
				end
			}
		end
	end
end