class Like < ApplicationRecord
  belongs_to :users, foreign_key: => :author_id
  belongs_to :posts

  def update_likes_count
    post = Post.find(self.post_id)
    likes_count = Like.where(post_id: self.post_id).count
    post.update(likes_count: likes_count)
  end
end
