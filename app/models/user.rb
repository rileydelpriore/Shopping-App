class User < ApplicationRecord
    has_one :cart
    has_one :checkout, through: :cart
end
