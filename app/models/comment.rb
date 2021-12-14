class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :author_id, inverse_of: :comments
  belongs_to :post, inverse_of: :comments

  def update_comments_count
    post.update(comments_counter: post.comments.count)
  end
end
