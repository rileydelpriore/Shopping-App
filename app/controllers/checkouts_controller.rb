# class checkoutscontroller
class CheckoutsController < ApplicationController
  def show
    @cart = current_user.cart
    @cart = Cart.create(user: current_user) if @cart.nil?
    @checkout = Checkout.create(cart: @cart)
    @cart_products = @cart.products
    @total_price = @cart.products.sum('price')
  end

  def checkout
    @cart = current_user.cart
    @cart = Cart.create(user: current_user) if @cart.nil?
    @cart_products = @cart.products
    @cart_products.each(&:destroy)
  end
end
