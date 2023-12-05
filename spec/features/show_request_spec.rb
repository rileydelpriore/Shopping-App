# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'ShowRequests', type: :feature do
  context 'Index' do
    before(:each) do
      u = User.create!(email: "gogate@colgate.edu", password: "colgate13")
      visit new_user_session_path
      fill_in 'Email', with: u.email
      fill_in 'Password', with: u.password
      click_button 'Log in'
      Product.create!(description: 'FakeShirt', size: 'L', condition: 'New', brand: 'Target', price: 10.00,
                      original_price: 20.00, user: u)
      Product.create!(description: 'FakePants', size: 'L', condition: 'New', brand: 'Target', price: 10.00,
                      original_price: 20.00, user: u)
    end
    it "should have a link back to the index" do
      visit product_path(1)
      expect(page.text).to match /Back to Products/
      click_on "Back to Products"
      expect(page.current_path).to eq(products_path)
    end


    it 'should show product details' do
      visit product_path(1)
      expect(page.text).to match(/FakeShirt/)
      expect(page.text).to match(/L/)
      expect(page.text).to match(/New/)
      expect(page.text).to match(/Target/)
      expect(page.text).to match(/10\.00/)
      expect(page.text).to match(/20\.00/)

    end

    it "should have a link to delete" do
     
      visit product_path(1)
      expect(page.text).to match /Delete this product/
      click_on "Delete this product"
      expect(page).to have_current_path(products_path)
    end
  end
end
