class Tag < ActiveRecord::Base

  has_many :pomodoros
  has_many :tasks, through: :pomodoros
  validates :name, presence: true
end
