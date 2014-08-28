require 'webrick'
require_relative 'root'

class BasicMVCApp

	include WEBrick

	def self.start_webrick(config = {})
		config.update(:Port => 8000)
		config.update(:DocumentRoot => File.expand_path('~/public/html') )
		server = HTTPServer.new(config)
		yield server if block_given?
		server.mount('/', Root)
		['INT', 'TERM'].each { |signal| trap(signal) { server.shutdown } }
		server.start
	end

end

# start the server if ruby file executed directly
BasicMVCApp.start_webrick if __FILE__ == $0