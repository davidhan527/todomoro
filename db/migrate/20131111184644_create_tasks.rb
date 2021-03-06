class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :completed, default: false
      t.integer :pomodoro_id
      t.integer :user_id

      t.timestamps
    end
  end
end
