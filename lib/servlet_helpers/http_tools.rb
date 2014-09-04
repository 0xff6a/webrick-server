module HTTPTools
	
	def respond_with(status, content_type, body, response)
		response.status = status
		response['Content-Type'] = content_type
		response.body = body
	end

	def send_html_response(body, response)
		respond_with(200, 'text/html', body, response)
	end

end
