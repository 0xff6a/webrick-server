class PostsController < WEBrick::HTTPServlet::AbstractServlet

	def do_GET(request, response)
		
		case request.path
			when '/posts'
				response_for_index(response)
			when '/posts/new'
				response_for_new(response)
			when '/posts/delete'
				DATABASE.posts.delete_at(request.query['id'].to_i)
				response_for_index
			when '/posts/edit'
				response_for_edit(request.query['id'].to_i, response)
			else
				response_for_error(response)
		end

	end

	def do_POST(request, response)
		
		case request.path
			when '/posts'
				params =  _parse_form_data(request.body)
				DATABASE.insert_post(Post.create_post(params))
				response_for_index(response)
		end

	end

	def response_for_index(response)
		response.status = 200
		response['Content-Type'] = 'text/html'
		response.body = render_index
	end

	def response_for_new(response)
		response.status = 200
		response['Content-Type'] = 'text/html'
		response.body = render_new
	end

	def response_for_edit(id, response)
		response.status = 200
		response['Content-Type'] = 'text/html'
		response.body = render_edit(DATABASE.posts[id])
	end

	def response_for_error(response)
		response.status = 404
		response['Content-Type'] = 'text/html'
		response.body = 'Something has gone wrong'
	end

	def render_index
		erb_title = 'There are no posts at present'
		erb_link = 'New Post'
		posts = DATABASE.posts
		template = _template_for('posts/index.erb')
		html_content = template.result(binding)
	end

	def render_new
		erb_title = 'New Post'
		template = _template_for('posts/new.erb')
		html_content = template.result(binding)
	end

	def render_edit(post)
		erb_title = 'Edit Post'
		target_post = post
		template = _template_for('posts/new.erb')
		html_content = template.result(binding)
	end

	private

	def _template_for(view)
		ERB.new(File.read(File.expand_path('../../../public/views/'+ view , __FILE__ )))
	end

	def _parse_form_data(raw)
		parsed_data = {}
		raw.split('&').each do |pair|
			key, value = pair.split('=')
			parsed_data[key] = value
		end
		parsed_data.values.map{ |string| string.gsub('+', ' ')}
	end

end