
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
      product.price = nil
      expect(product).to_not be_valid
    end

    it "is not valid without a quantity" do
      product.quantity = nil
      expect(product).to_not be_valid
    end

    it "is not valid without a category" do
      product.category = nil
      expect(product).to_not be_valid
    end
  end
end
