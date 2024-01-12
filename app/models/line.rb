class Line < ApplicationRecord
  enum status: [:running, :off_production]
  enum maintenance_type [:regular, :planned]
  belongs_to :site
  has_and_belongs_to_many :tasks
end
