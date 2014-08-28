class PostsController < WEBrick::HTTPServlet::AbstractServlet

	def do_GET(request, response)
		erb_message = 'There are no posts at present'
		erb_link = 'New Post'
		template = ERB.new(File.read('/Users/foxjerem/MakersAcademy/Webrick-Server/public/views/posts/index.erb'))
		html_content = template.result(binding)
		response.status = 200
		response['Content-Type'] = 'text/html'
		response.body = html_content
	end

end