require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "is valid with a name, price, quantity and category" do
      @cat1 = Category.find_or_create_by name: 'Apparel'
      @product = @cat1.products.create({
        name:  "hipster hat",
        quantity: 10,
        price: 64.99
      })
      expect(@product).to be_valid
    end

    it "is not valid without a name" do
      @cat1 = Category.find_or_create_by name: 'Apparel'
      @product = @cat1.products.create({
        name:  nil,
        quantity: 10,
        price: 64.99
      })
      puts @product.errors.full_messages
      expect(@product).to_not be_valid
    end

    it "is not valid without a price" do
      @cat1 = Category.find_or_create_by name: 'Apparel'
      @product = @cat1.products.create({
        name:  "hipster hat",
        quantity: 10,
        price: nil
      })
      puts @product.errors.full_messages
      expect(@product).to_not be_valid
    end

    it "is not valid without a quantity" do
      @cat1 = Category.find_or_create_by name: 'Apparel'
      @product = @cat1.products.create({
        name:  "hipster hat",
        quantity: nil,
        price: 64.99
      })
      puts @product.errors.full_messages
      expect(@product).to_not be_valid
    end

    it "is not valid without a category" do
      @product = Product.create({
        name:  "hipster hat",
        quantity: 10,
        price: 64.99
      })
      puts @product.errors.full_messages
      expect(@product).to_not be_valid
    end
  end
end
