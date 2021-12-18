require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'like should increment => post.likes_counter' do
    user = User.create(name: 'Jbird', photo: 'some_photo', bio: 'some_bio', posts_counter: 0)
    post = Post.create(title: 'Test', text: 'something good', comments_counter: 0, likes_counter: 0, author_id: user.id)
    Like.create(author_id: user.id, post_id: post.id)

    expect(Post.find_by_id(post.id).likes_counter).to eq(1)
  end
end
