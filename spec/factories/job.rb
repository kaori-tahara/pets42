FactoryBot.define do
  factory :job do
    title {Faker::Lorem.sentence }
    text {Faker::Lorem.sentence }
    dog_name { "イヌ" }
    dog_bleed { "柴犬" }
    dog_age { "2" }
    working_date { "20200904" }
    working_hour_id { "2" }
    working_time_id { "2" }
    association :user
  end
end