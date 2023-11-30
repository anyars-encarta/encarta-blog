# post_show_spec.rb
require 'rails_helper'

RSpec.feature 'User Post Show', type: :feature do
  before do
    # Set up test data as needed
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, author: @user)
    @comments = FactoryBot.create_list(:comment, 5, post: @post)
    visit user_post_path(@user, @post)
  end

  scenario 'displays post show page content' do
    expect(page).to have_css('.post-title-show h1', text: @post.title)

    # Test to assert you can see who wrote the post
    expect(page).to have_css('.user-name', text: @user.name)

    expect(page).to have_css('.post-interact p', text: "comments: #{@post.comments_counter}")
    expect(page).to have_css('.post-interact p', text: "likes: #{@post.likes_counter}")
    expect(page).to have_css('.posts-show p', text: @post.text)

    @comments.each do |comment|
      expect(page).to have_css('.comments-container', text: comment.user.name)
      expect(page).to have_css('.comments-container p', text: comment.text)
    end
  end

  scenario 'clicking pagination link redirects to user post index' do
    click_link('Pagination')
    expect(current_path).to eq(user_posts_path(@user))
  end
end
