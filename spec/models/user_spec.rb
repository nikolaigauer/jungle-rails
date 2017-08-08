require 'rails_helper'

RSpec.describe User, type: :model do
  password = "password"

  @user = Users.create({
  password: password,
  password_confirmation: password,
  email: "nikolaigauer@gmail.com"
  })
end
