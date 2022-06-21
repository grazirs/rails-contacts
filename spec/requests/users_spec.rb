require 'rails_helper'

RSpec.describe "Users", type: :request do

  fixtures :users, :contacts, :phones

  describe "GET /index" do
    it "should returns http success" do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it "should render the index template" do
      get users_path
      expect(response).to render_template("index")
    end
  end

  describe "GET /show" do
    it "should returns http success" do
      get user_path(User.find_by(id: 1))
      expect(response).to have_http_status(:success)
    end

    it "should render the show template" do
      get user_path(User.find_by(id: 1))
      expect(response).to render_template("show")
    end

    it "should show the correct user" do
      user = User.find_by(id: 1)
      get user_path(user)
      assert_select "#name", text:"Name: "+user.name
      assert_select "#bio", text:"Bio: "+user.bio
      assert_select "#age", text:"Age: "+user.age.to_s
    end
  end
  
end
