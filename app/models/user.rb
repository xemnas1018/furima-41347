class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, presence: true

  # validates :birthday, numericality: { other_than: "--","can't be blank" }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数字の両方を含めて設定して下さい'
  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々一]+\z/
  validates_format_of :first_name, :last_name, with: NAME_REGEX, message: 'は全角文字で入力して下さい'
  KANA_NAME_REGEX = /\A[ァ-ヶー]+\z/
  validates_format_of :first_name_kana, :last_name_kana, with: KANA_NAME_REGEX, message: 'は全角カタカナで入力して下さい'

  #アソシエーション
  has_many :items

end
