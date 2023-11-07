class CreateCartJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :users, :products do |t|
      # t.index [:user_id, :product_id]
      t.index [:product_id, :user_id], unique: true
    end
  end
end
