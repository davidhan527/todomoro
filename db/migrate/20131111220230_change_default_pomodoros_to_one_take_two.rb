class ChangeDefaultPomodorosToOneTakeTwo < ActiveRecord::Migration
  def change
    change_column_default :pomodoros, :tomato, 1
  end
end
