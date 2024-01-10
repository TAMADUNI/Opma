class Task < ApplicationRecord
    enum line_status: [:running, :off_production]
    has_and_belongs_to_many :lines
end
