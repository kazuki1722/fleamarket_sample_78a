require 'rails_helper'

RSpec.describe "CreditCards", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/credit_card/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/credit_card/show"
      expect(response).to have_http_status(:success)
    end
  end

end
