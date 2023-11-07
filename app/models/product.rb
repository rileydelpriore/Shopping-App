# frozen_string_literal: true

# Product Model
class Product < ApplicationRecord
  validates :description, :size, :condition, :brand, :price, :original_price, presence: true

  has_one_attached :photo

  def self.sorted_by(field)
    case field
    when 'Price: Low to High'
      Product.order(price: :asc)
    when 'Price: High to Low'
      Product.order(price: :desc)
    when 'Size: Small to Large'
      Product.order(size: :desc)
    when 'Size: Large to Small'
      Product.order(size: :asc)
    when 'Newest'
      Product.order(created_at: :desc)
    else
      Product.all
    end
  end

  def discount?
    return 0 if price >= original_price

    ((original_price - price) / original_price * 100).round(2)
  end
end
