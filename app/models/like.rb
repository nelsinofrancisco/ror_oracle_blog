class Like < ApplicationRecord
  belongs_to :users, foreign_key: :author_id, inverse_of: :likes
  belongs_to :posts, inverse_of: :likes

  def update_likes_count
    post = Post.find(post_id)
    likes_count = Like.where(post_id: post_id).count
    post.update(likes_counter: likes_count)
  end
end
