class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :author_id, inverse_of: :comments
  belongs_to :post, inverse_of: :comments
  after_save :update_comments_count

  def update_comments_count
    post.increment!(:comments_counter)
  end
end
