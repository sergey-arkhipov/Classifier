require 'rails_helper'

RSpec.describe "Cataloges", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/cataloges/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/cataloges/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/cataloges/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/cataloges/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/cataloges/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
