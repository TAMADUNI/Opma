class AddColumnToHandovers < ActiveRecord::Migration[7.1]
  def change
    add_column :handovers, :status, :integer
  end
end
