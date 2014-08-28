class HelloWorld < WEBrick::HTTPServlet::AbstractServlet

	def do_GET(request, response)
		
		if request.query['type'] == 'html'
			response.status = 200
			response['Content-Type'] = 'text/plain'
			response.body = 'Hello, World'
		else
			response.status = 200
			response['Content-Type'] = 'text/plain'
			response.body = 'Hello, World'
		end

	end

end