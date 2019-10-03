FactoryBot.define do
  factory :place do
    title { Faker::Name.name }
    address { Faker::Address.city }
  end
end
