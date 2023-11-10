class Cart < ApplicationRecord
  belongs_to :user
  has_one :checkout
  has_many :cart_products
  has_many :products, through: :cart_products
end
