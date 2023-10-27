# frozen_string_literal: true

# Controller for clothing products
class ProductsController < ApplicationController
  def index
    session[:sort] = params[:sort] || session[:sort]
    @products = Product.sorted_by(session[:sort])
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(create_update_params)
    if @product.save
      flash[:notice] = "Item successfully uploaded"
      redirect_to products_path and return
    else
      flash[:alert] = "Upload failed"
      render 'new', status: :unprocessable_entity
    end
  end

  private
  def create_update_params
    params.require(:product).permit(:description, :size, :condition, :brand, :price, :original_price)
  end

end
