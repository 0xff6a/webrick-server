class PostsController < WEBrick::HTTPServlet::AbstractServlet

	def do_GET(request, response)
		case request.path
			when '/posts'
				response.status = 200
				response['Content-Type'] = 'text/html'
				response.body = render_index
			when '/posts/new'
				render_new
		end
	end

	def render_index
		erb_message = 'There are no posts at present'
		erb_link = 'New Post'
		template = ERB.new(File.read('/Users/foxjerem/MakersAcademy/Webrick-Server/public/views/posts/index.erb'))
		html_content = template.result(binding)
	end

	def render_new

	end

end