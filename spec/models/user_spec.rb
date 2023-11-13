require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when user is an admin' do
    it 'returns true' do
      user = User.new(admin: true)
      expect(user.admin?).to be_truthy
    end
  end

  context 'when user is not an admin' do
    it 'returns false' do
      user = User.new(admin: false)
      expect(user.admin?).to be_falsy
    end
  end
end
