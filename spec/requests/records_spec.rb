require 'rails_helper'

RSpec.describe "RecordsController", type: :request do
  before do
    @record = FactoryBot.create(:record)
    @user = @record.user_id
  end

  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
      get root_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストすると新規登録ボタンがある' do
      get root_path
      expect(response.body).to include("新規登録")
    end
    it 'indexアクションにリクエストするとログインボタンがある' do
      get root_path
      expect(response.body).to include("ログイン")
    end
  end

  describe "POST #create" do
    context '@recordが保存できたとき' do
      it 'データベースに値が保存される' do
        post records_path, params: { record: @record }
        expect(response.status).to eq 302
      end
    end

    context '@recordが保存できなかったとき' do
      it 'データベースに値が保存されない' do
        @record.time = nil
        post records_path, params: { record: @record }
        expect(response.status).to eq 302
      end
    end
  end

end
