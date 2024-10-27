FactoryBot.define do
  factory :item do
    category_id { Category.where.not(id: 1).sample.id }
    item_status_id { ItemStatus.where.not(id: 1).sample.id }
    prefecture_id { Prefecture.where.not(id: 1).sample.id }
    shipping_fee_id { ShippingFee.where.not(id: 1).sample.id }
    shipping_time_id  { ShippingTime.where.not(id: 1).sample.id }
    name { Faker::Commerce.product_name }
    price { Faker::Commerce.price(range: 300..9_999_999, as_string: true).to_i }
    item_comment { Faker::Lorem.sentence }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
