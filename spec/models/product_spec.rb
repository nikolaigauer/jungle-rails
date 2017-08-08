require 'rails_helper'

RSpec.describe Product, type: :model do
  before :each do
    @cat5 = Category.find_or_create_by name: 'Marbles'
    @product = @cat5.products.create({
    name: "naaaaaame",
    price: 9,
    quantity: 18
    })
    @badproduct = Product.create
  end

  describe 'Validations' do

    it "Should have a category" do
      @badcategory = Category.create name: nil
      expect(@product).to be_valid
      expect(@badcategory.errors.messages[:name]).to include("can't be blank")
    end 

    it "should have a name" do
      expect(@product).to be_valid
      expect(@badproduct.errors.messages[:name]).to include("can't be blank")
    end
    
    it "should have a quantity" do
      expect(@product).to be_valid
      expect(@badproduct.errors.messages[:quantity]).to include("can't be blank")
    end

    it "should have a price" do
      expect(@product).to be_valid
      expect(@badproduct.errors.messages[:price]).to include("is not a number")
    end

    
  end
end
