class CreateJoinTableTasksLines < ActiveRecord::Migration[7.1]
  def change
    create_join_table :tasks, :lines do |t|
      t.index [:task_id, :line_id]
      t.index [:line_id, :task_id]
    end
  end
end
