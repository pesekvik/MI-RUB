
#words=Fiber.new do
#	File.foreach("testfile")do|line|
#		line.scan(/\w+/)do|word|
#			Fiber.yieldword.downcase
#		end
#	end
#end
#counts=Hash.new(0)
#while word=words.resume
#	counts[word]+=1
#end
#counts.keys.sort.each{|k|
#	print"#{k}:#{counts[k]}"
#}

require 'thread'
require "set"

queue = Queue.new

word_producer = Thread.new do
#	puts "word_producer starts"
	File.foreach("testfile") do |line|
		line.scan(/\w+/)do|word|
			queue << word;
			sleep(rand);
#			puts "#{word} read"
		end
	end
	#	puts "word_producer ends"
end

word_consumer = Thread.new do
#	puts "word_consumer starts"
counts=Hash.new(0)
while queue.empty? || word_producer.alive?
		if !word_producer.alive?
			break;
		end
		sleep(rand);
		while !queue.empty?
			value = queue.pop		
			counts[value]+=1
#			puts "accepted #{value}"		
		end
	end
counts.keys.sort.each{|k|
	print"#{k}:#{counts[k]}"
}
#	puts "word_consumer ends"
end

word_consumer.join

#consumer.join