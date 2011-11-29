# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'lib/there_and_back/runner'

class Input_test < Test::Unit::TestCase
	def setup		
    @runner = ThereAndBack::Runner.new
	end
  def test_input 			
    assert_raise(ArgumentError){	
			@runner.run([])
		}
		assert_raise(ArgumentError){	
			@runner.run(['bleblablei'])	
		}
  end
end
