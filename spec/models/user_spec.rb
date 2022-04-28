require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "is valid" do
      @user = User.create({
        first_name: "first",
        last_name: "last",
        email: "me@email.com",
        password: "123456",
        password_confirmation: "123456"
      })
      expect(@user).to be_valid
    end

    it "is not valid without matching password and confirmation" do
      @user = User.create({
        first_name: "first",
        last_name: "last",
        email: "me@email.com",
        password: "123456",
        password_confirmation: "123"
      })
      puts @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it "is not valid without password" do
      @user = User.create({
        first_name: "first",
        last_name: "last",
        email: "me@email.com",
        password: nil,
        password_confirmation: "123456"
      })
      puts @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it "is not valid without password confirmation" do
      @user = User.create({
        first_name: "first",
        last_name: "last",
        email: "me@email.com",
        password: "123456",
        password_confirmation: nil
      })
      puts @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it "is not valid when password is less than 6 characters" do
      @user = User.create({
        first_name: "first",
        last_name: "last",
        email: "me@email.com",
        password: "123",
        password_confirmation: "123"
      })
      puts @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it "is not valid when email is not unique" do
      @user1 = User.create({
        first_name: "first-1",
        last_name: "last-1",
        email: "me@email.com",
        password: "123456",
        password_confirmation: "123456"
      })
      @user2 = User.create({
        first_name: "first-2",
        last_name: "last-2",
        email: "ME@email.com",
        password: "123456",
        password_confirmation: "123456"
      })
      puts @user2.errors.full_messages
      expect(@user2).to_not be_valid
    end

    it "is not valid without email" do
      @user = User.create({
        first_name: "first",
        last_name: "last",
        email: nil,
        password: "123456",
        password_confirmation: "123456"
      })
      puts @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it "is not valid without first name" do
      @user = User.create({
        first_name: nil,
        last_name: "last",
        email: "me@email.com",
        password: "123456",
        password_confirmation: "123456"
      })
      puts @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it "is not valid without last name" do
      @user = User.create({
        first_name: "first",
        last_name: nil,
        email: "me@email.com",
        password: "123456",
        password_confirmation: "123456"
      })
      puts @user.errors.full_messages
      expect(@user).to_not be_valid
    end
  end
end
