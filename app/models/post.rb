class Post < ApplicationRecord
  belongs_to :user, foreign_key: :author_id, inverse_of: :posts
  has_many :likes
  has_many :comments
  after_save :update_posts_count
  after_destroy :decrement_posts_count

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_count
    user.increment!(:posts_counter)
  end

  def decrement_posts_count
    user.decrement!(:posts_counter)
  end
end
