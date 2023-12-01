require 'rails_helper'

RSpec.describe Cart, type: :model do
  context 'check attributes and methods' do
    it 'should be able to create a cart object which has the correct methods on it' do
      user4 = User.create!(email: "o@colgate.edu", password: "password")
      p = Product.create!(description: 'Plain white t-shirt', size: 'L', condition: 'New', brand: 'Target',
                          price: 10.00, original_price: 20.00, user: user4)
      cart = Cart.new
      cart.products << p 
                          
      expect(cart.product_ids).to eq([p.id])
    end

    

    it 'adds multiple products to cart' do
      user6 = User.create!(email: "e@colgate.edu", password: "password")
      p1 = Product.create!(description: 'Plain white t-shirt', size: 'L', condition: 'New', brand: 'Target',
                          price: 10.00, original_price: 20.00, user: user6)
      p2 = Product.create!(description: 'Plain black t-shirt', size: 'L', condition: 'New', brand: 'Target',
                          price: 20.00, original_price: 20.00, user: user6)
      cart = Cart.new(user_id: user6)
      cart.products << p1 
      cart.products << p2 
      expect(cart.product_ids).to eq([p1.id, p2.id])
      
    end

    
  end
end
