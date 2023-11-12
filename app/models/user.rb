# class User < ApplicationRecord
class User < ApplicationRecord
  has_one :cart
  has_one :checkout, through: :cart
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true,
                    format: { with: /\A[^@\s]+@colgate\.edu\z/i, message: 'must be a Colgate email address' }

  def admin?
    admin
  end
end
