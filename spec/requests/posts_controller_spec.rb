require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  let(:user) { create(:user) } # Create user from factory

  it 'renders the index action' do
    get user_posts_path(user_id: user.id)
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:index)
  end

  it 'renders the show action' do
    post = create(:post, user: user) # Create post from factory
    get user_post_path(user_id: user.id, id: post.id)
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:show)
  end
end
