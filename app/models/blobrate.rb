class Blobrate < ApplicationRecord
  belongs_to :line
  belongs_to :line
  validates :percentage, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

end
