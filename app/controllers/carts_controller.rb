class CartsController < ApplicationController
  def show
    @cart = Cart.new(session[:cart] || [])
    @total_price = @cart.total_price
    @cart_products = @cart.products
  end
  
  def remove_from_cart
    product = Product.find(params[:id])
    session[:cart].delete(product.id) if session[:cart]
    redirect_to cart_path, notice: 'Product removed from cart.'
  end
end