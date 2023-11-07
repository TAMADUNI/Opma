require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes ' do
    user = build(:user)
    except(user).to be_valid
  end

  it 'is not valid without an email' do
    user = build(:user, email: nil)
    except(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user = build(:user, password: nil)
    except(user).to_not be_valid
  end

  it 'is not valid with a duplicate email' do
    existing_user = user.create(:user, email: "sample@example.com")
    user = user.build(:user, email: "sample@example.com")
    expect(user).to_not be_valid
  end

  it 'is valid with a unique email' do
    existing_user = user.create(:user, email: "sample@example.com")
    user = user.build(:user, email: "uniq@example.com")
    expect(user).to be_valid
  end
end
