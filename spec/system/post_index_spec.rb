# post_index_spec.rb
require 'rails_helper'

RSpec.feature 'User Post Index', type: :feature do
  before do
    # Set up test data as needed
    @user = FactoryBot.create(:user)
    @posts = FactoryBot.create_list(:post, 10, author: @user)
    visit user_posts_path(@user)
  end

  scenario 'displays post index page content' do
    expect(page).to have_css('.user-container')
    expect(page).to have_css('.img-container img')
    expect(page).to have_css('.user-name', text: @user.name)

    @posts.each do |post|
      expect(page).to have_css('.post', text: post.title)
      expect(page).to have_css('.post-content p', text: post.text)
      expect(page).to have_css('.interactions', text: "comments: #{post.comments_counter}")
      expect(page).to have_css('.interactions', text: "likes: #{post.likes_counter}")
    end

    expect(page).to have_css('.pagination') # Check for pagination section
  end
end
