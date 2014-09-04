class HelloWorld < WEBrick::HTTPServlet::AbstractServlet

	def do_GET(request, response)
		
		if request.query['type'] == 'html'
			valid_html_response('Hello, World', response)
		else
			respond_with(200, 'text/plain', 'Hello, World', response)
		end

	end

end