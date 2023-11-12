require 'rails_helper'

RSpec.feature 'Add to Cart feature', type: :feature do
    context "create happy path" do
        it 'should add the item into the cart' do
            user = User.create(email: 'user@example.com', password: 'password')
            visit new_user_session_path
            fill_in 'Email', with: user.email
            fill_in 'Password', with: user.password
            click_button 'Log in'
            product = Product.create(description: 'FakeShirt', size: 'L', condition: 'New', brand: 'Target', price: 10.00,
            original_price: 20.00, user: user)
            visit product_path(product)
            click_button 'Add to Cart'  
            expect(page).to have_content('Product successfully added to cart.')
        end
    end

    context "create sad path" do
        it 'should add the item into the cart' do
            user2 = User.create(email: 'user@example.com', password: 'password')
            visit new_user_session_path
            fill_in 'Email', with: user2.email
            fill_in 'Password', with: user2.password

            click_button 'Log in'
            
            product = Product.create(description: 'FakeShirt', size: 'L', condition: 'New', brand: 'Target', price: 10.00,
            original_price: 20.00, user: user2)
            visit product_path(1)
            expect(page).to have_content "FakeShirt"
            click_button 'Add to Cart'
            click_button 'Add to Cart' 
            expect(page).to have_content('This product is already in your cart.')
        end
    end


end



