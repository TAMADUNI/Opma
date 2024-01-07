class Handover < ApplicationRecord
  belongs_to :user
  enum acceptance_status: { pending: 0, accepted: 1, rejected: 2 }
end
