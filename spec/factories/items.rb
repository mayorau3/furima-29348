FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    explanation { Faker::Lorem.sentence }
    category_id { 10 }
    status_id { 7 }
    ship_fee_id { 3 }
    prefecture_id { 48 }
    num_day_id { 4 }
    price { 1_234_567 }
    association :user

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image1.png'), filename: 'test_image1.png')
      item.images.attach(io: File.open('public/images/test_image2.png'), filename: 'test_image2.png')
    end
  end
end
