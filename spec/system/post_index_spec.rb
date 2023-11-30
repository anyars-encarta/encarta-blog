require 'rails_helper'

RSpec.feature 'Post view', type: :feature do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, author: user) }
  let!(:comments) { create_list(:comment, 3, post: post) }

  scenario 'User post index page' do
    visit user_posts_path(user)

    expect(page).to have_css('.user-container')
    expect(page).to have_css('.user-container img')
    expect(page).to have_css('.user-name', text: user.name)
    expect(page).to have_content("Number of posts: #{user.posts_counter}")

    expect(page).to have_css('.post')
    expect(page).to have_css('.post h1', text: post.title)
    expect(page).to have_css('.post p', text: post.text.truncate(30))
    expect(page).to have_css('.comment', count: 3)
    expect(page).to have_content("comments: #{post.comments_counter}")
    expect(page).to have_content("likes: #{post.likes_counter}")
  end

  scenario 'Clicking on a post redirects to post show page' do
    visit user_posts_path(user)

    click_link post.title

    expect(page).to have_current_path(user_post_path(user, post))
  end
end
