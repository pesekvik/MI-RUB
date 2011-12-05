# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'runner'

class InputAdder
  def initialize(strings)
    @strings = strings
  end

  def gets
    next_string = @strings.shift
    next_string
  end

  def self.put_fake_input(strings)
    $stdin = new(strings)
    yield
  ensure
    $stdin = STDIN
  end
end


class MinimalCoverageTest < Test::Unit::TestCase
	def test_zero
		InputAdder.put_fake_input([1, "", 2, "1 1", "2 2", "0 0"]) do
			runner = Coverage::Runner.new
			assert_equal("0\n",runner.run)			 
		end
	end
	def test_cases_counter
		InputAdder.put_fake_input([2, "", 1, "-1 0", "-5 -3", "2 5","0 0",
			"","1","-1 0", "0 1", "0 0" ]) do
			runner = Coverage::Runner.new
			assert_equal("0\n1\n0 1\n",runner.run)			 
		end
	end
end

