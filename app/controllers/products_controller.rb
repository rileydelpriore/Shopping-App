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
end
