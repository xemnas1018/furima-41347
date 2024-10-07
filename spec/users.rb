FactoryBot.define do
  factory : user do
    nickname  {Faker::Name.initials}
    email  {Faker::Internet.email}
    password  {Faker::Internet.email}
    password_confirmation  {password}
    frist_name {"テスト"}
    last_name  {"テスト"}
    last_name_kana  {"テスト"}
    last_name_kana  {"テスト"}
    birthday  {2000/01/01}
  
  end
end