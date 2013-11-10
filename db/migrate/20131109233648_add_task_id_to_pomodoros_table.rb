class AddTaskIdToPomodorosTable < ActiveRecord::Migration
  
  def change
    add_column :pomodoros, :task_id, :integer
  end


end
