class CreateBlobrates < ActiveRecord::Migration[7.1]
  def change
    create_table :blobrates do |t|
      t.references :line, null: false, foreign_key: true
      t.float :percentage
      t.datetime :recorded_at

      t.timestamps
    end
  end
end
