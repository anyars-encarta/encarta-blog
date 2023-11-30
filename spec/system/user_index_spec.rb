# user_index_spec.rb

require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'User integration', type: :feature do
  before do
    # Create sample users for testing
    FactoryBot.create_list(:user, 3)
  end

  scenario 'User index page' do
    visit users_path

    # Check if the username, profile picture, and number of posts are displayed for each user
    User.all.each do |user|
      expect(page).to have_content(user.name)
      expect(page).to have_css("img[src='#{user.photo}']")
      expect(page).to have_content("Number of posts: #{user.posts_counter}")
    end
  end

  scenario 'Clicking on a user redirects to user show page' do
    user = User.first

    visit users_path
    find(".user-container[data-user-id='#{user.id}']").click_link(user.name)

    # Check if user show page is displayed
    expect(page).to have_current_path(user_path(user))
    expect(page).to have_content(user.name)
    expect(page).to have_content("Number of posts: #{user.posts_counter}")
  end
end
