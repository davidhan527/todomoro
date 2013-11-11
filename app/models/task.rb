class Task < ActiveRecord::Base

  belongs_to :user
  has_many :pomodoros
  has_many :tags, through: :pomodoros

  validates :name, presence: true
end
