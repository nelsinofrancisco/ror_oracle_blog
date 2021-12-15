class Like < ApplicationRecord
  belongs_to :user, foreign_key: :author_id, inverse_of: :likes
  belongs_to :post, inverse_of: :likes
  after_save :update_likes_count

  private

  def update_likes_count
    post.increment!(:likes_counter)
  end
end
