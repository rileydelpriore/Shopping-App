# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :seller
      t.string :size
      t.text :description
      t.string :condition
      t.string :brand
      t.decimal :price, precision: 10, scale: 2
      t.decimal :original_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
