class RemovePasswordFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :password
    remove_column :users, :email
    add_column :users, :encrypted_password, :string, null: false, default: ""
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
    add_column :users, :remember_created_at, :datetime
    add_column :users,:email,:string, null: false, default: ""
    add_column :users,:admin,:boolean, default: false
    
    add_index :users, :email, unique: true

  end
end
