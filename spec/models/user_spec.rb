require 'rails_helper'

RSpec.describe User, type: :model do
  # let(:user) { build(:user) }
  it 'is valid with valid attributes ' do
    user = create(:user)
    expect(user).to be_valid
  end

  it 'is not valid without an email' do
    user = build(:user, email: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user = build(:user, password: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid with a duplicate email' do
    existing_user = user.create(:user, email: 'sample@example.com')
    user = user.build(:user, email: 'sample@example.com')
    expect(user).to_not be_valid
  end

  it 'is valid with a unique email' do
    existing_user = user.create(:user, email: 'sample@example.com')
    user = user.build(:user, email: 'uniq@example.com')
    expect(user).to be_valid
  end
end
