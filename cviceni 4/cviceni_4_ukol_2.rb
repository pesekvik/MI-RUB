class String
  def vowels
    scan(/[aeiou]/i)
  end
end

module Summable
	def sum
		self.inject(:+)
	end
end

class VowelFinder
	include Enumerable
	include Summable
	def initialize(input)
		@input = input;
	end
	def each
		@input.vowels.each { |e| 
			e = yield(e)
		}
	end
end

vf = VowelFinder.new( "the quick brown fox jumped" )
puts(vf.inject(:+)) # => " euiooue "
puts(vf.sum)
