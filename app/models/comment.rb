class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # update the comments counter for a post by 1
  def update_comments_counter(post)
    post.comments_counter = post.comments_counter.to_i + 1
    post.save!
  end
end
