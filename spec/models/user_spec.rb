require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes ' do
    user = build(:user)
    except(user).to be_valid
  end
end
