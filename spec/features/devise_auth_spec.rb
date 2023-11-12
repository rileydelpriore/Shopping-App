require 'rails_helper'

RSpec.describe 'Devise authentication', type: :feature do
    it 'can let a user sign in happy path' do 
        user = User.create(email: 'test@colgate.edu', password: 'password')
       visit new_user_session_path 
       fill_in 'Email', with: "test@colgate.edu"
       fill_in 'Password', with: "password"
       click_button 'Log in'
       expect(page).to have_content "Signed in successfully."
    end
    it 'can let a user sign in sad path' do 
       user = User.create(email: 'test@colgate.edu', password: 'password')
       visit new_user_session_path 
       fill_in 'Email', with: "test@colgate.edu"
       fill_in 'Password', with: "wrong_password"
       click_button 'Log in'
       expect(page).to have_text "Log in"
    end
    it 'can let a user sign up happy path' do 
        visit new_user_registration_path
        fill_in 'Email', with: 'newuser@colgate.edu'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button 'Sign up'
        expect(page).to have_content 'Welcome! You have signed up successfully.'
    end
    context 'Sign up sad path' do
        it 'does not allow sign up with an invalid email' do
            visit new_user_registration_path   
            fill_in 'Email', with: 'invalidemail@example.com'
            fill_in 'Password', with: 'password'
            fill_in 'Password confirmation', with: 'password'  
            click_button 'Sign up' 
            expect(page).to have_content "Email must be a Colgate email address"
        end
        it 'requires password and password confirmation to match during sign up' do
         visit new_user_registration_path
    
         fill_in 'Email', with: 'newuser@colgate.edu'
            fill_in 'Password', with: 'password'
            fill_in 'Password confirmation', with: 'wrongpassword'
    
         click_button 'Sign up'
    
         expect(page).to have_content "Password confirmation doesn't match Password"
        end
      
      it 'requires password to be at least 6 characters ' do
        visit new_user_registration_path
        fill_in 'Email', with: 'newuser@colgate.edu'
        fill_in 'Password', with: 'p'
        fill_in 'Password confirmation', with: 'p'
        click_button 'Sign up'
        expect(page).to have_content 'Password is too short (minimum is 6 characters)'
      end
    end
    it 'should be able to tell who an admin is' do 
        user = User.create!(email: 'admin@colgate.edu', password: 'admin_password', admin: true)
        expect(user.admin).to be true
    end
    it 'should default to admin being false if not specified' do 
        user = User.create!(email: 'admin@colgate.edu', password: 'admin_password')
        expect(user.admin).to be false
    end



end