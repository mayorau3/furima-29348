FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 8)
    password {password}
    password_confirmation {password}
    kanji_family_name {"名字かんじゼンカク"}
    kanji_first_name {"名まえテスト"}
    kana_family_name {"ミョウジ"}
    kana_first_name {"ナマエ"}
    birth_date {"2000-12-31"}
  end
end