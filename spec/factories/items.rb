FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    explanation { Faker::Lorem.sentence }
    category_id { 10 }
    status_id { 7 }
    ship_fee_id { 3 }
    ship_from_id { 48 }
    num_day_id { 4 }
    price { 1234567 }
    association :user
  end
end
