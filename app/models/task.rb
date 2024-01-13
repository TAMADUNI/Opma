class Task < ApplicationRecord
    enum line_status: [:running, :off_production]
    enum startable: { can_start: 0, cannot_start: 1 }
    enum completable: { can_complete: 0, cannot_complete: 1 }
    has_and_belongs_to_many :lines

    def start!
      update(startable: :cannot_start)
    end
    
    def complete!
      update(completable: :cannot_complete)
    end

    def record_blobrates!
      # Logic to handle blobrate recording
      # Create Blobrate records or update associated Line models, etc.
    end
end
