require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
  
    it "creates a new user successfully if all fields are filled" do
      user = User.new(first_name: 'Jane', last_name: 'Doe', email: 'jdoe@test.com', password: '123456', password_confirmation: '123456')
      expect{user.save}.to change{User.count}.by(1)
    end

    it "returns mismatched password error if password and password confirmation do not match" do
      user = User.new(first_name: 'Jane', last_name: 'Doe', email: 'jdoe@test.com', password: '123456', password_confirmation: '654321')
      user.save
      expect(user).to_not be_valid
      expect(user.errors.messages[:password_confirmation]).to eq ["doesn't match Password"]
    end

    it "returns password too short if password is under 6 characters" do
      user = User.new(first_name: 'Jane', last_name: 'Doe', email: 'jdoe@test.com', password: '123', password_confirmation: '123')
      user.save
      expect(user).to_not be_valid
      expect(user.errors.messages[:password]).to eq ["is too short (minimum is 6 characters)"]
    end

    it "returns missing password error if passworld field is nil" do
      user = User.new(first_name: 'Jane', last_name: 'Doe', email: 'jdoe@test.com')
      user.save
      expect(user).to_not be_valid
      expect(user.errors.messages[:password]).to eq ["can't be blank", "is too short (minimum is 6 characters)"]
    end
    
    it "returns missing email error if email field is nil" do
      user = User.new(first_name: 'Jane', last_name: 'Doe', password: '123456', password_confirmation: '123456')
      user.save
      expect(user).to_not be_valid
      expect(user.errors.messages[:email]).to eq ["invalid"]
    end

    it "returns email taken error if email is not unique (not case sensitive)" do
      user1 = User.new(first_name: 'Jane', last_name: 'Doe', email: 'JDOE@test.com', password: '123456', password_confirmation: '123456')
      user2 = User.new(first_name: 'Jane', last_name: 'Doe', email: 'jdoe@test.com', password: '123456', password_confirmation: '123456')
      user1.save
      user2.save
      expect(user2).to_not be_valid
      expect(user2.errors.messages[:email]).to eq ["has already been taken"]
    end

    it "returns missing first name error if first name field is nil" do
      user = User.new(last_name: 'Doe', email: 'jdoe@test.com', password: '123456', password_confirmation: '123456')
      user.save
      expect(user).to_not be_valid
      expect(user.errors.messages[:first_name]).to eq ["can't be blank"]
    end

    it "returns missing last name error if last name field is nil" do
      user = User.new(first_name: 'Jane', email: 'jdoe@test.com', password: '123456', password_confirmation: '123456')
      user.save
      expect(user).to_not be_valid
      expect(user.errors.messages[:last_name]).to eq ["can't be blank"]
    end

  end

  describe '.authenticate_with_credentials' do
    
    it "returns the user given a valid email and password" do
    end

    it "returns the user given an email in the wrong case and valid password" do
    end

    it "returns the user given an email with filler spaces and valid password" do
    end

    it "returns nil given an invalid email" do
    end

  end

end
