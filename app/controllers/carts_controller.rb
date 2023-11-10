class CartsController < ApplicationController
  def show
    @cart_product_ids = session[:cart] || []
    @cart_products = Product.where(id: @cart_product_ids)
    @total_price = calculate_total_price(@cart_products)
  end

  def calculate_total_price(products)
    products.sum(&:price)
  end

  def remove_from_cart
    product = Product.find(params[:id])
    session[:cart].delete(product.id) if session[:cart]
    redirect_to cart_path, notice: 'Product removed from cart.'
  end
end