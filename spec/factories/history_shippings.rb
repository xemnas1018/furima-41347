FactoryBot.define do
  factory :history_shipping do
    postal_code {Faker::Number.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s}
    address {Faker::Address.city}
    house_num {Faker::Address.street_address}
    phone_num {Faker::PhoneNumber.cell_phone.gsub(/\D/, '')[0..10]}
    prefecture_id {Prefecture.where.not(id: 1).sample.id }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
