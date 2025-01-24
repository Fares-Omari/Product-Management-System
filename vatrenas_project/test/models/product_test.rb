require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "should not save product missing name" do
    product = Product.new(description: "A great product", price: 100, quantity: 10)
    assert_not product.save, "Saved the product without a name"
  end

  test "should not save product with negative price" do
    product = Product.new(name: "Product 1", description: "A great product", price: -10, quantity: 10)
    assert_not product.save, "Saved the product with a negative price"
  end

  test "should save product with valid attributes" do
    product = Product.new(name: "Product 1", description: "A great product", price: 100, quantity: 10)
    assert product.save, "Failed to save the product with valid attributes"
  end
end
