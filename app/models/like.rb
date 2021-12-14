class Like < ApplicationRecord
  belongs_to :user, foreign_key: :author_id, inverse_of: :likes
  belongs_to :post, inverse_of: :likes

  def update_likes_count
    post.update(likes_counter: post.likes.count)
  end
end
