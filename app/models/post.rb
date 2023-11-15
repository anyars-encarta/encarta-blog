class Post < ApplicationRecord
    belongs_to :user
  
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
  
    validates :title, presence: true
    validates :text, presence: true

    # author_id column in the posts table is a foreign key for the users table.
  belongs_to :author, class_name: "User", foreign_key: "author_id"
end