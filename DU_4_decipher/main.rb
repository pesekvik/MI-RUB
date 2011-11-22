File.open("./input.txt") do |file|
  while contents = file.gets
    contents.to_s().each_byte do |c|
      print "#{(c-7).chr}"
    end
    puts ""
  end
end