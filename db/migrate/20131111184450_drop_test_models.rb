class DropTestModels < ActiveRecord::Migration
  def change
    drop_table :test_models
  end
end
