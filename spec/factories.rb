FactoryBot.define do
  factory :like do
    association :user, factory: :user
    association :post
  end

  factory :user do
    name { 'John Doe' }
    photo { 'sample_photo.jpg' }
    bio { 'Lorem ipsum dolor sit amet.' }
  end

  factory :post do
    association :author, factory: :user
    title { 'Sample Title' }
    text { 'Sample Text' }
  end
end
