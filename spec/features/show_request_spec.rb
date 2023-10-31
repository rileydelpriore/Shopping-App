# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'ShowRequests', type: :feature do
  context 'Index' do
    before(:each) do
      Product.create!(description: 'FakeShirt', size: 'L', condition: 'New', brand: 'Target', price: 10.00,
                      original_price: 20.00, seller: 'Chase')
      Product.create!(description: 'FakePants', size: 'L', condition: 'New', brand: 'Target', price: 10.00,
                      original_price: 20.00, seller: 'Chase')
    end

    it 'should show product details' do
      visit product_path(1)
      expect(page.text).to match(/FakeShirt/)
      expect(page.text).to match(/L/)
      expect(page.text).to match(/New/)
      expect(page.text).to match(/Target/)
      expect(page.text).to match(/10\.00/)
      expect(page.text).to match(/20\.00/)
      expect(page.text).to match(/Chase/)
    end
  end
end
