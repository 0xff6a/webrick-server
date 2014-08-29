require 'database'

describe Database do
	
	let(:db) 		{ Database.new('data.csv') 	}
	let(:post) 	{ double Post 							}

	context 'default settings' do

		it 'should have a parent file' do
			expect(db.parent_file).to eq 'data.csv'
		end

	end

	context 'posts:' do

		it 'should hold posts' do
			expect(db.posts).to be_an_instance_of(Array)
		end

		it 'should have no posts initially' do
			expect(db.posts).to be_empty
		end

		it 'posts can be added' do
			db.insert_post(post)
			expect(db.posts).to include(post)
		end

	end

	context 'file backup:' do

		it 'should load data from the parent file' do

		end

		it 'should save data to the parent file' do

		end

	end

end