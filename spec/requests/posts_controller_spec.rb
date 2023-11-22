require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  let(:user) { create(:user) } # Create user from factory

  describe 'GET /index' do
    it 'should render the correct response status' do
      get user_posts_path(user_id: user.id)
      expect(response).to have_http_status(:ok)
    end

    it 'should render the correct Template' do
      get user_posts_path(user_id: user.id)
      expect(response).to render_template(:index)
    end

    it 'renders the correct placeholder text of the body' do
      get user_posts_path(user_id: user.id)
      expect(response.body).to include('This is where all posts for the user will be listed')
    end
  end

  describe 'GET /show' do
    it 'should render the correct response status' do
      post = create(:post, user:) # Create post from factory
      get user_post_path(user_id: user.id, id: post.id)
      expect(response).to have_http_status(:ok)
    end

    it 'should render the correct Template' do
      post = create(:post, user:) # Create post from factory
      get user_post_path(user_id: user.id, id: post.id)
      expect(response).to render_template(:show)
    end

    it 'renders the correct placeholder text of the body' do
      post = create(:post, user:) # Create post from factory
      get user_post_path(user_id: user.id, id: post.id)
      expect(response.body).to include('This is where details for a specific post will be shown')
    end
  end
end
