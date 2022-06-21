require 'rails_helper'

RSpec.describe "Users", type: :request do

  fixtures :users, :contacts, :phones
  
  describe "GET /index" do
    it "should returns http success" do
      get "/users"
      expect(response).to have_http_status(:success)
    end
  end
end
