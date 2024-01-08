class Site < ApplicationRecord
  belongs_to :region
  has_many :users
  has_many :handovers
end
