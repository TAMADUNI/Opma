class CreateWorkSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :work_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true
      t.datetime :started_at
      t.datetime :completed_at

      t.timestamps
    end
  end
end
