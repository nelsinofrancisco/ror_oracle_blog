require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Get /index' do
    before :each do
      get '/users'
    end

    it 'Response status when requesting => :ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'Render the correct template' do
      expect(response).to render_template(:index)
    end

    it 'Render the correct placeholder text' do
      expect(response.body).to include('LISTING ALL USERS')
    end

    it 'does not render a different template' do
      expect(response).to_not render_template(:show)
    end
  end

  describe 'Get /show' do
    before :each do
      get '/users/10/'
    end

    it 'Response status when requesting => :ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'Render the correct template' do
      expect(response).to render_template(:show)
    end

    it 'Render the correct placeholder text' do
      expect(response.body).to include('DISPLAY A USER FULL INFORMATION')
    end

    it 'does not render a different template' do
      expect(response).to_not render_template(:index)
    end
  end
end
