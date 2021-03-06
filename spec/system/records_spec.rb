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
      sign_in(@user)
      # 記録を追加するためのモーダルを表示させるボタンがあることを確認する
      expect(page).to have_selector ".new-record-btn"
      # ボタンをクリックし、モーダルを表示させる
      find('div[class="new-record-btn"]').click
      page.evaluate_script('document.getElementById("new-record-modal").style.display = "block";')
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

RSpec.describe "記録編集", type: :system do
  before do
    @record1 = FactoryBot.create(:record)
    @record2 = FactoryBot.create(:record)
  end

  context '記録が編集できるとき' do
    it 'ログインしたユーザーは自分が追加した記録のみの編集ができる' do
      # 記録1を投稿したユーザーでログインする
      visit root_path
      expect(page).to have_content('ログイン')
      sign_in(@record1.user)
      # ユーザー詳細ページ内の事前に追加した記録のカードがあることを確認する
      expect(page).to have_selector ".card"
      # 編集ページへ遷移する
      visit edit_record_path(@record1)
      # すでに投稿済みの内容がフォームに入っていることを確認する
      expect(
        find('#record_date').value
      ).to eq @record1.date.strftime("%Y-%m-%d")
      expect(
        find('#record_time').value
      ).to eq @record1.time.to_s
      expect(
        find('#record_skip')
      ).to have_content(@record1.skip)
      expect(
        find('#record_to_do')
      ).to have_content(@record1.to_do)
      # 記録内容を編集する
      fill_in "record_time", with: @record1.time + 1
      fill_in "record_skip", with: "#{@record1.skip}+編集したテキスト"
      fill_in "record_to_do", with: "#{@record1.to_do}+編集したテキスト"
      # 編集してもRecordモデルのカウントは変わらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Record.count }.by(0)
      # ユーザー詳細ページに遷移したことを確認する
      expect(current_path).to eq user_path(@record1.user)
      # ユーザー詳細ページには先ほど変更した内容の記録が存在することを確認する(時間)
      expect(page).to have_content("#{@record1.time + 1}")
      # ユーザー詳細ページには先ほど変更した内容の記録が存在することを確認する(何をしていたか)
      expect(page).to have_content("#{@record1.skip}+編集したテキスト")
      # ユーザー詳細ページには先ほど変更した内容の記録が存在することを確認する(何をすべきだったか)
      expect(page).to have_content("#{@record1.to_do}+編集したテキスト")
    end
  end

  context '記録が編集できないとき' do
    it 'ログインしたユーザーは自分以外が追加した記録の編集画面には遷移できない' do
      # record1を追加したユーザーでログインする
      visit root_path
      expect(page).to have_content('ログイン')
      sign_in(@record1.user)
      # record2の編集ページへ遷移しようとすると、record1を追加したユーザーの詳細ページへ戻ってくる
      visit edit_record_path(@record2)
      expect(current_path).to eq user_path(@record1.user)
    end
    it 'ログインしていないと記録の編集画面には遷移できない' do
      visit root_path
      visit edit_record_path(@record1)
      expect(current_path).to eq new_user_session_path
    end
  end
end

