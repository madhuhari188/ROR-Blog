require 'rails_helper'

RSpec.describe "Omniauths", type: :request do
  describe "GET /github" do
    it "returns http success" do
      get "/omniauth/github"
      expect(response).to have_http_status(:success)
    end
  end

end
