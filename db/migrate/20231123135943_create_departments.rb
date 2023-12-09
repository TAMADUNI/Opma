class CreateDepartments < ActiveRecord::Migration[7.1]
  def change
    create_table :departments do |t|
      t.string :name
      t.references :manager, null: false, foreign_key: { to_table: :users } 

      t.timestamps
    end
  end
end
