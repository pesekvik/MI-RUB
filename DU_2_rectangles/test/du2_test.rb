$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'square'
require 'solver'

class Du2Test < Test::Unit::TestCase	
	def test_overlap_1
		squares = [Rectangles::Square.new(0.0, 0.0, 4), Rectangles::Square.new(2.0, 2.0, 2)]
		solver = Rectangles::Solver.new(squares)
		assert_equal(19, solver.overlap_area)
  end
	def test_overlap_2
		squares = [Rectangles::Square.new(0.000, 0.000e-3, 4.0), Rectangles::Square.new(-2, -2e0, 2.0e+0)]
		solver = Rectangles::Solver.new(squares)
		assert_equal(19, solver.overlap_area)
  end
  def test_not_overlaping
		squares = [Rectangles::Square.new(-10e20, 3e-2, 5.23), Rectangles::Square.new(4.345643225, +3e100, -1)]
		solver = Rectangles::Solver.new(squares)
		assert_equal(false, solver.is_overlaping)
  end

end
