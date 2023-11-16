class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  
  validates :text, presence: true

  # Title must not be blank
  validates :title, presence: true

  # Title must not exceed 250 characters
  validates :title, length: { maximum: 250 }

  # CommentsCounter must be an integer greater than or equal to zero.
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  # LikesCounter must be an integer greater than or equal to zero.
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

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
