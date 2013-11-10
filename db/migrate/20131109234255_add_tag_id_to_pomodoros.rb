class AddTagIdToPomodoros < ActiveRecord::Migration
  
  def change
    add_column :pomodoros, :tag_id, :integer
  end


end
