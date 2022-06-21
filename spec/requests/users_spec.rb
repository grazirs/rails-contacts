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

  describe "GET /new" do
    it "should returns http success" do
      get users_new_path(User.find_by(id: 1))
      expect(response).to have_http_status(:success)
    end

  describe "POST /create" do
    it "should returns http success" do
      post users_create_path(User.find_by(id: 1))
      expect(response).to have_http_status(:success)
    end

    it "should redirect to user" do
      post users_create_path, params: {name: "User6", age: 25, bio: "somewhere over the rainbow"}
      expect(response).to redirect_to user_path(User.order("created_at").last)
    end

    it "should create a new user" do
      expect{ 
        post users_create_path, params: {name: "User7", age: 24, bio: "somewhere over the rainbow"} 
      }.to change(User, :count).by(1)
    end
  end

  describe "GET /edit" do
    it "should returns http success" do
      get edit_path(User.find_by(id: 1))
      expect(response).to have_http_status(:success)
    end

  describe "PATCH /update" do
    it "should redirect to show" do
      user = User.find_by(id: 1)
      user.name = "User8"
      patch users_update_path, params: {name: user.name, age: user.age, bio: user.bio, id: user.id} 
      expect(response).to redirect_to user_path(user)
    end
    
    it "should update the user" do
      user = User.find_by(id: 1)
      user.name = "User8"
      patch users_update_path, params: {name: user.name, age: user.age, bio: user.bio, id: user.id} 
      update_user = User.find_by(id: 1)
      expect(update_user.name).to eq("User8")
    end
  end

  describe "DELETE /destroy" do
    it "should delete the user and redirect to users_path" do
      delete destroy_path(User.find_by(id: 1))
      user = User.find_by(id: 1)
      expect(user).to eq(nil)
      expect(response).to redirect_to(users_path)
    end
  end
end
