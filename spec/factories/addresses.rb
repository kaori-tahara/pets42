FactoryBot.define do
  factory :address do
    zip { '000-0000' }
    city { Gimei.city.kanji }
    phone { Faker::Number.number(digits: 11) }
    prefecture_id { Faker::Number.within(range: 2..48) }
    association :user
  end
end
