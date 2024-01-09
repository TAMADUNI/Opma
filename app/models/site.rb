class Site < ApplicationRecord
  belongs_to :region
  has_many :users, through: :user_sites
  has_many :handovers
  has_many :lines
end
