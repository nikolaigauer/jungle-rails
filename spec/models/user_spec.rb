require 'rails_helper'

RSpec.describe User, type: :model do
  password = "password"
  before :each do
    @user = User.create({
    name: "firstname",
    password: password,
    password_confirmation: password,
    email: "nikolaigauer@gmail.com"
    })

    @baduser = User.create
  end

  describe 'Validations' do
    it "should have a valid user" do
      @user.valid?
      expect(@user.valid?).to be true
    end

    it "Should have a name" do
      expect(@user).to be_valid
      expect(@baduser.errors.messages[:name]).to include("can't be blank")
    end

    it "Should have an email" do
      expect(@user).to be_valid
      expect(@baduser.errors.messages[:email]).to include("can't be blank")
    end
    
    it "Should have a password" do
      expect(@user).to be_valid
      expect(@baduser.errors.messages[:password]).to include("can't be blank")
    end

    it "Should have a password confirmation field" do
      expect(@user).to be_valid
      expect(@baduser.errors.messages[:password_confirmation]).to include("can't be blank")
    end

  end

  before :each do
    @authentic_user = User.create({
    first_name: "firstname",
    last_name: "lastname",
    password: password,
    password_confirmation: password,
    email: "nikolaigauer@gmail.com"
    })
  end

  describe '.authenticate_with_credentials' do
    it "Should have a name" do
      expect(@authentic_user).to be_valid
      expect(@baduser.errors.messages[:first_name]).to include("can't be blank")
    end 


  end

end
