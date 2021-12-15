class Post < ApplicationRecord
  belongs_to :user, foreign_key: :author_id, inverse_of: :posts
  has_many :likes
  has_many :comments
  after_save :update_posts_count

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_count
    user.increment!(:posts_counter)
  end
end
