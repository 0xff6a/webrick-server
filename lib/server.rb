require 'webrick'
require_relative 'servlets/root'
require_relative 'servlets/hello_world'

class BasicMVCApp

	include WEBrick

	def self.start_webrick(config = {})
		config.update(:Port => 8000)
		config.update(:DocumentRoot => File.expand_path('~/MakersAcademy/Webrick-Server/public') )
		server = HTTPServer.new(config)
		yield server if block_given?
		# server.mount('/hello_world', HelloWorld)
		# server.mount('/hello_world', HTTPServlet::FileHandler)
		['INT', 'TERM'].each { |signal| trap(signal) { server.shutdown } }
		server.start
	end

end

# start the server if ruby file executed directly
BasicMVCApp.start_webrick if __FILE__ == $0