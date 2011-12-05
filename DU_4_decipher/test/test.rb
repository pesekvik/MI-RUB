# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'main'

class DecipherTest < Test::Unit::TestCase
	def test_decipher
		decipher = Decipher.new
		assert_equal("*CDC is the trademark of the Control Data Corporation.\u0003\r\n*IBM is a trademark of the International Business Machine Corporation.\u0003\r\n*DEC is the trademark of the Digital Equipment Corporation.\r\n", 
			decipher.decipher("./test/input.txt")) 
  end
end
