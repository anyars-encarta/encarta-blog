require 'rails_helper'

RSpec.describe 'HomeController', type: :request do
  it 'renders the index action' do
    get root_path
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:index)
    expect(response.body).to include('Welcome to Encarta Blog App!')
  end
end
