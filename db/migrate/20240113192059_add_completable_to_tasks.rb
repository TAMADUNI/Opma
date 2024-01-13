class AddCompletableToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :completable, :integer
  end
end
