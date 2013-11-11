# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pomodoro do
    association :task
    association :tag
    tomato 1
  end
end
