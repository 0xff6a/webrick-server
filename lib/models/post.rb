class Post

	attr_accessor :title, :content, :created_at, :id

	def initialize(title, content)
		@title = ensure_valid_title(title)
		@content = ensure_valid_content(content)
		@id = nil
	end

	def ensure_valid_title(title)
		raise ArgumentError, 'posts must have a title' unless title 
		title
	end

	def ensure_valid_content(content)
		raise ArgumentError, 'posts must have content' unless content
		content
	end

	def self.create_post(data)
		title, content = data
		post = Post.new(title, content)
	end

end