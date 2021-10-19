require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is valid' do
      @category = Category.new(name: "test")
      @product = Product.new(name: "test", price: 200, quantity: 10, category: @category)
      expect(@product).to be_valid
  end
    it 'is not valid without a name' do
      @category = Category.new(name: "test")
      @product = Product.new(name: nil, price: 200, quantity: 10, category: @category)
      expect(@product).to_not be_valid
  end
    it 'is not valid without a price' do
      @category = Category.new(name: "test")
      @product = Product.new(name: "test", price: nil, quantity: 10, category: @category)
      expect(@product).to_not be_valid
  end
    it 'is not valid without quantity' do
      @category = Category.new(name: "test")
      @product = Product.new(name: "test", price: 200, quantity: nil, category: @category)
      expect(@product).to_not be_valid
  end
    it 'is not valid without category' do
      @category = Category.new(name: "test")
      @product = Product.new(name: "test", price: 200, quantity: 10, category: nil)
      expect(@product).to_not be_valid
  end
  end
end
