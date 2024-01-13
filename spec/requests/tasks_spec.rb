require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /start" do
    it "returns http success" do
      get "/tasks/start"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /complete" do
    it "returns http success" do
      get "/tasks/complete"
      expect(response).to have_http_status(:success)
    end
  end

end
