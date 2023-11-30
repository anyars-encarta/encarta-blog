# user_index_spec.rb

require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
  before do
    @users = FactoryBot.create_list(:user, 3)
    visit users_path
  end

  scenario 'displays user information' do
    within '.users' do
      @users.each do |user|
        expect(page).to have_css('.user-name', text: user.name)
        expect(page).to have_css("img[src='#{user.photo}'][alt='#{user.name}']")
        expect(page).to have_content("Number of posts: #{user.posts_counter}")

        within ".user-container[data-user-id='#{user.id}']" do
          find('.user-name').click
        end

        expect(page).to have_current_path(user_path(user))
        expect(page).to have_content(user.name)
      end
    end
  end
end
