class Root < WEBrick::HTTPServlet::AbstractServlet

	def do_GET(request, response)
		respond_with(200, 'text/plain', 'Hello, World', response)
	end

end

