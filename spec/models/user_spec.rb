require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context "新規登録できるとき" do
      it "必要な情報が全て存在すれば登録できる" do
        @user.valid?
      end
    end

    context "新規登録できないとき" do
      it "ニックネームが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "メールアドレスが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end 
      it "既に登録済みのメールアドレスでは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスに@が含まれていないと登録できない" do
        @user.email = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "パスワードが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password","Password は英字と数字の両方を含めて設定して下さい")
      end
      it "パスワードが5文字以下では登録できない" do
        @user.password = "1111a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")
      end
      it "パスワードが半角英数字混在でない場合は登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password は英字と数字の両方を含めて設定して下さい")
      end
      it "パスワードとパスワード(確認)が異なる場合は登録できない" do
        @user.password_confirmation = "22222b"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "お名前(全角)は名字が無ければ登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "お名前(全角)は名名前が無ければ登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "お名前(全角)は全角文字で入力されていなければ登録できない" do
        @user.first_name = "ﾃｽﾄ"
        @user.last_name = "ﾃｽﾄ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角文字で入力して下さい", "Last name は全角文字で入力して下さい")
      end
      it "お名前カナ(全角)は名字が無ければ登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "お名前カナ(全角)は名名前が無ければ登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "お名前カナ(全角)は全角(カタカナ)で入力されていなければ登録できない" do
        @user.first_name_kana = "ﾃｽﾄ"
        @user.last_name_kana = "ﾃｽﾄ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana は全角カタカナで入力して下さい", "Last name kana は全角カタカナで入力して下さい")
      end
      it "生年月日が空では登録できない" do
        @user = FactoryBot.build(:user, birthday: nil)
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
