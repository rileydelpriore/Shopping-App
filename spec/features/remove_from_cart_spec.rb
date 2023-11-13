require 'rails_helper'

RSpec.feature 'Add to Cart feature', type: :feature do
    context "create happy path" do
        it 'should remove the item the cart' do
            user = User.create(email: 'user@example.com', password: 'password')
            visit new_user_session_path
            fill_in 'Email', with: user.email
            fill_in 'Password', with: user.password
            click_button 'Log in'
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
