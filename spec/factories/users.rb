FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials }
    email { Faker::Internet.email }
    password { '111111a' }
    password_confirmation { password }
    first_name { 'テスト' }
    last_name  { 'テスト' }
    first_name_kana { 'テスト' }
    last_name_kana { 'テスト' }
    birthday { Faker::Date.birthday }
  end
end
