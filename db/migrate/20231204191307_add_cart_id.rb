class AddCartId < ActiveRecord::Migration[7.1]
  def change
    add_reference :checkouts, :cart, foreign_key: true
  end
end
