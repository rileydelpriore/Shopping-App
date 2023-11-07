# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.delete_all

Product.create!(description: 'Plain white t-shirt', size: 'L', condition: 'New', brand: 'Target', price: 10.00,
                original_price: 20.00, seller: 'Chase')
Product.create!(description: 'Blue jeans', size: 'M', condition: 'Used', brand: 'Levi', price: 60.00,
                original_price: 80.00, seller: 'Chase')
Product.create!(description: 'Green sweatshirt', size: 'S', condition: 'New', brand: 'Arie', price: 25.00,
                original_price: 30.00, seller: 'Chase')
Product.create!(description: 'Dress', size: 'M', condition: 'Fairly used', brand: 'Goodwill', price: 2.00,
                original_price: 5.00, seller: 'Chase')
