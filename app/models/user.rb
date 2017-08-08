class User < ActiveRecord::Base
  has_secure_password



  has_many :products
  has_many :ratings
  has_many :review

  
  def authenticate_with_credentials
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, length: { minimum: 3, maximum: 20 }, on: :create
    validates :email, case_sensitive: false
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    
  end
end
