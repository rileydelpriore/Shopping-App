# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'check attributes and methods' do
    it 'should be able to create a Product object which has the correct methods on it' do
      p = Product.create!(description: 'Plain white t-shirt', size: 'L', condition: 'New', brand: 'Target',
                          price: 10.00, original_price: 20.00, seller: 'Chase')
      expect(p).to respond_to :description
      expect(p).to respond_to :size
      expect(p).to respond_to :condition
      expect(p).to respond_to :brand
      expect(p).to respond_to :price
      expect(p).to respond_to :original_price
      expect(p).to respond_to :seller
      expect(p).to respond_to :photo
    end
  end

  context 'the sorted_by method' do
    it 'should exist' do
      expect(Product).to respond_to(:sorted_by)
    end

    it 'should call the right underlying ActiveRecord method to sort by price low to high' do
      expect(Product).to receive(:order).with(eq('price: :asc').or(eq(price: :asc)))
      Product.sorted_by('Price: Low to High')
    end

    it 'should call the right underlying ActiveRecord method to sort by price high to low' do
      expect(Product).to receive(:order).with(eq('price: :desc').or(eq(price: :desc)))
      Product.sorted_by('Price: High to Low')
    end

    it 'should call the right underlying ActiveRecord method to sort by size small to large' do
      expect(Product).to receive(:order).with(eq('size: :desc').or(eq(size: :desc)))
      Product.sorted_by('Size: Small to Large')
    end

    it 'should call the right underlying ActiveRecord method to sort by size large to small' do
      expect(Product).to receive(:order).with(eq('size: :asc').or(eq(size: :asc)))
      Product.sorted_by('Size: Large to Small')
    end

    it 'should call the right underlying ActiveRecord method to sort by newest' do 
      expect(Product).to receive(:order).with(eq('created_at: :desc').or(eq(created_at: :desc)))
      Product.sorted_by('Newest')
    end

    it 'should handle the situation when a bogus sort column is given' do
      expect(Product).to receive(:all)
      Product.sorted_by('bogus_column')
    end

    it 'should handle the situation when a nil column name is given' do
      expect(Product).to receive(:all)
      Product.sorted_by(nil)
    end
  end

  context 'the discount? method' do
    it 'should exist' do
      p = Product.create!(description: 'Plain white t-shirt', size: 'L', condition: 'New', brand: 'Target',
                          price: 10.00, original_price: 20.00, seller: 'Chase')
      expect(p).to respond_to(:discount?)
    end
    it 'should return the discount the seller is offering' do
      p = Product.create!(description: 'Plain white t-shirt', size: 'L', condition: 'New', brand: 'Target',
                          price: 10.00, original_price: 20.00, seller: 'Chase')
      expect(p.discount?).to eq(50)
    end


  end
end
