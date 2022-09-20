class CreateAttends < ActiveRecord::Migration[7.0]
  def change
    create_table :attends do |t|

      t.timestamps
    end
  end
end
