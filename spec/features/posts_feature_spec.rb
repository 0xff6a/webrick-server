require 'net/http'

describe 'Posts:' do

	context 'when there are no posts' do

		it 'it should display a message on the homepage' do
			data = Net::HTTP.get URI.parse('http://localhost:8000/posts')
			expect(data).to include('There are no posts at present')
		end

	end

end