RSpec.describe '記録削除', type: :system do
  before do
    @record1 = FactoryBot.create(:record)
    @record2 = FactoryBot.create(:record)
  end

  context '記録が削除できるとき' do
    it 'ログインしたユーザーは自らが追加した記録の削除ができる' do
      # record1を投稿したユーザーでログインする
      visit root_path
      expect(page).to have_content('ログイン')
      sign_in(@record1.user)
      # record1に「削除」ボタンがあることを確認する
      expect(page).to have_selector ".delete-link"
      # 記録を削除するとレコードの数が1減ることを確認する
      expect{
        find('a[class="delete-link"]').click
      }.to change { Record.count }.by(-1)
      # ユーザー詳細ページに遷移したことを確認する
      expect(current_path).to eq user_path(@record1.user)
      # ユーザー詳細ページにはrecord1の内容が存在しないことを確認する（日付）
      expect(page).to have_no_content("#{@record1.date}")
      # ユーザー詳細ページにはrecord1の内容が存在しないことを確認する（時間）
      expect(page).to have_no_content("#{@record1.time}")
      # ユーザー詳細ページにはrecord1の内容が存在しないことを確認する（何をしていたか）
      expect(page).to have_no_content("#{@record1.skip}")
      # ユーザー詳細ページにはrecord1の内容が存在しないことを確認する（何をすべきだったか）
      expect(page).to have_no_content("#{@record1.to_do}")
    end
  end

  context '記録が削除できないとき' do
    it 'ログインしたユーザーは自分以外が追加した記録の削除ができない' do
      # record1を投稿したユーザーでログインする
      visit root_path
      expect(page).to have_content('ログイン')
      sign_in(@record1.user)
      # record2のニックネームがユーザー詳細ページにない(ユーザー詳細ページにニックネームが表示されていないならば、record2のカードも表示されていない)
      expect(page).to have_no_content(@record2.user.nickname)
    end
    it 'ログインしていないと記録を削除することができない' do
      # 未ログインでrecord1のユーザー詳細ページにとんでもログインページにリダイレクトされる
      visit root_path
      visit user_path(@record1.user)
      expect(current_path).to eq new_user_session_path
    end
  end
end

RSpec.describe '記録検索', type: :system do
  before do
    @record1 = FactoryBot.create(:record)
    @record2 = FactoryBot.create(:record)
  end

  context '記録の検索ができるとき' do
    it 'ログインしたユーザーは自らが追加した記録を期間をしてして検索することができる' do
      # record1を投稿したユーザーでログインする
      visit root_path
      expect(page).to have_content('ログイン')
      sign_in(@record1.user)
      # ログインしたユーザーの詳細ページに日付を入力する欄があることを確認する
      expect(page).to have_content('表示を期間で絞る')
      # 日付を入力してSEARCHをクリックする
      fill_in 'start_period', with: @record1.date
      fill_in 'end_period', with: @record1.date
      find('input[value="SEARCH"]').click
      # 検索ページに遷移したことを確認する
      expect(current_path).to eq search_records_path
      # 検索ページにはログインしたユーザーが追加した記録があることを確認する
      expect(page).to have_selector ".chartjs-render-monitor"
      expect(page).to have_content(@record1.date.strftime("%Y/%m/%d"))
      expect(page).to have_content(@record1.time)
      expect(page).to have_content(@record1.skip)
      expect(page).to have_content(@record1.to_do)
    end
  end

  context '記録の検索ができないとき' do
    it 'ログインしたユーザーは自分以外が追加した記録を検索することができない' do
      # record1を投稿したユーザーでログインする
      visit root_path
      expect(page).to have_content('ログイン')
      sign_in(@record1.user)
      # record2の日付を入力してSEARCHをクリックする
      fill_in 'start_period', with: @record2.date
      fill_in 'end_period', with: @record2.date
      find('input[value="SEARCH"]').click
      # 検索ページに遷移したことを確認する
      expect(current_path).to eq search_records_path
      # 検索ページにはrecord2の記録の情報がないことを確認する(日付と時間は重なる可能性があるため除外する)
      expect(page).to have_no_content(@record1.skip)
      expect(page).to have_no_content(@record1.to_do)
    end
    it 'ログインしていないと記録を検索することができない' do
      # トップページから検索ページへ遷移する
      visit root_path
      visit search_records_path
      # ログインページへ遷移されることを確認する
      expect(current_path).to eq new_user_session_path
    end
  end
end

RSpec.describe '操作案内ページ' do
  before do
    @user = FactoryBot.create(:user)
  end
  
  context '操作案内ページが表示される' do
    it 'ログインしたユーザーは操作案内ページを見ることができる' do
      # 事前に登録したユーザーでログインする
      visit root_path
      expect(page).to have_content('ログイン')
      sign_in(@user)
      # ヘッダーの？ボタンをクリックする
      find('a[class="about-button"]').click
      # 現在のページが操作案内ページであることを確認する
      expect(current_path).to eq about_records_path
    end
    it 'ログインしていないユーザーでも操作案内ページを見ることができる' do
      # トップページのヘッダーから？ボタンをクリックする
      visit root_path
      find('a[class="about-button"]').click
      # 現在のページが操作案内ページであることを確認する
      expect(current_path).to eq about_records_path
    end
  end
end