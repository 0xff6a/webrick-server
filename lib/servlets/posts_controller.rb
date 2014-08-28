class PostsController < WEBrick::HTTPServlet::AbstractServlet

	def do_GET(request, response)
			response.status = 200
			response['Content-Type'] = 'text/plain'
			response.body = 'There are no posts at present'
	end

end