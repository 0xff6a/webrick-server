require 'database'

describe Database do
	
	let(:db) 		{ Database.new('data_test.csv') 																								}
	let(:post) 	{ double Post, :title => 'title', :content => 'content', :id= => 0, :id => 0		}
	let(:csv)		{ double CSV 																																		}
	let(:row)		{ double :row, :[] => nil																																		}

	before(:each) do
		allow(DATABASE).to receive(:load_data)
		allow(DATABASE).to receive(:backup_data)
	end

	context 'default settings' do

		it 'should have a parent file' do
			expect(db.parent_file).to eq 'data_test.csv'
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

		it 'adds a unique id to a post when it is added' do
			expect(post).to receive(:id=).with(0)
			db.insert_post(post)
		end

	end

	context 'file backup:' do

		it 'should load data from the parent file' do
			expect(CSV).to receive(:foreach).with(db.parent_file, 'r').and_yield(row)
			expect(Post).to receive(:create_post).with(row[1,2])
			expect(db).to receive(:insert_post)
			db.load_data
		end

		it 'should save data to the parent file' do
			db.insert_post(post)
			expect(CSV).to receive(:open).with(db.parent_file, 'wb').and_yield(csv)
			expect(csv).to receive(:<<).with([0,'title', 'content'])
			db.backup_data
		end

		it 'can clear the backup' do
			expect(CSV).to receive(:foreach).with(db.parent_file, 'r').and_yield(row)
			expect(row).to receive(:clear)
			db.clear_data
		end

	end

end