class Post

	attr_accessor :title, :content

	def initialize(title, content)
		@title = ensure_valid_title(title)
		@content = ensure_valid_content(content)
	end

	def ensure_valid_title(title)
		raise ArgumentError unless title 
		title
	end

	def ensure_valid_content(content)
		raise ArgumentError unless content
		content
	end

end