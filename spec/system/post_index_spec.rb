require 'rails_helper'

RSpec.feature 'User Post Index', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @posts = FactoryBot.create_list(:post, 10, author: @user)
    visit user_posts_path(@user)
  end

  scenario 'displays post index page content' do
    expect(page).to have_css('.user-container')
    expect(page).to have_css('.img-container img')
    expect(page).to have_css('.user-name', text: @user.name)

    # Test to assert that you can see the number of posts the user has written
    expect(page).to have_css('.user-post', text: "Number of posts: #{@user.posts_counter}")

    @posts.each do |post|
      expect(page).to have_css('.post', text: post.title)
      expect(page).to have_css('.post-content p', text: post.text)
      expect(page).to have_css('.interactions', text: "comments: #{post.comments_counter}")
      expect(page).to have_css('.interactions', text: "likes: #{post.likes_counter}")

      # Test to assert that you can see the first comments on a post
      within(".post[data-post-id='#{post.id}']") do
        first_comment = post.recent_comments.first
        if first_comment
          expect(page).to have_css('.comments-container', text: "#{first_comment.user.name}: #{first_comment.text}")
        else
          puts "No comments found for post: #{post.title}"
        end
      end

      # Test to assert redirection to the post's show page when clicked
      within(".post[data-post-id='#{post.id}']") do
        find('.single-post-cont').click
      end

      # Output the current URL after clicking
      puts "Current URL: #{page.current_url}"
      expect(page).to have_current_path(user_post_path(@user, post))
    end

    expect(page).to have_css('.pagination')
  end
end
