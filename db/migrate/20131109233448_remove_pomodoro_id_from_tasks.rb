class RemovePomodoroIdFromTasks < ActiveRecord::Migration
  def up
    remove_column :tasks, :pomodoro_id
  end

  def down
    add_column :tasks, :pomodoro_id, :integer
  end
end
