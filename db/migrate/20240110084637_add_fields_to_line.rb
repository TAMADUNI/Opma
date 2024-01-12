class AddFieldsToLine < ActiveRecord::Migration[7.1]
  def change
    add_column :lines, :status, :integer
    add_column :lines, :maintenance_type, :integer
  end
end
