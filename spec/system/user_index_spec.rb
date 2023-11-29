# user_index_spec.rb

require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
  before do
    # Assuming @users is populated with test data or using FactoryBot
    @users = FactoryBot.create_list(:user, 3)
    visit users_path
  end

  scenario 'displays user information' do
    within '.users' do
      @users.each do |user|
        expect(page).to have_css('.user-name', text: user.name)
        expect(page).to have_css("img[src='#{user.photo}'][alt='#{user.name}']")
        expect(page).to have_content("Number of posts: #{user.posts_counter}")
      end
    end
  end
end
