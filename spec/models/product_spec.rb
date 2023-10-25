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

    it 'should call the right underlying ActiveRecord method to do default sort' do
      expect(Product).to receive(:order).with(eq('name').or(eq(:name)))
      Product.sorted_by('name')
    end

    it 'should call the right underlying ActiveRecord method to sort by price' do
      expect(Product).to receive(:order).with(eq('price').or(eq(:price)))
      Product.sorted_by('price')
    end

    it 'should call the right underlying ActiveRecord method to sort by size' do
      expect(Product).to receive(:order).with(eq('size').or(eq(:size)))
      Product.sorted_by('size')
    end

    it 'should handle the situation when a bogus sort column is given' do
      expect(Product).to receive(:order).with(eq('name').or(eq(:name)))
      Product.sorted_by('bogus_column')
    end

    it 'should handle the situation when a nil column name is given' do
      expect(Product).to receive(:order).with(eq('name').or(eq(:name)))
      Product.sorted_by(nil)
    end
  end
end
