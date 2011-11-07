# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'anagram/finder'

class FinderTest < Test::Unit::TestCase
  def test_finder
		@dictionary = Array.[]('teaching', 'cheating', 'coed')
		finder = Anagram::Finder.new(@dictionary)
		found =  finder.find('teaching')
		assert_not_empty(found, "Did not find anagram where exists") 
		assert_empty(finder.find('nonexistant'), "Finder should not have found anythings for nonexistant")
  end
end
