# class CartsController < ApplicationController
class CartsController < ApplicationController
  before_action :authenticate_user!
  def show
    @cart = current_user.cart || Cart.create(user: current_user)
    @total_price = @cart.products.sum('price')
    @cart_products = @cart.products
  end

  def add_to_cart
    product = Product.find(params[:product_id])
    cart = current_user.cart || Cart.create(user: current_user)
    if cart.products.include?(product)
      flash[:notice] = 'This product is already in your cart.'
    else
      cart.products << product
      flash[:notice] = 'Product successfully added to cart.'
    end

    redirect_to product_path(product)
  end

  def remove_from_cart
    product = Product.find(params[:product_id])
    current_user.cart&.products&.delete(product)
    flash[:notice] = 'Product removed from cart.'
    redirect_to cart_path(current_user.cart)
  end
end
