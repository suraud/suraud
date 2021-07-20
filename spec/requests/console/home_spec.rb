require 'rails_helper'

RSpec.describe "Console::Homes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/console/"
      expect(response).to have_http_status(:success)
    end
  end

end
