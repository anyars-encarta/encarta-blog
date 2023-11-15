class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, through: :posts
    has_many :likes, through: :posts
  
    validates :name, presence: true
    validates :photo, presence: true
    validates :bio, presence: true
end