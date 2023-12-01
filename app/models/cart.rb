# class Cart < ApplicationRecord
class Cart < ApplicationRecord
  belongs_to :user
  has_one :checkout
  has_and_belongs_to_many :products
end
