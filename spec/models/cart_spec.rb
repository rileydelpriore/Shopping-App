require 'rails_helper'

RSpec.describe Cart, type: :model do
  context 'check attributes and methods' do
    it 'should be able to create a cart object which has the correct methods on it' do
      user4 = User.create!(email: "o@colgate.edu", password: "password")
      p = Product.create!(description: 'Plain white t-shirt', size: 'L', condition: 'New', brand: 'Target',
                          price: 10.00, original_price: 20.00, user: user4)
      cart = Cart.new([p.id])
      expect(cart.product_ids).to eq([p.id])
    end

    it 'returns products based on provided product_ids' do
      user5 = User.create!(email: "r@colgate.edu", password: "password")
      p = Product.create!(description: 'Plain white t-shirt', size: 'L', condition: 'New', brand: 'Target',
                          price: 10.00, original_price: 20.00, user: user5)
      cart = Cart.new([p.id])
      expect(cart.products).to eq([p])
    end

    it 'calculates the total price of products in the cart' do
      user6 = User.create!(email: "e@colgate.edu", password: "password")
      p1 = Product.create!(description: 'Plain white t-shirt', size: 'L', condition: 'New', brand: 'Target',
                          price: 10.00, original_price: 20.00, user: user6)
      p2 = Product.create!(description: 'Plain black t-shirt', size: 'L', condition: 'New', brand: 'Target',
                          price: 20.00, original_price: 20.00, user: user6)
      cart = Cart.new([p1.id, p2.id])
      expect(cart.total_price).to eq(10 + 20)
    end

    it 'returns 0 if there are no products in the cart' do
      cart = Cart.new
      expect(cart.total_price).to eq(0)
    end
  end
end
