FactoryGirl.define do
  factory :store do
    name { Faker::Food.spice }
    description { Faker::Lorem.paragraph }
    address { Faker::Address.city }
  end
end
