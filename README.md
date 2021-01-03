# :orange_book: アプリ名

　Saborine (サボリーヌ)
<br><br>

# :orange_book: 概要
![新トップページ紹介](https://user-images.githubusercontent.com/73570767/103475272-1fbdff80-4def-11eb-995f-a4efd4b1bd11.jpg)
<br>

- 今日の自身の行動を反省し、明日の行動を定量的かつ本質的に考えるために、サボったことを記録するアプリです。<br><br>

# :orange_book: 本番環境

https://saborine-s.herokuapp.com/

- Eメール ここに登録したユーザーのEメールを貼る<br>
- パスワード ここに登録したユーザーのパスワードを貼る<br><br>

# :orange_book: アプリ機能
1. ユーザー機能(新規登録・ログイン)<br><br>
ヘッダーの「新規登録」をクリックします。(既に登録している場合は「ログイン」をクリックしてログインページへ進んでください。ここでは割愛します。) <br><br>
![Videotogif](https://user-images.githubusercontent.com/73570767/102961884-d638ff00-4528-11eb-941e-cff0a5e94e8b.gif)<br><br>
必要項目を入力して「Sign Up」をクリックすると、ユーザー詳細ページへ遷移します。<br><br>
![Videotogif (1)](https://user-images.githubusercontent.com/73570767/102962554-704d7700-452a-11eb-842c-360f3f0e85ee.gif)<br><br>

2. 記録の追加<br><br>
画面右下にあるプラスボタンをクリックすると、記録を追加するためのモーダルが表示されます。<br><br>
![Videotogif (2)](https://user-images.githubusercontent.com/73570767/102962946-421c6700-452b-11eb-8251-d404634814f6.gif)<br><br>
値を入力して「SAVE」をクリックをクリックすると、記録のカードが追加され、棒グラフにも記録が反映されます。<br><br>
![Videotogif (3)](https://user-images.githubusercontent.com/73570767/102963717-2ca83c80-452d-11eb-96f9-5fa48bd40754.gif)<br><br>
:zap:**バリデーションに引っかかった場合は、モーダルが再表示されます。記録一覧ページ(ユーザー詳細ページ)に戻りたい場合は、「CANCEL」をクリックしてモーダルをフェードアウトさせ、ヘッダーのニックネームをクリックすると戻れます。**<br><br>
 いくつか記録を追加すると以下画像の様になります。<br><br>
![新トップページ紹介](https://user-images.githubusercontent.com/73570767/103475272-1fbdff80-4def-11eb-995f-a4efd4b1bd11.jpg)<br><br>

5. 各カードの編集アイコンを押すと編集ページに遷移する
![Videotogif (4)](https://user-images.githubusercontent.com/73570767/102964521-3af75800-452f-11eb-90cb-efb815163432.gif)<br><br>

6. 値を変更してUPDATEボタンをクリックする→投稿情報が変更され、変更は棒グラフにも反映される
![Videotogif (5)](https://user-images.githubusercontent.com/73570767/102965167-a857b880-4530-11eb-9088-bfc44baa3fcd.gif)<br><br>

``もし変更せずに投稿一覧ページに戻る場合は、ヘッダーのニックネームをクリックすると戻れます。``<br><br>

7. 各カードのゴミ箱アイコンをクリック→投稿が削除され、投稿一覧ページと棒グラフにも変更は反映される。
![Videotogif (6)](https://user-images.githubusercontent.com/73570767/102965980-45ffb780-4532-11eb-9f00-c0e1df61e633.gif)<br><br>


# :orange_book: 工夫したポイント
- トップページの文字にアニメーションを適用した点(初めて見る人にインパクトを与えたいため)<br>
- 記録の表示を1段3枚ずつのカード形式にした点(後から見返す時に見やすくするため)<br>
- 新規投稿や投稿の編集、投稿の削除への誘導をボタンやアイコンを使った点(ユーザーに直感的な操作ができることを感じて欲しかったため)<br>
- 棒グラフは1日単位でグループ化し、サボった時間を合計して表示した点(サボった時間を視覚的にわかりやすくするため)<br>

# :orange_book: 使用技術(開発環境)
- Ruby (2.6.5p114)<br>
- Ruby on Rails (6.0.3.4)<br>
- Chart.js (2.9.4)<br>
- jQuery (3.5.1)<br>
- Font Awesome (5.15.1)<br>
- VSCode（Visual Studio Code）<br>

# :orange_book: 課題や今後実装したい機能
- レスポンシブ対応
- 記録検索機能 ・・・表示させる投稿を日付で絞る。
- SPA(Single Page Application)にしたい ・・・Vue.jsを使用
- アプリの性質上、スマホで使えるようにした方がユーザーは楽なので、ios版を作成したい

# :orange_book: データベース設計

## ER図
![ER図](https://user-images.githubusercontent.com/73570767/102887086-9840ca00-4499-11eb-95a5-741a70107d36.png)

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Associations

- has_many :records

## recordsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| date   | date       | null: false                    |
| time   | integer    | null: false                    |
| skip   | string     | null: false                    |
| to_do  | string     |                                |
| user   | references | null: false, foreign_key: true |

### Associations

- belongs_to :user