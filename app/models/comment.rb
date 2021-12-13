class Comment < ApplicationRecord
  belongs_to :users, foreign_key: :author_id, inverse_of: :comments
  belongs_to :posts, inverse_of: :comments

  def update_comments_count
    post = Post.find(post_id)
    comments_count = Comment.where(post_id: post_id).count
    post.update(comments_counter: comments_count)
  end
end
