require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'invalid conditions' do

    it 'title should be present' do
      user = User.create(name: 'Jbird', photo: 'some_photo', bio: 'some_bio', posts_counter: 0 )
      post = Post.create(title: "   ", text: 'something good', comments_counter: 0, likes_counter: 0, author_id: user.id)

      expect(post).to_not be_valid
    end

    it 'title must not exced 250' do
      user = User.create(name: 'Jbird', photo: 'some_photo', bio: 'some_bio', posts_counter: 0 )
      post = Post.create(title: "#{'a' * 300}", text: 'something good', comments_counter: 0, likes_counter: 0, author_id: user.id)
      expect(post).to_not be_valid
    end
    
    it 'comments_counter must be a integer' do
      user = User.create(name: 'Jbird', photo: 'some_photo', bio: 'some_bio', posts_counter: 0 )
      post = Post.create(title: "Test", text: 'something good', comments_counter: 'a', likes_counter: 0, author_id: user.id)
      expect(post).to_not be_valid
    end

    it 'comments_counter must be a integer greater than 0 or equal to 0' do 
      user = User.create(name: 'Jbird', photo: 'some_photo', bio: 'some_bio', posts_counter: 0 )
      post = Post.create(title: "Test", text: 'something good', comments_counter: -1, likes_counter: 0, author_id: user.id)
      expect(post).to_not be_valid
    end

    it 'likes_counter must be a integer' do
      user = User.create(name: 'Jbird', photo: 'some_photo', bio: 'some_bio', posts_counter: 0 )
      post = Post.create(title: "Test", text: 'something good', comments_counter: 0, likes_counter: 'a', author_id: user.id)
      expect(post).to_not be_valid
    end

    it 'likes_counter must be a integer greater than 0 or equal to 0' do 
      user = User.create(name: 'Jbird', photo: 'some_photo', bio: 'some_bio', posts_counter: 0 )
      post = Post.create(title: "Test", text: 'something good', comments_counter: 0, likes_counter: -1, author_id: user.id)
      expect(post).to_not be_valid
    end
  end

  describe 'recent_comments' do

    it 'post.recents_comments => should retrieve 5 most recents comments' do
      user = User.create(name: 'Jbird', photo: 'some_photo', bio: 'some_bio', posts_counter: 0 )
      post = Post.create(title: "Test", text: 'something good', comments_counter: 0, likes_counter: 0, author_id: user.id)
      comments = []
      for i in 1..10 do
        comments << Comment.create(text: "Test", author_id: user.id, post_id: post.id)
      end

      expect(Post.first.recent_comments.length).to eq(5)
    end

    it 'post.recents_comments => should not retrieve all comments' do
      user = User.create(name: 'Jbird', photo: 'some_photo', bio: 'some_bio', posts_counter: 0 )
      post = Post.create(title: "Test", text: 'something good', comments_counter: 0, likes_counter: 0, author_id: user.id)
      comments = []
      for i in 1..10 do
        comments << Comment.create(text: "Test", author_id: user.id, post_id: post.id)
      end

      expect(Post.first.recent_comments.length).not_to eql(comments)
    end

    it 'post should increment => user.posts_counter' do
      user = User.create(name: 'Jbird', photo: 'some_photo', bio: 'some_bio', posts_counter: 0 )
      post = Post.create(title: "Test", text: 'something good', comments_counter: 0, likes_counter: 0, author_id: user.id)

      expect(User.first.posts_counter).to eq(1)
    end
  end
end
