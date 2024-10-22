FactoryBot.define do
  factory :item do
    category_id { Category.all.reject { |category| category.id == 1 }.sample.id }
    item_status_id { ItemStatus.all.reject { |item_status| item_status.id == 1 }.sample.id }
    prefecture_id { Prefecture.all.reject { |prefecture| prefecture.id == 1 }.sample.id }
    shipping_fee_id { ShippingFee.all.reject { |shipping_fee| shipping_fee.id == 1 }.sample.id }
    shipping_time_id { ShippingTime.all.reject { |shipping_time| shipping_time.id == 1 }.sample.id }
    name { Faker::Commerce.product_name }
    price { Faker::Commerce.price(range: 300..9_999_999, as_string: true).to_i }
    item_comment { Faker::Lorem.sentence }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
