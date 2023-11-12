# class Cart < ApplicationRecord
class Cart < ApplicationRecord
  belongs_to :user
  has_one :checkout
  has_many :cart_products
  has_many :products, through: :cart_products

  attr_accessor :product_ids

  # initialize user data -- to be changed once login is implemented
  def initialize(product_ids = [])
    self.product_ids = product_ids
  end

  def products
    Product.where(id: product_ids)
  end

  def total_price
    products.sum(&:price)
  end
end
