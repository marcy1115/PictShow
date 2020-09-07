require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー会員登録機能' do
    context 'ユーザー会員登録ができる時' do
      it '全ての必須項目が入力されている時' do
        expect(@user).to be_valid
      end
      it 'ニックネームが20文字以内の時' do
        @user.nickname = 'a' * 20
        expect(@user).to be_valid
      end
      it 'メールアドレスに＠が含まれている時' do
        @user.email = 'test@yahoo.co.jp'
        expect(@user).to be_valid
      end
      it 'パスワードが半角英数字混合の時' do
        password = '1234567a'
        @user.password = password
        @user.password_confirmation = password
        expect(@user).to be_valid
      end
      it 'パスワードが8文字以上の時' do
        password = '1234zxcv'
        @user.password = password
        @user.password_confirmation = password
        expect(@user).to be_valid
      end
    end
    context 'ユーザー会員登録ができない時' do
      it 'ニックネームがnilの時' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'ニックネームが21文字以上の時' do
        @user.nickname = 'a' * 21
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 20 characters)")
      end
      it '不正なメールアドレス(@が含まれない)の時' do
        @user.email = 'test123.yahoo.co.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'メールアドレスがすでに使われている時' do
        @user.save
        second_user = FactoryBot.build(:user, email: @user.email )
        second_user.valid?
        expect(second_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'パスワードが7文字以下の時' do
        password = '1234abc'
        @user.password = password
        @user.password_confirmation = password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
      end
      it 'パスワードが半角英数字混合ではない時' do
        password = '12345678'
        @user.password = password
        @user.password_confirmation = password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
      end
      it 'パスワードと確認用パスワードが同一ではない時' do
        password = '1234zxcv'
        @user.password = password
        @user.password_confirmation = password + 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '性別が選択されていない時' do
        @user.sexuality = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Sexuality can't be blank")
      end
      it '生年月日がnilの時' do
        @user.birth = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end
