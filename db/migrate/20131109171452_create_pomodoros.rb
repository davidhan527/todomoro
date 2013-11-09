class CreatePomodoros < ActiveRecord::Migration
  def change
    create_table :pomodoros do |t|
      t.integer :tomato

      t.timestamps
    end
  end
end
