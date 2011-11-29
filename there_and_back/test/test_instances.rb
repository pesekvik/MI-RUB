

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'lib/there_and_back/runner'

class Example_1 < Test::Unit::TestCase
	def setup
    @runner = ThereAndBack::Runner.new
  end 
	def array_equals(arr1, arr2)
		return false if arr1.size != arr2.size
			arr1.each_index {  
				|i|  
				return false if arr1[i] != arr2[i]
			}
			return true
	end
  def test_1
		arr = [[[4, 5], [5,1]]]
		assert_block("Wrong sollution") {
			edges = @runner.run(['test/test_input1.txt']).edge_array	
			return array_equals(arr, edges)
		}
  end
  def test_2
		assert_equal([[]],@runner.run(['test/test_input2.txt']).edge_array, "Wrong sollution")
	end
	def test_3
		assert_block("Wrong sollution") {
			edges = @runner.run(['test/test_input3.txt']).edge_array	
			return array_equals([[2,1][3,1]], edges)
		}
	end
end
