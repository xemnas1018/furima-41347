require 'rails_helper'

RSpec.describe HistoryShipping, type: :model do
  before do 
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @history_shipping = FactoryBot.build(:history_shipping, user_id: @user.id,item_id: @item.id)
    sleep(0.1)
  end
  describe "商品購入機能" do
    context "入力内容に不備がない場合" do
      it "必要な値が全て正しく入力されていれば保存できる" do
        expect(@history_shipping).to be_valid
      end
      
      it "building_nameが空でも保存できる" do
        @history_shipping.building_name = ""
        expect(@history_shipping).to be_valid
      end
    end

    context "入力内容に不備がある場合" do
      it "postal_codeが空では保存できない" do
        @history_shipping.postal_code = ""
        @history_shipping.valid?
        expect(@history_shipping.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeが7桁の数字のみでは保存できない" do
        @history_shipping.postal_code = "1234567"
        @history_shipping.valid?
        expect(@history_shipping.errors.full_messages).to include( "Postal code is invalid. Include hyphen(-)")
      end
      it "postal_codeのハイフン以前が数字3桁以外では保存できない" do 
        @history_shipping.postal_code = "12-4567"
        @history_shipping.valid?
        expect(@history_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "postal_codeのハイフン以降が数字4桁以外では保存できない" do 
        @history_shipping.postal_code = "123-456"
        @history_shipping.valid?
        expect(@history_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "prefecture_idが空では保存できない" do
        @history_shipping.prefecture_id = nil
        @history_shipping.valid?
        expect(@history_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      
      it "prefecture_idが0では保存できない" do
        @history_shipping.prefecture_id = nil
        @history_shipping.valid?
        expect(@history_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "addressが空では保存できない" do
        @history_shipping.address = ""
        @history_shipping.valid?
        expect(@history_shipping.errors.full_messages).to include("Address can't be blank")
      end
      
      it "house_numが空では保存できない" do
        @history_shipping.house_num = ""
        @history_shipping.valid?
        expect(@history_shipping.errors.full_messages).to include("House num can't be blank")
      end

      it "phone_numが空では保存できない" do
        @history_shipping.phone_num = ""
        @history_shipping.valid?
        expect(@history_shipping.errors.full_messages).to include("Phone num can't be blank")
      end

      it "phone_numが数字以外の文字を含む場合では保存できない" do
        @history_shipping.phone_num = "012-3456-7890"
        @history_shipping.valid?
        expect(@history_shipping.errors.full_messages).to include("Phone num must be at least 10 digits and no more than 11 digits")
      end

      it "phone_numが12桁以上の数字では保存できない" do
        @history_shipping.phone_num = "012345678901"
        @history_shipping.valid?
        expect(@history_shipping.errors.full_messages).to include("Phone num must be at least 10 digits and no more than 11 digits")
      end

      it "phone_numが9桁以下の数字では保存できない" do
        @history_shipping.phone_num = "012345678"
        @history_shipping.valid?
        expect(@history_shipping.errors.full_messages).to include("Phone num must be at least 10 digits and no more than 11 digits")
      end

      it "紐づくuser_idが無ければ保存できない" do
        @history_shipping.user_id = nil
        @history_shipping.valid?
        expect(@history_shipping.errors.full_messages).to include("User can't be blank")
      end

      it "紐づくitem_idが無ければ保存できない" do
        @history_shipping.item_id = nil
        @history_shipping.valid?
        expect(@history_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
