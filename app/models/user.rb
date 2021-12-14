class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id, inverse_of: :user
  has_many :likes, foreign_key: :author_id, inverse_of: :user
  has_many :comments, foreign_key: :author_id, inverse_of: :user

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
