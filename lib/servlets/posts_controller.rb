class PostsController < WEBrick::HTTPServlet::AbstractServlet

  include HTTPTools

  def do_GET(request, response)
    
    case request.path
      when '/posts'
        response_for_index(response)
      when '/posts/new'
        response_for_new(response)
      when '/posts/delete'
        action_for_delete(request, response)
      when '/posts/edit'
        response_for_edit(request.query['id'].to_i, response)
      else
        response_for_error(response)
    end

  end

  def do_POST(request, response)
    
    case request.path
      when '/posts'
        action_for_create(request, response)
      when '/posts/edit'
        action_for_edit(request, response)
    end

  end

  def action_for_delete(request, response)
    DATABASE.posts.delete_at(request.query['id'].to_i)
    
    response_for_index(response)
  end

  def action_for_create(request, response)
    params =  _parse_form_data(request.body)
    DATABASE.insert_post(Post.create_post(params))
    
    response_for_index(response)
  end

  def action_for_edit(request, response)
    post = DATABASE.posts[request.query['id'].to_i]
    post.title, post.content = _parse_form_data(request.body)
    
    response_for_index(response)
  end

  def response_for_index(response)
    valid_html_response(render_index, response)
  end

  def response_for_new(response)
    valid_html_response(render_new, response)
  end

  def response_for_edit(id, response)
    valid_html_response(render_edit(DATABASE.posts[id]), response)
  end

  def response_for_error(response)
    html_error_response(response)
  end

  def render_index
    erb_title = 'There are no posts at present'
    erb_link      = 'New Post'
    posts         = DATABASE.posts
    template      = _template_for('posts/index.erb')
    
    html_content  = template.result(binding)
  end

  def render_new
    erb_title     = 'New Post'
    template      = _template_for('posts/new.erb')
    
    html_content  = template.result(binding)
  end

  def render_edit(post)
    erb_title     = 'Edit Post'
    target_post   = post
    template      = _template_for('posts/edit.erb')
    
    html_content  = template.result(binding)
  end

  private

  def _template_for(view)
    ERB.new(File.read(File.expand_path('../../../public/views/'+ view , __FILE__ )))
  end

  def _parse_form_data(raw)
    parsed_data = {}

    raw.split('&').each do |pair|
      key, value        = pair.split('=')
      parsed_data[key]  = value
    end
    
    parsed_data.values.map{ |string| string.gsub('+', ' ')}
  end

end