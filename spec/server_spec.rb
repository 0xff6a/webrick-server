feature 'Simple server:' do
	
	context 'handling a get request' do

		it 'can respond to a get request with Hello World' do
			visit '/'
			expect(page).to have_content('Hello world')
		end

	end

end