FactoryBot.define do
  factory :participant do
    email { Faker::Internet.email }
  end
end
