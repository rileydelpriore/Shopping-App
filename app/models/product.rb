# frozen_string_literal: true

# Product Model
class Product < ApplicationRecord
  def self.sorted_by(field)
    field = field.to_s
    Product.order(field.to_sym) if %w[size price].include?(field)
    Product.order('created_at DESC')
  end
end
