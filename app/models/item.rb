class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :prefecture
  belongs_to :shipping_fee
  belongs_to :shipping_time

  belongs_to :user
  has_one_attached :image

  validates :name, :item_comment, :price, :image, presence: true

  # 選択項目が「---」の時は保存できないようにする
  validates :category_id, :item_status_id, :shipping_time_id, :shipping_fee_id,
            :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  # 価格は300円以上9999999円以下の半角数字
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  PRICE_REGEX = /\A[0-9]+\z/
  validates_format_of :price, with: PRICE_REGEX
end
