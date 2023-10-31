# frozen_string_literal: true

# Product Model
class Product < ApplicationRecord

  def self.sorted_by(field)
    if column_names.include?(field)
      Product.order(field)
    else
      Product.order(created_at: :desc)
    end
  end
end
