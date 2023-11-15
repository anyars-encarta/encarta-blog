class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true
  validates :text, presence: true

  # author_id column in the posts table is a foreign key for the users table.
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  # update the posts counter for a user by 1
  def update_posts_counter(user)
    user.posts_counter = user.posts_counter.to_i + 1
    user.save!
  end

  #  return 5 most recent comments for a given post
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
