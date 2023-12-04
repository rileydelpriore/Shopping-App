require 'rails_helper'

RSpec.feature 'Add to Cart feature', type: :feature do
    context "create happy path" do
        it 'should add the item into the cart' do
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
            expect(page).to have_content('Product successfully added to cart.')
        end
    end

    context "create sad path" do
        it 'should not add the item multiple times into the cart' do
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
            expect(page).to have_content "FakeShirt"
            click_button 'Add to Cart'
            click_button 'Add to Cart' 
            expect(page).to have_content('This product is already in your cart.')
        end

        it 'should not allow you to add if user is not signed in' do 
            user = User.create(email: 'test@colgate.edu', password: 'password')
            cart = user.cart || Cart.create(user: user)
            product = Product.create(description: 'FakeShirt', size: 'L', condition: 'New', brand: 'Target', price: 10.00,
            original_price: 20.00, user: user)
            visit product_path(product)
            expect(page).to have_content "FakeShirt"
            click_button 'Add to Cart'
            expect(page).to have_content('Sign In')
        end
    end
end