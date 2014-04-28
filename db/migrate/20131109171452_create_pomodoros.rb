class CreatePomodoros < ActiveRecord::Migration
  def change
    create_table :pomodoros do |t|
      t.integer :tomato, default: 1
      t.integer :task_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
