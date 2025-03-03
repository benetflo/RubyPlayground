require 'socket'
require 'thread'


IP = "0.0.0.0" # allow all
PORT = 12345
BYTES_CAP = 1024

begin
	server = TCPServer.new(IP,PORT)
	puts "Server is listening on port #{PORT}"


	loop do

		client = server.accept
		puts "[#{Time.now}]: Connection from #{client.peeraddr[2]}" # client.peeraddr returns info about client connection as: array[ADDRESS_FAMILY,PORT, IP, SAME IP]. peeraddr[2] == Clients IP-address 
		Thread.new(client) do |conn| # create new thread for each connection
			begin
				msg_from_client = conn.read(BYTES_CAP) # read data from current connection
				if msg_from_client
					puts "Message from client #{msg_from_client.inspect}"
					conn.puts "Server sucessfully recieved message"
				else
					puts "No message was recieved from client"
				end

			rescue => e
				puts "ERROR: #{e.message}"
			ensure
				conn.close # close current connection
			end
		end
	end
rescue => e
	puts "ERROR: #{e.message}"
ensure
	server.close if server
end



