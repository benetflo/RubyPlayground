require 'socket'

IP = "0.0.0.0" # allow all
PORT = 12345
BYTES_CAP = 1024

begin
	server = TCPServer.new(IP,PORT)
	puts "Server is listening on port #{PORT}"


	loop do
		begin
			client = server.accept
			puts "Connection from #{client}"
			msg_from_client = client.read(BYTES_CAP)
			if msg_from_client
				puts "Message from client #{msg_from_client.inspect}"
			else
				puts "No message was recieved from client"
			end

		rescue => e
			puts "ERROR: #{e.message}"
		ensure
			client.close if client
		end
rescue => e
	puts "ERROR: #{e.message}"
ensure
	server.close if server
end


#TODO: Add threading
