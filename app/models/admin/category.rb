class Admin::Category < ActiveRecord::Base

  belongs_to :admin
  has_many :products
  
  validates :name, presence: true

end
