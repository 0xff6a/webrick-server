require 'webrick'

class BasicMVCApp

	def self.run
		root = File.expand_path '~/public/html'
		server = WEBrick::HTTPServer.new :Port => 8000, :DocumentRoot => root

		trap 'INT' do
			server.shutdown
		end

		server.mount_proc '/' do |request, response|
			response.body = 'Hello World'
		end

		server.start
	end

	def self.call(environment = {})
		[ '200', {"Content-Type" => "text/plain"}, "Hello world"]
	end

end

# start the server if ruby file executed directly
BasicMVCApp.run if 'lib/server.rb' == $0