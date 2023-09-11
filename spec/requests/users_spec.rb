require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns a successful response' do
      get users_url
      expect(response).to be_successful
    end

    it 'renders correct template' do
      get users_url
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder text' do
      get users_url
      expect(response.body).to include('List of users')
    end
  end

  describe 'GET /show' do
    it 'returns a successful response' do
      get user_show_url(1)
      expect(response).to be_successful
    end

    it 'renders correct template' do
      get user_show_url(1)
      expect(response).to render_template(:show)
    end

    it 'response body includes correct placeholder text' do
      get user_show_url(1)
      expect(response.body).to include('User details for id: 1')
    end
  end
end
