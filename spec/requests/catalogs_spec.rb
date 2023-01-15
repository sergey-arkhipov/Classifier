require 'rails_helper'

RSpec.describe 'Catalogs' do
  describe 'GET /index' do
    it 'returns http success' do
      get '/catalogs'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'returns http create' do
      catalog = attributes_for(:catalog)
      post '/catalogs', params: { catalog: }, xhr: true
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /edit' do
    let(:catalog) { create(:catalog) }

    it 'returns http success' do
      get '/catalogs', params: { id: catalog.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH /update' do
    let(:catalog) { create(:catalog) }
    let(:valid_params) { attributes_for(:catalog) }

    it 'returns http success' do
      patch "/catalogs/#{catalog.id}", params: { catalog: valid_params }
      expect(response).to have_http_status(:found)
    end
  end

  describe 'DELETE /delete' do
    let(:catalog) { create(:catalog) }

    it 'returns http success' do
      delete "/catalogs/#{catalog.id}"
      expect(response).to have_http_status(:ok)
    end
  end
end
