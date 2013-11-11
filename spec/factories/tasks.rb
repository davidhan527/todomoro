# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :task do
    association :user
    name { Faker::Company.bs }
    completed true

    factory :first_task, parent: :task do
      name 'first'
    end

    factory :second_task, parent: :task do
      name 'second'
    end

    factory :third_task, parent: :task do
      name 'third'
    end
  end
end