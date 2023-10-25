# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'IndexRequests', type: :feature do
  context 'Index' do
    before(:each) do
      Product.create!(description: 'FakeShirt', size: 'L', condition: 'New', brand: 'Target', price: 10.00,
                      original_price: 20.00, seller: 'Chase')
      Product.create!(description: 'FakePants', size: 'L', condition: 'New', brand: 'Target', price: 10.00,
                      original_price: 20.00, seller: 'Chase')
    end

    it 'should route correctly from the root' do
      visit '/'
      expect(page.text).to match(/FakeShirt.*FakePants/)
    end

    it 'should show products with default sort order' do
      visit products_path
      expect(page.text).to match(/FakeShirt.*FakePants/)
    end

    it 'should contain a link from product name to its show page' do
      visit products_path
      click_on 'FakePants'
      expect(page.current_path).to eq(product_path(2))
    end
  end
end
