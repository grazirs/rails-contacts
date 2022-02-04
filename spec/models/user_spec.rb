require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :users

  describe "user validations" do
    it 'create a valid user' do
      user = User.new(name: 'user01', age:18, bio:'anything here')
      expect(user).to be_valid
    end

    it "should not create a user without name" do
      user = User.new(age:18, bio:'anything')
      expect(user).not_to be_valid
    end

    it 'should not create a user with invalid age' do
      user = User.new(name: 'user01', age:'x', bio:'anything here')
      expect(user).not_to be_valid
    end

    it 'should not create a user with invalid bio' do
      user = User.new(name: 'user01', age:'x', bio:'anything')
      expect(user).not_to be_valid
    end
  end

  describe 'two users with the same name'do
    it 'should not create a new user' do
      expect { User.create!(name: "user1") }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
