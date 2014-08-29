require 'net/http'

describe 'Posts:' do

	context 'when there are no posts' do

		it 'it should display a message on the homepage' do
			data = Net::HTTP.get URI.parse('http://localhost:8000/posts')
			expect(data).to include('There are no posts at present')
		end

		it 'should provide a link to new posts' do
			data = Net::HTTP.get URI.parse('http://localhost:8000/posts')
			expect(data).to include(_new_post_link)
		end

		it 'a user can access a form to add a new link' do
			data = Net::HTTP.get URI.parse('http://localhost:8000/posts/new')
			expect(data).to include(_new_post_form)
		end

		it 'a user can create a post from the form' do
			params = { title: 'Test', content: '...blah...' }
			uri = URI.parse('http://localhost:8000/posts')
			Net::HTTP.post_form(uri, params)
			data = Net::HTTP.get URI.parse('http://localhost:8000/posts')
			expect(data).to include('Test') && include('...blah...')
		end

	end

	def _new_post_link
		"<a href='/posts/new'>New Post</a>"
	end

	def _new_post_form
		"	<form action='/posts' method='post'>"
	end

end

