require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @record = FactoryBot.build(:record)
  end

  describe '記録の新規投稿' do
    context '新規投稿ができるとき' do
      it '日付、時間、「何してた？」、「何をすべきだった？」の入力欄を全て正しく入力できていれば新規投稿ができる' do
        expect(@record).to be_valid
      end
      it '「何してた？」の欄が空でも新規投稿ができる' do
        @record.skip = nil
        expect(@record).to be_valid
      end
      it '「何をすべきだった？」の欄が空でも新規投稿ができる' do
        @record.to_do = nil
        expect(@record).to be_valid
      end
    end

    context '新規投稿はできないとき' do
      it '日付が空だと新規投稿ができない' do
        @record.date = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("日付を入力してください")
      end
      it '日付の値が正しく入力されていないと新規投稿ができない(月が正しくない場合)' do
        @record.date = '2020-13-01'
        @record.valid?
        expect(@record.errors.full_messages).to include("日付を入力してください")
      end
      it '日付の値が正しく入力されていないと新規投稿ができない(日が正しくない場合)' do
        @record.date = '2020-01-32'
        @record.valid?
        expect(@record.errors.full_messages).to include("日付を入力してください")
      end
      it '日付が全角で入力されていると新規投稿ができない' do
        @record.date = '２０２０-０１-０１'
        @record.valid?
        expect(@record.errors.full_messages).to include("日付を入力してください")
      end
      it '時間が空だと新規投稿ができない' do
        @record.time = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("「何分サボった？」の欄はを入力してください")
      end
      it '時間が0未満だと新規投稿ができない' do
        @record.time = -1
        @record.valid?
        expect(@record.errors.full_messages).to include("「何分サボった？」の欄は0~1440分の範囲で記入してください。")
      end
      it '時間が1440より大きいと新規投稿ができない' do
        @record.time = 1441
        @record.valid?
        expect(@record.errors.full_messages).to include("「何分サボった？」の欄は0~1440分の範囲で記入してください。")
      end
      it '時間が全角で入力されていると新規投稿ができない' do
        @record.time = '１００'
        @record.valid?
        expect(@record.errors.full_messages).to include("「何分サボった？」の欄は0~1440分の範囲で記入してください。")
      end
      it '「何してた？」の欄が1000文字より多いと新規投稿ができない' do
        @record.skip = Faker::Lorem.characters(number: 1001)
        @record.valid?
        expect(@record.errors.full_messages).to include("「何してた？」の欄は1000文字以内で記入してください。")
      end
      it '「何をすべきだった？」の欄が1000文字より多いと新規投稿ができない' do
        @record.to_do = Faker::Lorem.characters(number: 1001)
        @record.valid?
        expect(@record.errors.full_messages).to include("「何をすべきだった？」1000文字以内で記入してください。")
      end
    end
  end
end
