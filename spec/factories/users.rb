# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :user do
    provider "twitter"
    uid { Faker::Number.number(7) }
    name { Faker::Internet.user_name }

    after(:build) do |user|
      [:first_task, :second_task, :third_task].each do |task|
        user.tasks << FactoryGirl.build(:task, 
          name: task, user: user)
      end
    end
  end
end

