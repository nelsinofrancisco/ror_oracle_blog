class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id, inverse_of: :users
  has_many :likes, foreign_key: :author_id, inverse_of: :users
  has_many :comments, foreign_key: :author_id, inverse_of: :users

  def recent_posts
    posts = Post.where(author_id: id)
    posts.order(created_at: :desc).limit(3)
  end
end
