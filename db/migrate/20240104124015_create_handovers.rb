class CreateHandovers < ActiveRecord::Migration[7.1]
  def change
    create_table :handovers do |t|
      t.text :activities
      t.float :blob_rates
      t.float :ejection_rates
      t.text :pending_issues
      t.references :user, null: false, foreign_key: true
      t.boolean :acceptance_status
      t.text :comments

      t.timestamps
    end
  end
end
