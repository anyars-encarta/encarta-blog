class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_likes_counter(post)
    post.likes_counter = post.likes_counter.to_i + 1
    post.save!
  end
end
