require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it 'ニックネーム、メールアドレス、パスワード、パスワード確認が正しく入力されていれば、ユーザー新規登録ができる' do
       expect(@user).to be_valid
      end
    end

    context '新規登録ができないとき' do
      it 'ニックネームが空だとユーザーの新規登録ができない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'メールアドレスが空だとユーザーの新規登録ができない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'メールアドレスに＠がないとユーザーの新規登録ができない' do
        @user.email = "example"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it '既に登録済のメールアドレスだとユーザーの新規登録ができない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'パスワードが空だとユーザーの新規登録ができない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードが6文字以上ないとユーザーの新規登録ができない' do
        @user.password = "a1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'パスワードが英字のみだとユーザーの新規登録ができない' do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードが不正な値です。英字と数字の両方を含めてください。")
      end
      it 'パスワードが数字のみだとユーザーの新規登録ができない' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードが不正な値です。英字と数字の両方を含めてください。")
      end
      it 'パスワード確認が空だとユーザーの新規登録ができない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'パスワードとパスワード確認が一致しないとユーザーの新規登録ができない' do
        @user.password = "a12345"
        @user.password_confirmation ="a123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
end
