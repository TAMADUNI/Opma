require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_length_of(:password).is_at_least(3).on(:create) }
    it { should validate_length_of(:password).is_at_most(20).on(:create) }
    it { should validate_length_of(:email).is_at_most(20).on(:create) }
    it { should validate_length_of(:email).is_at_least(8).on(:create) }
  end

end
