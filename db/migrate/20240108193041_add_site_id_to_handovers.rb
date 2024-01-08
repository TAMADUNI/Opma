class AddSiteIdToHandovers < ActiveRecord::Migration[7.1]
  def change
    add_column :handovers, :site_id, :integer
  end
end
