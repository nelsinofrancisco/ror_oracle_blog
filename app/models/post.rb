class Post < ApplicationRecord
  belongs_to :users, foreign_key: => :author_id
  has_many :likes
  has_many :comments


  def update_posts_count
    user = User.find(self.author_id)
    posts_count = Posts.where(author_id: self.author_id).count
    user.update(posts_counter: posts_count)
  end

  def recent_comments
    comments = Comment.where(post_id: self.id)
    comments.order(created_at: :desc).limit(5)
  end
end
