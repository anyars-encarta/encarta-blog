require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  let(:user) { create(:user) } # Assuming you have a factory for User model

  it 'renders the index action' do
    get user_posts_path(user_id: user.id)
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:index)
    # Add expectations for the response body if needed
  end

  it 'renders the show action' do
    post = create(:post, user: user) # Assuming you have a factory for Post model
    get user_post_path(user_id: user.id, id: post.id)
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:show)
    # Add expectations for the response body if needed
  end
end
