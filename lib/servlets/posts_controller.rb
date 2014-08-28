class PostsController < WEBrick::HTTPServlet::AbstractServlet

	def do_GET(request, response)
		case request.path
			when '/posts'
				response.status = 200
				response['Content-Type'] = 'text/html'
				response.body = render_index
			when '/posts/new'
				response.status = 200
				response['Content-Type'] = 'text/html'
				response.body = render_new
		end

	end

	def render_index
		erb_title = 'There are no posts at present'
		erb_link = 'New Post'
		template = ERB.new(File.read(File.expand_path('../../../public/views/posts/index.erb', __FILE__ )))
		html_content = template.result(binding)
	end

	def render_new
		erb_title = 'New Post'
		template = ERB.new(File.read(File.expand_path('../../../public/views/posts/new.erb', __FILE__ )))
		html_content = template.result(binding)
	end

end