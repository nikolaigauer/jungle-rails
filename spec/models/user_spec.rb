require 'rails_helper'

RSpec.describe User, type: :model do
  password = "password"


  before :each do
    @user = User.create({
    first_name: "firstname",
    password: password,
    password_confirmation: password,
    email: "nikolaigauer@gmail.com"
    })
  end

   it "Should have a first_name" do
      expect(@user).to be_valid
      expect(@baduser.errors.messages[:name]).to include("can't be blank")
    end 

end
