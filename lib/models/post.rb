class Post

	attr_accessor :title, :content, :created_at

	def initialize(title, content)
		@title = ensure_valid_title(title)
		@content = ensure_valid_content(content)
		@created_at = Time.now
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
		Post.new(title, content)
	end

end