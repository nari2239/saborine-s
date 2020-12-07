require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it 'ニックネーム、メールアドレス、パスワード、パスワード確認が正しく入力されていれば、ユーザー新規登録ができる' do
        
      end
    end

    context '新規登録ができないとき' do
      it 'ニックネームが空だとユーザーの新規登録ができない' do
        
      end
      it 'メールアドレスが空だとユーザーの新規登録ができない' do
        
      end
      it 'メールアドレスに＠がないとユーザーの新規登録ができない' do
      
      end
      it '既に登録済のメールアドレスだとユーザーの新規登録ができない' do
        
      end
      it 'パスワードが空だとユーザーの新規登録ができない' do
        
      end
      it 'パスワードが6文字以上ないとユーザーの新規登録ができない' do
        
      end
      it 'パスワードが英字のみだとユーザーの新規登録ができない' do
        
      end
      it 'パスワードが数字のみだとユーザーの新規登録ができない' do
        
      end
      it 'パスワード確認が空だとユーザーの新規登録ができない' do
        
      end
      it 'パスワードとパスワード確認が一致しないとユーザーの新規登録ができない' do
        
      end
    end
  end
end
