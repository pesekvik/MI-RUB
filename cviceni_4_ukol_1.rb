require 'gserver'

class LogServer < GServer
  def initialize(port=10001, *args)
    super(port, *args)
  end
  def serve(io)
		#		logFile = .open( "input.txt" , "r" )
		line_count =rand(4) + 1;
		iter = 1;
		File.readlines("input.txt").reverse_each{
			|f|	
			io.puts(f)
			if(iter == line_count)
				break;		
			end
			iter+=1
		} 
  end
end



# Run the server with logging enabled (it's a separate thread).
server = LogServer.new
server.audit = true                  # Turn logging on.
server.start

require 'socket'      # Sockets are in standard library

hostname = 'localhost'
port = 10001

s = TCPSocket.open(hostname, port)

while line = s.gets   # Read lines from the socket
  puts line.chop      # And print with platform line terminator
end
s.close  

# Shut the server down gracefully.
server.shutdown
