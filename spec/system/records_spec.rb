require 'rails_helper'

RSpec.describe "記録追加", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @record = FactoryBot.build(:record)
  end

  context '記録が追加できるとき' do
    it 'ログインしたユーザーは記録を追加できる' do
      # トップページに遷移し、ログインページへ遷移するボタンがあることを確認する
      visit root_path
      expect(page).to have_content('ログイン')
      # ログインする
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq user_path(@user)
      # 記録を追加するためのモーダルを表示させるボタンがあることを確認する
      expect(page).to have_selector ".new-record-btn"
      # ボタンをクリックし、モーダルを表示させる
      find('div[class="new-record-btn"]').click
      # フォームに情報を入力する
      fill_in 'time', with: @record.time
      fill_in 'skip', with: @record.skip
      fill_in 'to_do', with: @record.to_do
      # 送信するとRecordモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Record.count }.by(1)
      # ユーザー詳細ページに遷移したことを確認する
      expect(current_path).to eq user_path(@user)
      # ユーザー詳細ページには先ほど追加した内容の棒グラフが存在することを確認する
      expect(page).to have_selector ".chartjs-render-monitor"
      # ユーザー詳細ページには先ほど追加した内容の記録が存在することを確認する(時間)
      expect(page).to have_content(@record.time)
      # ユーザー詳細ページには先ほど追加した内容の記録が存在することを確認する(何をしていたか)
      expect(page).to have_content(@record.skip)
      # ユーザー詳細ページには先ほど追加した内容の記録が存在することを確認する(何をすべきだったか)
      expect(page).to have_content(@record.to_do)
    end
  end

  context '記録が追加できないとき' do
    it 'ログインしていないとユーザー詳細ページに移動できないので記録を追加できない' do
      # トップページに遷移する
      visit root_path
      # 記録追加のモーダルを表示するボタンがない
      expect(page).to have_no_selector ".new-record-btn"
    end
  end
end
