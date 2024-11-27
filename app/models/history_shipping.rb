class HistoryShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :address, :house_num, :building_name, :phone_num, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone_num, format: { with: /\A[0-9]{10,11}\z/, message: 'must be at least 10 digits and no more than 11 digits' }
    validates :user_id, :item_id, :house_num, :address, :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    history = History.create(user_id:, item_id:)
    Shipping.create(postal_code:, prefecture_id:, phone_num:, address:,
                    house_num:, building_name:, history_id: history.id)
  end
end
