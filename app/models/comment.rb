class Comment < ApplicationRecord
  belongs_to :users, foreign_key: => :author_id
  belongs_to :posts

  def update_comments_count
    post = Post.find(self.post_id)
    comments_count = Posts.where(id: self.post_id).count
    post.update(comments_count: comments_count)
  end
end
