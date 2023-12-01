require 'rails_helper'

RSpec.feature 'Add to Cart feature', type: :feature do
    context "create happy path" do
        it 'should remove the item the cart' do
            user = User.create(email: 'test@colgate.edu', password: 'password')
            visit new_user_session_path 
            fill_in 'Email', with: "test@colgate.edu"
            fill_in 'Password', with: "password"
            click_button 'Log in'
            expect(page).to have_content "Signed in successfully."
            cart = user.cart || Cart.create(user: user)
            product = Product.create(description: 'FakeShirt', size: 'L', condition: 'New', brand: 'Target', price: 10.00,
            original_price: 20.00, user: user)
            visit product_path(product)
            click_button 'Add to Cart'  
            visit cart_path
            click_button 'Remove'
            expect(page).to have_content('Product removed from cart')
        end
    end
end
