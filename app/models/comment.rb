class Comment < ApplicationRecord
  belongs_to :users, foreign_key: => :author_id
  belongs_to :posts
end
