FactoryBot.define do
  # factory :post do
  #   # Define your post attributes here
  #   title { 'Sample Post' }
  #   content { 'Lorem ipsum...' }
  #   author
  # end

  factory :post do
    association :author, factory: :user
    title { 'Sample Post' }
    text { 'Lorem ipsum...' }
    author
  end

  factory :like do
    association :user, factory: :user
    association :post
  end

  factory :user do
    name { 'John Doe' }
    photo { 'sample_photo.jpg' }
    bio { 'Lorem ipsum dolor sit amet.' }
  end
end
