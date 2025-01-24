require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase

  test "Logging in as an admin user" do
    visit new_user_session_path
    fill_in "Email", with: users(:one).email
    fill_in "Password", with: "123456"
    click_button "Log in"

    assert_current_path products_path
    assert_text "Signed in successfully."

  end

  test "unauthorized user cannot access the products index page" do
    sign_in users(:two)
    visit products_path
    assert_text "Access denied. Only admins can view this page."
  end


  test "visiting the index" do
    sign_in users(:one)
    visit products_path
    assert_selector ".container.mt-4 h1 ", text: "Products"
  end

  test "should create product" do
     sign_in users(:one)
    visit products_path
     assert_selector ".container.mt-4 h1 a", match: :first
    click_on "New Product", match: :first

    fill_in "product_currency", with: "USD"
    fill_in "product_description", with: "A great product"
     attach_file "product_image", Rails.root + "app/assets/images/header-logo.png"
    fill_in "product_name", with: "Fares"
    fill_in "product_price", with: 55
    fill_in "product_quantity", with: 1
    click_on "Save Product"

  end

  test "should update Product" do
    sign_in users(:one)
    visit products_path
    assert_selector ".card-body a", match: :first
    click_on "Edit", match: :first

    fill_in "product_currency", with: "USD"
    fill_in "product_description", with: "A great product"
    attach_file "product_image", Rails.root + "app/assets/images/header-logo.png"
    fill_in "product_name", with: "Fares"
    fill_in "product_price", with: 55
    fill_in "product_quantity", with: 1
    click_on "Edit Product"

  end

  test "should destroy Product" do
    sign_in users(:one)
    visit products_path
    click_on "Delete", match: :first
  end
end
