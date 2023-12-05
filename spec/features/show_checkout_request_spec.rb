require 'rails_helper'

RSpec.describe Checkout, type: :feature do
  context 'check attributes and methods' do
    it 'should be able to create a checkout object which has the correct methods on it' do
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

        click_button 'View Cart'
        visit cart_path
        expect(page).to have_content('Total Price: $10')

        click_button 'Checkout'
        visit show_checkout_path
        expect(page).to have_content('Checkout')

        fill_in 'First name', with: 'John'
        fill_in 'Last name', with: 'Doe'
        fill_in 'Shipping address', with: '123 main st'
        fill_in 'City', with: 'New Rochelle'
        select 'NY', from: 'State'
        fill_in 'Zip code', with: '10804'
        fill_in 'Email', with: 'Nex@gmail.com'
        select 'Express Shipping', from: 'Delivery method'
       
        fill_in 'Card holder', with: 'riley'
        fill_in 'Credit card number', with: '12345'
        fill_in 'Expiration date', with: '12/32'
        fill_in 'Cvv', with: '123'

        click_button 'Place Order'
        visit checkout_checkout_path
        expect(page).to have_content('Order Successful!')
        expect(user.reload.cart.products).to be_empty
    end

    
  end
end