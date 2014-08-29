#Libraries
require 'webrick'
require 'erb'
#Database
require_relative 'database'
#Servlets
require_relative 'servlets/root'
require_relative 'servlets/hello_world'
require_relative 'servlets/posts_controller'

class BasicMVCApp

	include WEBrick

	def self.start_webrick(config = {})
		config.update(:Port => 8000)
		config.update(:DocumentRoot => File.expand_path('../../public', __FILE__ ) )
		
		server = HTTPServer.new(config)
		server.mount('/posts', PostsController)
		['INT', 'TERM'].each { |signal| trap(signal) { server.shutdown } }
		server.start
	end

end

# start the server if ruby file executed directly
BasicMVCApp.start_webrick if __FILE__ == $0