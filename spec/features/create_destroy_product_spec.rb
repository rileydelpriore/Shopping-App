require 'rails_helper'

RSpec.feature "Newcreates", type: :feature do
  #include Devise::Test::IntegrationHelpers

  it 'should get from index page to new product page' do 
    visit products_path 
    click_on "Add new item"
    expect(page).to have_content("Description")
    expect(page).to have_content("Size")
    expect(page).to have_content("Condition")
    expect(page).to have_content("Brand")
    expect(page).to have_content("Price")
    expect(page).to have_content("Original price")
    expect(page).to have_content("Photo")
  end
  context "create happy path" do
    it "should create a new clothing item successfully" do
      visit new_product_path
      fill_in "Description", with: "Shirt"
      fill_in "Brand", with: "Zara"
      fill_in "Price", with: "79.99"
      fill_in "Original price", with: "119.99"
      click_on "Create"
      expect(page.current_path).to eq(products_path)
      expect(page).to have_content("Item successfully uploaded")
    end
  end
  context "create sad path" do
    it "should re-render the form on failure" do
      visit new_product_path
      fill_in "Description", with: "Pants"
      click_on "Create"
      expect(page).to have_content("errors prevented this")
    end
  end
  context "delete happy path" do
    it 'should delete a product when prompted' do
      p = Product.create!(description: 'FakeShirt', size: 'L', condition: 'New', brand: 'Target', price: 10.00,
                        original_price: 20.00, seller: 'Chase')
      visit product_path(p)
      click_on "Delete"
      expect(page).to have_content('Product successfully deleted')
    end
  end
end
