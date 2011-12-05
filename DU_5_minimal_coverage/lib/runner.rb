require_relative 'input'

module Coverage
	class Runner
		def run
			input = Input.new()
			tests = input.get_tests_from_input()
			result = ""
			tests.each { |t|
				output_lines = t.solve
				if output_lines.empty?
					result+= "0"
				else
					result+= "#{output_lines.count}\n"
					output_lines.each { 
						|i|
						result+= "#{i.left_coord} #{i.right_coord}"
					}	
				end
				result +="\n"
			}
			result
		end
	end
end