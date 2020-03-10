# This will guess the User class
FactoryBot.define do
  sequence(:question_title) { |n| "Question Title ##{n}" }
  sequence(:question_body) { |n| "Question Body ##{n}" }

  factory :question do
    title { generate :question_title }
    body { generate :question_body }

    trait :invalid do
      body { nil }
    end
  end
end
