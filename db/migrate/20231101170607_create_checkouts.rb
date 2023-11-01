class CreateCheckouts < ActiveRecord::Migration[7.1]
  def change
    create_table :checkouts do |t|
      t.decimal :total, precision: 10, scale: 2

      t.timestamps
    end
  end
end
