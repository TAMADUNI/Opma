class Department < ApplicationRecord
  has_many :users
  has_many :regions
  belongs_to :manager, class_name: 'User', optional: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
