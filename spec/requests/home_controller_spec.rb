require 'rails_helper'

RSpec.describe 'HomeController', type: :request do
  describe 'GET /index' do
    it 'should render the correct response status' do
      get root_path
      expect(response).to have_http_status(:ok)
    end

    it 'should render the correct Template' do
      get root_path
      expect(response).to render_template(:index)
    end
  end
end
