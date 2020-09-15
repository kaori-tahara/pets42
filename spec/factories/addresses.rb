FactoryBot.define do
  factory :address do
    zip { '000-0000' }
    city { Gimei.city.kanji }
    address { Faker::Address.street_address }
    phone_number { Faker::Number.number(digits: 11) }
    prefecture_id { Faker::Number.within(range: 2..48) }
    association :user
  end
end