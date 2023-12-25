class CreateUserSites < ActiveRecord::Migration[7.1]
  def change
    create_table :user_sites do |t|
      t.integer :user_id
      t.integer :site_id

      t.timestamps
    end
  end
end
