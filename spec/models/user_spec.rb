require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Jbird', photo: 'some_photo', bio: 'some_bio', posts_counter: 0) }

  describe 'invalid conditions' do
    before :each do
      subject.save
    end

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'posts_counter must be a integer' do
      subject.posts_counter = 'sadasdsa'
      expect(subject).to_not be_valid
    end

    it 'posts_counter must be a integer greater than 0 or equal to 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe 'valid conditions' do
    before :each do
      subject.save
    end

    it 'name should be present' do
      subject.name = 'Alfredo'
      expect(subject).to be_valid
    end

    it 'posts_counter must be a integer' do
      subject.posts_counter = 1
      expect(subject).to be_valid
    end

    it 'posts_counter must be a integer greater than 0 or equal to 0' do
      subject.posts_counter = 0
      expect(subject).to be_valid
    end
  end

  describe 'recent_posts' do
    it 'user.recents_posts => should retrieve 5 most recents posts' do
      user = User.create(name: 'Jbird', photo: 'some_photo', bio: 'some_bio', posts_counter: 0)
      posts = []
      (1..10).each do |_i|
        posts << Post.create(title: 'Post #', text: 'something good', comments_counter: 0, likes_counter: 0,
                             author_id: user.id)
      end

      expect(User.first.recent_posts.length).to eq(3)
    end

    it 'user.recent_posts => should not retrieve all posts' do
      user = User.create(name: 'Jbird', photo: 'some_photo', bio: 'some_bio', posts_counter: 0)
      posts = []
      (1..10).each do |_i|
        posts << Post.create(title: 'Post #', text: 'something good', comments_counter: 0, likes_counter: 0,
                             author_id: user.id)
      end

      expect(User.first.recent_posts.length).not_to eql(posts)
    end
  end
end
