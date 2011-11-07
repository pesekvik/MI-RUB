#!/usr/bin/env ruby
module Anagram
	class Finder
		def initialize(dictionary)
			if dictionary.kind_of?(Array)
				@dictionary = dictionary
			else
				@dictionary = Array.new
				File.foreach(dictionary) do |line|
					@dictionary.push line
				end
			end
			@anagrams = Array.new				
		end
		def signature_of(word)
			word.unpack("c*").sort.pack("c*")
		end
		def find(argument_word)
			@anagrams.clear
			signatures = Hash.new
 
			@dictionary.each do |line|
				word = line.chomp
				signature = signature_of(word)
				(signatures[signature] ||= []) << word
			end
			
			signature = signature_of(argument_word)
			if signatures[signature]
				@anagrams.push(signatures[signature])
			end			
			return @anagrams
		end
	end
end
