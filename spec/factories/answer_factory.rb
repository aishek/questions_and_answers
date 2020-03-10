# This will guess the User class
FactoryBot.define do
  sequence(:answer_body) { |n| "Answer Body ##{n}" }

  factory :answer do
    body { generate :answer_body }

    trait :invalid do
      body { nil }
    end
  end
end
