FactoryBot.define do
  factory :record do
    date  {Faker::Date.between(from: '2020-01-01', to: '2020-12-31')}
    time  {Faker::Number.between(from: 0, to: 100)}
    skip  {Faker::Lorem.characters(number: 100)}
    to_do {Faker::Lorem.characters(number: 100)}
    association :user
  end
end
