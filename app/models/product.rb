# frozen_string_literal: true

# Product Model
class Product < ApplicationRecord
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
    (price / original_price) * 100
  end
end
