require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  let(:user) { create(:user) } # Assuming you have a factory for User model

  it 'renders the show action' do
    get user_path(user)
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:show)
    # Add expectations for the response body if needed
  end
end
