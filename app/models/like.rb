class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # update the likes counter for a post by 1
  def update_likes_counter(post)
    post.likes_counter = post.likes_counter.to_i + 1
    post.save!
  end
end
