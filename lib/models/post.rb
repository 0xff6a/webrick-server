class Post

  attr_accessor :title, :content, :id

  def initialize(title, content)
    @title = title
    @content = content
    @id = nil
    valid?
  end

  def valid?
    raise ArgumentError, 'posts must have a title' unless title 
    raise ArgumentError, 'posts must have content' unless content
  end

  def self.create_post(data)
    title, content = data
    post = Post.new(title, content)
  end

end