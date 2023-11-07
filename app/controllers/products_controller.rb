# frozen_string_literal: true

# Controller for clothing products
class ProductsController < ApplicationController
  def index
    @products = Product.all
    if params[:sort_by].present?
      session[:sort_by] = params[:sort_by]
      @products = Product.sorted_by(session[:sort_by])
    elsif session[:sort_by].present?
      @products = Product.sorted_by(session[:sort_by])
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(create_update_params)

    @product.photo.attach(params[:product][:photo]) if params[:product][:photo].present?

    if @product.save
      flash[:notice] = 'Item successfully uploaded'
      redirect_to products_path and return
    else
      flash[:alert] = 'Upload failed'
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def create_update_params
    params.require(:product).permit(:description, :size, :condition, :brand, :price, :original_price, :photo)
  end
end
