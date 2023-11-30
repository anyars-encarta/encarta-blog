# factories.rb
FactoryBot.define do
  factory :post do
    title { 'Sample Post' }
    text { 'Lorem ipsum...' }
    comments_counter { rand(1..10) }
    likes_counter { rand(1..10) }
    association :author, factory: :user
  end

  factory :like do
    association :user, factory: :user
    association :post
  end

  factory :user do
    name { 'John Doe' }
    photo { 'sample_photo.jpg' }
    bio { 'Lorem ipsum dolor sit amet.' }
    posts_counter { rand(1..10) }
  end

  factory :comment do
    text { 'This is a comment body.' }
    association :user
    association :post
  end
end
