require 'net/http'

describe 'Posts:' do

	context 'when there are no posts' do

		it 'it should display a message on the homepage' do
			data = _get('/posts')
			expect(data).to include('There are no posts at present')
		end

		it 'should provide a link to new posts' do
			data = _get('/posts')
			expect(data).to include(_new_post_link)
		end

		it 'a user can access a form to add a new link' do
			data = _get('/posts/new')
			expect(data).to include(_new_post_form)
		end

		it 'a user can create a post from the form' do
			_create_new_post('Test', 'blah blah')
			data = _get('/posts')
			expect(data).to include('Test') && include('blah blah')
		end

	end

	context 'when there are posts' do

		before(:each) { _create_new_post('Test', 'blah blah') }

		it 'a user should be able to see a link delete a post on the homepage' do
			data = _get('/posts')
			expect(data).to include(_delete_post_link)
		end

		it 'a user should be able to delete a post' do
			_get('/posts/delete?id=0')
			data = _get('/posts')
			expect(data).not_to include('Test') && include('blah blah')
		end

		it 'a user should be able to see a link to edit a post on the homepage' do
			data = _get('/posts')
			expect(data).to include(_edit_post_link)
		end

		it 'a user should be able to see a form to edit a post' do

		end

		it 'a user should be able to edit a post' do

		end

	end

	def _get(route)
		Net::HTTP.get URI.parse('http://localhost:8000' + route)
	end

	def _post(route, params)
		uri = URI.parse('http://localhost:8000' + route)
		Net::HTTP.post_form(uri, params)
	end

	def _create_new_post(title, content)
		_post('/posts', { title: title, content: content } )
	end

	def _new_post_link
		"<a href='/posts/new'>New Post</a>"
	end

	def _delete_post_link
		"<a href='/posts/delete?id=0'>Delete Post</a>"
	end

	def _edit_post_link
		"<a href='/posts/edit?id=0'>Edit Post</a>"
	end

	def _new_post_form
		"	<form action='/posts' method='post'>"
	end

	def _edit_post_form
		"	<form action='/posts/edit?=0' method='post'>"
	end

end

