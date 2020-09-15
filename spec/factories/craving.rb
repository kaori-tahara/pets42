FactoryBot.define do
  factory :craving do
    experience_id { "2" }
    working_hour_id { "2" }
    working_date { "20200904" }
    working_time_id { "2" }
    title {Faker::Lorem.sentence }
    text {Faker::Lorem.sentence }
    association :user
  end
end