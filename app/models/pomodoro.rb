class Pomodoro < ActiveRecord::Base
  
  belongs_to :task
  belongs_to :tag
  
end
