# frozen_string_literal: true

# Product Model
class Product < ApplicationRecord
  def self.sorted_by(field)
    field = field.to_s
    if %w[size price].include?(field)
      Product.order(field.to_sym)
    end
    Product.order("created_at DESC")
  end
end
