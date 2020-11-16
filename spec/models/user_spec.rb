require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
  
    it "creates a new user successfully if all fields are filled" do
    end

    it "returns mismatched password error if password and password confirmation do not match" do
    end

    it "returns error if email is not unique (not case sensitive)" do
    end

    it "returns missing email error if email field is nil" do
    end

    it "returns missing first name error if first name field is nil" do
    end

    it "returns missing last name error if last name field is nil" do
    end

  end

end
