module HTTPTools
  
  def respond_with(status, content_type, body, response)
    response.status = status
    response['Content-Type'] = content_type
    response.body = body
  end

  def valid_html_response(body, response)
    respond_with(200, 'text/html', body, response)
  end

  def html_error_response(response)
    respond_with(404, 'text/html','Something has gone wrong', response)
  end

end
