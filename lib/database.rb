class Database

	attr_reader 	:parent_file
	attr_accessor :posts

	def initialize(parent_file)
		@parent_file = parent_file
		@posts = []
	end

	def insert_post(post)
		posts << post
	end

end