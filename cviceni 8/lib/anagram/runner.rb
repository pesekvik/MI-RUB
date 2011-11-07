#!/usr/bin/env ruby
module Anagram
	class Runner
		def initialize(arguments)
			@arguments = arguments
		end
		def run
			require_relative 'options'
			options = Anagram::Options.new
			options.parse(@arguments)
			require_relative 'finder'
			finder = Anagram::Finder.new(options.dictionary)
			
			@arguments.each do |word|
				found = finder.find(word)
				if found.empty?
					puts "No anagrams of #{word} in #{options.dictionary}"
				else
					found.each { |found_word|  
					puts "Anagrams of #{word}: #{found_word.join(', ')}"
					}
				end	
			end
		end
	end
end