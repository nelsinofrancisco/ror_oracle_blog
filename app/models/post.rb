class Post < ApplicationRecord
  belongs_to :user, foreign_key: :author_id, inverse_of: :posts
  has_many :likes
  has_many :comments

  def update_posts_count
    user.update(posts_counter: user.posts.count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
