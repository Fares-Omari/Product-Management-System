require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user missing email" do
    user = User.new(name: "Admin", role: "admin", password: "password123")
    assert_not user.save, "Saved the user without an email"
  end

  test "should save user with valid attributes" do
    user = User.new(name: "Admin", email: "admin@example.com", role: "admin", password: "password123")
    assert user.save, "Failed to save the user with valid attributes"
  end

  # Test role assignment
  test "admin user should have role admin" do
    user = users(:one) # From fixtures
    assert_equal "admin", user.role, "Admin user does not have the role admin"
  end
end
