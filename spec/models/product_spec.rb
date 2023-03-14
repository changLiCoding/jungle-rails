require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    # validation tests/examples here
    category = Category.new name: "Category"
    product = Product.new name: "Product", price: 1, quantity: 1, category: category

    it "is valid with valid attributes" do
      expect(product).to be_valid

    end

    it "is not valid without a name" do
      product.name = nil
      expect(product).to_not be_valid

    end

    it "is not valid without a price" do
      product.price_cents = nil
      product.name = "Product"
      expect(product).to_not be_valid
      puts product.errors.full_messages
      expect(product.errors.full_messages[0]).to include("Price cents is not a number")
      expect(product.errors.full_messages[1]).to include("Price is not a number")
      expect(product.errors.full_messages[2]).to include("Price can't be blank")
    end

    it "is not valid without a quantity" do
      product.price_cents = 1000

      product.quantity = nil

      expect(product).to_not be_valid
      puts product.errors.full_messages
      expect(product.errors.full_messages[0]).to include("Quantity can't be blank")

    end

    it "is not valid without a category" do
      product.quantity = 10
      product.category = nil
      expect(product).to_not be_valid
      puts product.errors.full_messages
      expect(product.errors.full_messages[0]).to include("Category must exist")
      expect(product.errors.full_messages[1]).to include("Category can't be blank")

    end
  end
end
