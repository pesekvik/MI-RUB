require 'rgl/adjacency'
require 'rgl/traversal'
require 'rgl/implicit'
require 'logger'
require 'rgl/topsort'
require 'rgl/connected_components'

module ThereAndBack
	#Class solving the requested problem
  class Solver		
    def initialize()
			@found_solutions = []
      @logger = Logger.new(STDOUT)
    end
		#solves an array of graphs and returns sollutions for all
		def solve(graphs)
			all_solutions = []
			graphs.each { 
				|g|
				all_solutions << solve_one(g)
			}
			return all_solutions
		end
		#solves one graph instance, solving by brute force
		#1) get set of all directed edges if graph was full
		#2) remove those edges which are already in assigment graph
		#3) from 1 until graph node size + 1 it tries combinations from edge set
		#and adds them to assigment graph and then checks, whether the 
		#resulting graph is cyclic
		#returns all best sollutions in array
		def solve_one(graph)
			if test_cyclic(graph)
				return Array.new
			end
			#first whole set we think of the whole set of edges to try
			edges_to_test = complete_directed(graph.vertices.size).edges
			
			#we don`t need edges already in
			graph.edges().each{ 
				|i|
				edges_to_test.delete(i)	
			}
			
			# even in empty graph, we are able to make circle like this
			try_times = graph.vertices.size + 1 
			try_times.times { 
				|i|  
				number_trying = i + 1
				@logger.debug "Trying to add #{number_trying} edges"
				edges_to_test.combination(number_trying) { 				
					|to_add|  		
					#we`re ready to finish, we have results all results on the correct level
					graph.add_edges(*to_add)		
					if test_cyclic(graph)
						@found_solutions << to_add
						@logger.debug "Found #{@found_solutions.size} solutions while adding #{number_trying} edges"
					end				
					to_add.each{
						|edge|		
						graph.remove_edge(edge[0], edge[1])
					}					
				}	
				if !@found_solutions.empty?		
					return @found_solutions 			
				end
			}
			raise RuntimeError, 'Wrong implementation'
		end
		private
		#test, whether the graph is cyclic
		def test_cyclic(graph)
			graph.strongly_connected_components.num_comp	== 1
		end
		#returns a complete instance of city graph with n nodes
		def complete_directed (n)
			i1 = (1..n).to_a
			g = CityGraph.new			
			i1.permutation(2).to_a.each{
				|edge|
				g.add_edge(edge[0], edge[1])
			}	
			return g
		end
  end
end
