FactoryBot.define do
  factory :like do
    association :user # This will associate the like with a user
    association :post
    # other attributes for the like
  end

  factory :user do
    # Define user attributes as needed for your tests
    name { 'John Doe' }
    photo { 'sample_photo.jpg' }
    bio { 'Lorem ipsum dolor sit amet.' }
    # Add other attributes as needed
  end

  factory :post do
    association :author, factory: :user # Make sure to change the association name if it's different
    title { 'Sample Title' }
    text { 'Sample Text' }
    # Add other attributes as needed
  end
end
