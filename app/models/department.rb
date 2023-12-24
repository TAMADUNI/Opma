class Department < ApplicationRecord
  has_many :users
  belongs_to :manager, class_name: 'User', optional: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
