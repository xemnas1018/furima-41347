require 'rails_helper'

RSpec.describe HistoryShipping, type: :model do
  before do 
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @user.id)
    @history_shipping = FactoryBot.build(:history_shipping, user_id: @user.id,item_id: @item.id)
  end
  describe "商品購入機能"
    context "入力居ないように不備がない場合"
      it "必要な値が全て正しく入力されていれば保存できる" do
        binding.pry
        expect(@history_shipping).to be_valid
      end


end
