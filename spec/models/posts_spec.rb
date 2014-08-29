require 'models/post'

describe Post do
	
	let(:title) 	{ 'Test Post' 							}
	let(:content)	{ '...text...'							}
	let(:post)		{ Post.new(title, content)	}

	it 'should have a title' do
		expect(post.title).to eq('Test Post')
	end

	it 'should have content' do
		expect(post.content).to eq('...text...')
	end

	it 'should not be created without a title' do
		expect { Post.new(nil, content) }.to raise_error(ArgumentError, 'posts must have a title')
	end

	it 'should not be created without any content' do
		expect { Post.new(title, nil) }.to raise_error(ArgumentError, 'posts must have content')
	end

	it 'should have a timestamp' do
		expect(post.created_at).to be_within(1).of Time.now
	end

end