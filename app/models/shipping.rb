class Shipping < ApplicationRecord
  belongs_to :history
  belongs_to :prefecture
end
