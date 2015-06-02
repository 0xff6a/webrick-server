require 'CSV'
require_relative 'models/post'

class Database

	attr_accessor :posts, :parent_file

	def initialize(parent_file)
		@parent_file 	= parent_file
		@posts 				= []
	end

	def insert_post(post)
		post.id = posts.length
		posts << post
	end

	def backup_data
		clear_data
		CSV.open(parent_file, "wb") do |csv|
			posts.each { |post| csv << _to_csv(post) }
		end
	end

	def load_data
		CSV.foreach(parent_file, "r") do |row|
			insert_post(Post.create_post(row[1,2])) if row
		end
	end

	def clear_data
		CSV.foreach(parent_file, "r") do |row|
			row.clear
		end
	end

	private

	def _to_csv(post)
		[post.id, post.title, post.content]
	end

end