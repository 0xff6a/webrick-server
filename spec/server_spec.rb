require 'net/http'

describe 'Simple server:' do

	context 'handling a get request' do

		it 'can respond to a get request with Hello World' do
			data = Net::HTTP.get URI.parse('http://localhost:8000/hello_world.txt')
			expect(data).to include('Hello, World')
		end

		it 'can respond to a get request with an html file' do
			data = Net::HTTP.get URI.parse('http://localhost:8000/hello_world.html')
			html = File.open('public/hello_world.html', 'r'){ |file| file.read }
			expect(data).to eq html
		end

		it 'can respond with a processed erb file' do
			data = Net::HTTP.get URI.parse('http://localhost:8000/greeting.rhtml?text=not_hello_world')
			expect(data).to eq 'Not Hello World'
		end	

	end

end