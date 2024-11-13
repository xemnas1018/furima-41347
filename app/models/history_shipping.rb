class HistoryShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :address, :house_num, :building_name, :phone_num, :history_id
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/,"is invalid. Include hyphen(-)"}
    validates :phone_num, format: {with: /\A[0-9]{10,11}\z/, message: "must be at least 10 digits and no more than 11 digits"}
    validates :user_id, :item_id, :history_id, :house_num, :address
  end
  validates :prefecture_id, numericality: {other_than:0, message: "can't be blank"}
  validates :building_name

  def save
    history = History.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, phone_num: phone_num, address: address, house_num: house_num, building_name: building_name, history_id: history.id )
  end

end