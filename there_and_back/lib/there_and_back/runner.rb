require_relative 'input'
require_relative 'city_graph'
require_relative 'solver'
require_relative 'response'

module ThereAndBack
	class Runner
		def run(arguments)
			input = Input.new(arguments)
		  graphs = input.parse
			solver = Solver.new
			response = Response.new
			graphs.each { 
				|graph|  
				response.add_response(graph, solver.solve_one(graph)) 
			}
			return response
		end	
	
	end
end