FactoryBot.define do
  factory :purchase_address do
    token { 0x00007f8e9f695110 }
    zip_code { '123-4567' }
    prefecture { 2 }
    city { '札幌市' }
    address1 { '本町1ー1' }
    address2 { 'レジデンス青山302' }
    phone_num { '08012345678' }
  end
end
