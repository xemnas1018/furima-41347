require 'rails_helper'
RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe "商品出品機能" do
    context "商品が出品できるとき" do
      it "必要な情報が全て存在すれば出品できる" do
      end
      it "ログイン状態の場合に商品出品ページへ遷移できる" do
      end
      it "カテゴリーは初期値に---が設定されている" do
      end
      it "カテゴリーは11項目が表示される" do
      end
      it "商品の状態は初期値に---が設定されている" do
      end
      it "商品状態は7項目が表示される" do
      end
      it "発送元の地域は---が初期値に設定されている" do
      end
      it "発送元の地域は48項目が表示される" do
      end
      it "発送までの日数は初期値に---が設定されている" do
      end
      it "発送までの日数は4項目が表示される" do
      end
    end

    context "商品が出品できないとき" do
      it "ログアウト状態では商品出品ページへ遷移できない" do
      end 
      it "商品画像が１枚付いていなければ出品できない" do
      end
      it "商品名が無ければ出品できない" do
      end
      it "商品説明が無ければ出品できない"do
      end
      it "カテゴリー情報が選択されていないと出品できない" do
      end
      it "商品状態が選択されていないと出品できない" do
      end
      it "配送料の負担が選択されていないと出品できない" do
      end
      it "発送元の地域が選択されていないと出品できない" do
      end
      it "発送までの日数が選択されていないと出品できない" do
      end
      it "価格が無ければ出品できない" do
      end
      it "価格が300円未満では出品できない" do
      end
      it "価格が9999999円より高いと出品できない" do
      end
      it "価格が半角出ないと出品できない" do
      end
    end
  end
end