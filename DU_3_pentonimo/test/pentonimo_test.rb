# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'main'

class Pentonimo_test < Test::Unit::TestCase
  def test_solver
		solver = Solver.new(8, 3, 1, 3)
    assert_equal("Succesfully filled\r\nitem: [0,0] [1,0] [2,0] \r\nitem: [0,1] [1,1] [2,1] \r\nitem: [0,2] [1,2] [2,2] \r\nitem: [0,3] [1,3] [2,3] \r\nitem: [0,4] [1,4] [2,4] \r\nitem: [0,5] [1,5] [2,5] \r\nitem: [0,6] [1,6] [2,6] \r\nitem: [0,7] [1,7] [2,7] \r\n",
			solver.solve)
		solver = Solver.new(4, 1, 1, 3)
    assert_equal("No solution found",
			solver.solve)
	end
end
