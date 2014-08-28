require 'net/http'

describe 'Simple server:' do
	
	context 'handling a get request' do

		before(:each) do
			@server_thread = Thread.new { BasicMVCApp.start_webrick }
		end

		after(:each) do
			@server_thread.exit
		end

		it 'can respond to a get request with Hello World' do
				data = Net::HTTP.get URI.parse('http://localhost:8000')
				expect(data).to include('Hello, World')
		end

	end

end