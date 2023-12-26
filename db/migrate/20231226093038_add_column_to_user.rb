class AddColumnToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :region_id, :integer
    add_column :users, :site_id, :integer
  end
end
