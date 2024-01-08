class RemoveColumnToHandovers < ActiveRecord::Migration[7.1]
  def up
    remove_column :handovers, :acceptance_status, :boolean
  end

  def down
    add_column :handovers, :acceptance_status, :boolean
  end
end
