# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'IndexRequests', type: :feature do
  context 'default index' do
    before(:each) do
      use = User.create!(email: "gogogate@colgate.edu", password: "colgate13")
      visit new_user_session_path
      fill_in 'Email', with: use.email
      fill_in 'Password', with: use.password
      click_button 'Log in'
      Product.create!(description: 'FakeShirt', size: 'L', condition: 'New', brand: 'Target', price: 10.00,
                      original_price: 20.00, user: use)
      Product.create!(description: 'FakePants', size: 'M', condition: 'New', brand: 'Target', price: 10.00,
                      original_price: 20.00, user: use)
    end

    it 'should route correctly from the root' do
      visit '/'
      expect(page.text).to match(/L.*M/)
    end

   it 'should show products with default sort order' do
      visit products_path
      expect(page.text).to match(/L.*M/)
    end

    # it 'should contain a link from product name to its show page' do
      # visit products_path
     # click_on 'FakePants'
     # expect(page.current_path).to eq(product_path(2))
    #end
  end

  context 'sort' do 
    before(:each) do
      us = User.create!(email: "gogogo@colgate.edu", password: "colgate13")
      visit new_user_session_path
      fill_in 'Email', with: us.email
      fill_in 'Password', with: us.password
      click_button 'Log in'
      Product.create!(description: 'FakeShirt', size: 'L', condition: 'New', brand: 'Target', price: 10.00,
                      original_price: 20.00, user: us)
      Product.create!(description: 'FakePants', size: 'M', condition: 'New', brand: 'Target', price: 20.00,
                      original_price: 30.00,  user: us)
      Product.create!(description: 'FakeDress', size: 'S', condition: 'New', brand: 'Target', price: 60.00,
                      original_price: 100.00,  user: us)
    end
    it "should sort by price: low to high" do
      visit products_path(sort_by: 'Price: Low to High')
      expect(page.text).to match /10.00.*20.00.*60.00/
    end
    it "should sort by price: high to low" do
      visit products_path(sort_by: "Price: High to Low")
      expect(page.text).to match /60.00.*20.00.*10.00/
    end
    it "should sort by size: small to large" do
      visit products_path(sort_by: 'Size: Small to Large')
      expect(page.text).to match /S.*M.*L/
    end
    it "should sort by size: small to large" do
      visit products_path(sort_by: 'Size: Large to Small')
      expect(page.text).to match /L.*M.*S/
    end
    it "should sort by newest product added" do
      visit products_path(sort_by: 'Newest')
      expect(page.text).to match /60.00.*20.00.*10.00/
    end

  end
end
