require 'CSV'

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

	def backup_data
		CSV.open(parent_file, "wb") do |csv|
			posts.each { |post| csv << _to_csv(post) }
		end
	end

	def load_data
		CSV.open(parent_file, "r") do |row|
			insert_post(Post::create_post(row))
		end
	end

	private

	def _to_csv(data)
		data.values
	end

end