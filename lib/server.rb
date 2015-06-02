#Libraries
require 'webrick'
require 'erb'
#Helpers
Dir[File.join(__dir__, 'servlet_helpers', '*.rb')].each {|file| require file }
#Servlets
Dir[File.join(__dir__, 'servlets', '*.rb')].each {|file| require file }
#Models
Dir[File.join(__dir__, 'models', '*.rb')].each {|file| require file }
#Database
require_relative 'database'

DATA_FILE = File.expand_path("../../data.csv", __FILE__ ) 
DATABASE 	= Database.new(DATA_FILE)

class BasicMVCApp

	include WEBrick

	def self.run(config = {})
		DATABASE.load_data
		BasicMVCApp.start_webrick(config)
	end

	def self.start_webrick(config)
		config.update(:Port => 8000)
		config.update(:DocumentRoot => File.expand_path('../../public', __FILE__ ) )
		
		server = HTTPServer.new(config)
		server.mount('/posts/', PostsController)
		['INT', 'TERM'].each { |signal| trap(signal) { BasicMVCApp.shutdown(server) } }
		
		server.start
	end

	def self.shutdown(server)
		DATABASE.backup_data
		server.shutdown 
	end

end

# start the server if ruby file executed directly
BasicMVCApp.run if __FILE__ == $0