class PostsController < WEBrick::HTTPServlet::AbstractServlet

	def do_GET(request, response)
		
		case request.path
			when '/posts'
				create_response_for_index(response)
			when '/posts/new'
				create_response_for_new(response)
		end

	end

	def create_response_for_index(response)
		response.status = 200
		response['Content-Type'] = 'text/html'
		response.body = render_index
	end

	def create_response_for_new(response)
		response.status = 200
		response['Content-Type'] = 'text/html'
		response.body = render_new
	end

	def render_index
		erb_title = 'There are no posts at present'
		erb_link = 'New Post'
		template = _template_for('index.erb')
		html_content = template.result(binding)
	end

	def render_new
		erb_title = 'New Post'
		template = _template_for('new.erb')
		html_content = template.result(binding)
	end

	private

	def _template_for(view)
		ERB.new(File.read(File.expand_path('../../../public/views/posts/'+ view , __FILE__ )))
	end

end