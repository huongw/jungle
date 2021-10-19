require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save a valid product' do
      @category = Category.new(name: "Clothes")
      @product = Product.new(name: "Shirt", price: 200, quantity: 10, category: @category)
      expect(@product).to be_valid
      expect(@product.errors.full_messages).to be_empty
  end
    it 'is not valid without a name' do
      @category = Category.new(name: "Clothes")
      @product = Product.new(name: nil, price: 200, quantity: 10, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Name can't be blank"
  end
    it 'is not valid without a price' do
      @category = Category.new(name: "Clothes")
      @product = Product.new(name: "Shirt", price: nil, quantity: 10, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Price can't be blank"
  end
    it 'is not valid without quantity' do
      @category = Category.new(name: "Clothes")
      @product = Product.new(name: "Shirt", price: 200, quantity: nil, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
  end
    it 'is not valid without category' do
      @category = Category.new(name: "Clothes")
      @product = Product.new(name: "Shirt", price: 200, quantity: 10, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Category can't be blank"
  end
  end
end
