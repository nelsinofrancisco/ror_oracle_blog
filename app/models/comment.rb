class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :author_id, inverse_of: :comments
  belongs_to :post, inverse_of: :comments
  after_save :update_comments_count
  after_destroy :decrement_comments_count

  private

  def update_comments_count
    post.increment!(:comments_counter)
  end

  def decrement_comments_count
    post.decrement!(:comments_counter)
  end
end
