
module ThereAndBack
	#Encapsulates result into class for different purposes of result showing
	class Response
		def initialize
			@responses = []
		end
		#adds sollutions for input graph
		def add_response(graph_original, sollutions)
			@responses << ResponseSolution.new(graph_original, sollutions)		
		end
		
		#returns sollution as a string required in assigment
		def to_s	
			to_return = ''
			@responses.each { 
				|item|
				to_return = item.to_s
			}
			to_return 
		end
		#resturns results as an array
		def edge_array
			 to_return = @responses.collect { |item| item.sollutions }
			 return to_return
		end
	end
	private
	#One sollution in response
	class ResponseSolution
		NEEDED_TO_CONSTRUCT = 'Je třeba ještě vybudovat %s'
		ALREADY_COMPLETED = 'Síť je vyhovující'
		attr_reader :graph_original,:sollutions 
		def initialize(graph_original, sollutions)
			@graph_original = graph_original
			@sollutions = sollutions
		end
		def to_s			
			if @sollutions && !@sollutions.empty?	
				response_text = ''
				@sollutions.each { 
					|i|
					response_text += "<#{i.join('>,<')}>, nebo "
				}
				response_text = response_text.slice(0, response_text.size - 7)
				return NEEDED_TO_CONSTRUCT % response_text
			else
				return ALREADY_COMPLETED
			end
		end
	end
end
