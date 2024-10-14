class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :prefecture
  belongs_to :shipping_fee
  belongs_to :Shipping_time
  belongs_to :user

  validates :name, :item_comment, :price, presence: true

  # 選択項目が「---」の時は保存できないようにする
  validates :category_id, :item_status_id, :shipping_time_id, :shipping_fee_id,
            :prefecture_id, numericality: {other_than: 1 ,message: "can't be blank" }
end
