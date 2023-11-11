require 'rails_helper'

RSpec.feature 'Add to Cart feature', type: :feature do
    context "create happy path" do
        it 'should add the item into the cart' do
            product = Product.create(description: 'FakeShirt', size: 'L', condition: 'New', brand: 'Target', price: 10.00,
            original_price: 20.00, seller: 'Chase')
            visit product_path(product)
            click_button 'Add to Cart'  
            expect(page).to have_content('Product successfully added to cart.')
        end
    end

    context "create sad path" do
        it 'should add the item into the cart' do
            product = Product.create(description: 'FakeShirt', size: 'L', condition: 'New', brand: 'Target', price: 10.00,
            original_price: 20.00, seller: 'Chase')
            visit product_path(product)
            click_button 'Add to Cart' 
            click_button 'Add to Cart' 
            expect(page).to have_content('This product is already in your cart.')
        end
    end


end



