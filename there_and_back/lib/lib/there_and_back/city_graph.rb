require 'rgl/adjacency'
module ThereAndBack
	class CityGraph < RGL::DirectedAdjacencyGraph
		def initialize(edgelist_class = Set, *other_graphs)
			super(edgelist_class, *other_graphs)
		end
		def print_to_file
			require 'rgl/dot'
			self.write_to_graphic_file("jpg") 
		end		
	end
end
