require 'database'

describe Database do
	
	let(:db) 		{ Database.new('data.csv') 														}
	let(:post) 	{ double Post, values: ['title', 'content']						}
	let(:csv)		{ double CSV 																					}

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
			row = double :row
			expect(CSV).to receive(:open).with(db.parent_file, 'r').and_yield(row)
			expect(Post).to receive(:create_post)
			expect(db).to receive(:insert_post)
			db.load_data
		end

		it 'should save data to the parent file' do
			db.insert_post(post)
			expect(CSV).to receive(:open).with(db.parent_file, 'wb').and_yield(csv)
			expect(csv).to receive(:<<).with(['title', 'content'])
			db.backup_data
		end

	end

end