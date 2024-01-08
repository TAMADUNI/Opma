class Handover < ApplicationRecord
  belongs_to :user
  belongs_to :site
  enum :status, [:pending, :accepted, :rejected]
end
