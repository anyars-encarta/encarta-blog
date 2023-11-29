require 'rails_helper'

RSpec.feature 'User Show Page', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @recent_posts = FactoryBot.create_list(:post, 3, author: @user)
    visit user_path(@user)
  end

  scenario 'displays user information' do
    expect(page).to have_css('.user-container')
    expect(page).to have_css("img[src='#{@user.photo}'][alt='#{@user.name}']")
    expect(page).to have_content(@user.name)
    expect(page).to have_content("Number of posts: #{@user.posts_counter}")
    expect(page).to have_content(@user.bio) # Updated to check for the user bio

    @recent_posts.each_with_index do |post, index|
      expect(page).to have_css('h3', text: "Post ##{index + 1}") # Check for numbered post headings
      expect(page).to have_content(post.title)
    end

    expect(page).to have_link('See all posts', href: user_posts_path(@user))
  end

  scenario 'clicking see all posts redirects to user posts index page' do
    click_link('See all posts')
    expect(current_path).to eq(user_posts_path(@user))
    # Add expectations for the user posts index page if needed
  end
end
