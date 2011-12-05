require_relative 'city_graph'

module ThereAndBack
	#Takes care of input
	class Input
		INPUT_FILE_MISSING = 'Chybi vstupni soubor'
		INPUT_FILE_CANT_FIND = 'Nenalezen vstupni soubor "%s"'
		INPUT_FILE_LINE_PARSE_ERROR = 'Chyba pri cteni instance problemu ze souboru,
		radka souboru by mela vypadat:
		5 měst, 3 silnice, <1, 2>, <2, 3>, <3, 4>
		(měst a silnice nemenne i v pripade, ze by byla jen jedna)'
		def initialize(arguments)
			@arguments = arguments
		end
		#parses arguments and returns an array of CityGraph instances
		#parsed from the input. Raises Argument error if input file is wrong,
		#or its contents are wrong
		def parse
			raise ArgumentError, INPUT_FILE_MISSING if(!@arguments[0])
			raise ArgumentError, INPUT_FILE_CANT_FIND % @arguments[0] if !File.exists?(@arguments[0])
			input_file = File.new(@arguments[0], 'r')
			graphs = []
			while (line = input_file.gets)
				graphs << parse_graph(line)
			end	
			return graphs
		end
		private
		#parses one line into CityGraph
		def parse_graph(line)
			city_graph = CityGraph.new
			begin
				input_fields = line.split(",")
				town_input = input_fields.delete_at(0)
				town_number = Integer(town_input.split(" ")[0])
				raise ArgumentError  if town_input.split(" ")[1] != 'měst'
				town_number.times { 
					|i|  
					city_graph.add_vertex(i+1)
				}
				
				road_input = input_fields.delete_at(0)
				road_number = Integer(road_input.split(" ")[0])
				raise ArgumentError  if road_input.split(" ")[1] != 'silnice'
				road_number.times { 
					from = Integer(input_fields.delete_at(0).sub('<','').strip)
					to = Integer(input_fields.delete_at(0).sub('>','').strip)
					city_graph.add_edge(from, to)
				}
				raise ArgumentError if !input_fields.empty?						
			rescue ArgumentError => e
				raise ArgumentError, INPUT_FILE_LINE_PARSE_ERROR
			end
			return city_graph
		end
	end
end