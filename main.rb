
class Graph
	attr_reader :number_of_vertices
	def initialize(number_of_vertices)
		@number_of_vertices = number_of_vertices
		@vertices = Array.new
		@number_of_vertices.times{|i|
			@vertices[i + 1] = Vertex.new(i + 1) #start index with 1
		}
	end
	def get_vertex(pos)
		return @vertices[pos];
	end
	def bfs(start)
		queue = Array.new		
		visited = Array.new
		queue.push( get_vertex(start));		
		while(!queue.empty?)#not aplicable for large due to memory issues
			#			puts "ahoj"
			current = queue.shift			
			visited.push(current)
			print "#{current} "
			current.connected_vertices.each { |e| 
				if(!visited.include?(e) && !queue.include?(e))
					queue.push(e)
				end
			}
			#			print queue
			#			puts
		end
		puts 
	end
	def dfs(start)
		get_vertex(start).dfs(Array.new, Array.new);
		puts
	end
	def connect_vertices(from, to)
		from.add_connection(to);
		to.add_connection(from);
	end
end

class Vertex 
	include Comparable
	attr_accessor :connected_vertices,:index
	def <=>(anOther)
		@index <=> anOther.index
	end
	def initialize(index)
		@connected_vertices = Array.new
		@index = index;
	end	
	def add_connection(vertex)
		if !@connected_vertices.include?(vertex) 
			@connected_vertices.push(vertex)
		end
	end
	def dfs(branch_stack, visited)
		print "#{print self} ";
		branch_stack.push(self);
		@connected_vertices.each{|e|
			if(!visited.include?(e) && !branch_stack.include?(e))
				e.dfs(branch_stack, visited);
			end
		}
	end
	def to_s
		return "#{@index}";
	end
end

class Engine		
	attr_reader  :reading_line,:lines
	def initialize(lines)
		@lines = lines;
		@reading_line = 0;
		@graphs = Array.new
	end
	def parse()
		#parse
		@number_of_graphs = read_line().to_i;
		@number_of_graphs.times{ |i|			
			g = Graph.new(read_line().to_i);
			#parse vertices and connections
			g.number_of_vertices.times{|k|				
				from = nil;
				from_read = false;
				to_number_read = false;
				read_line_array.each { |vertice_index| 
					vertice_index = vertice_index.to_i
					if(!from_read)#first - to which we add conn
						from = g.get_vertex(vertice_index);
						from_read = true;
						next;
					end
					if(!to_number_read)
						to_number_read = true;
						next;
					end
						
					if(vertice_index != 0)
						g.connect_vertices(from, g.get_vertex(vertice_index))
					end
				}
			}
			puts "graph #{i + 1}"
			#read config and output
			config = read_line_array
			while(config[0] != 0 || config[1] != 0)
				
				if(config[1] == 1)
					g.bfs(config[0])
				else 
					if(config[1] == 0)
						g.dfs(config[0])
					else 
						throw "Undefined config #{config[1]}"
					end
				end
				config = read_line_array
			end
			@graphs.push(g);
		}
	end
	private
	def read_line()
		current_line = lines()[@reading_line]; 
		@reading_line +=1;
		return current_line
	end
	def read_line_array()
		line = read_line		
		return line.split.collect!{|e|
			e.to_i
		}
	end
end

f = File.open( "input.txt" , "r" )

lines = Array.new();
#change to array
f.each { |e| 
	lines.push(e);
}
engine = Engine.new(lines);
#parse
engine.parse()
f.close
