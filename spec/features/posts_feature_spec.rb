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

	end

	def _new_post_link
		"<a href='/posts/new'>New Post</a>"
	end

end

