# アプリ名

Saborine (サボリーヌ)

# 概要
![メイン機能の画像](https://user-images.githubusercontent.com/73570767/102845371-c5b55580-4450-11eb-9aee-03b44da8dea1.jpg)<br>

・今日の自身の行動を反省し、明日の行動を定量的に考えるために、サボったことを記録するアプリです。<br>
・「ニックネーム、Eメールアドレス、パスワード(パスワード確認)」でユーザー情報の登録ができます。<br>
・「日付、サボった時間、何をしていたのか、何をするべきだったのか」の4点をモーダルから記録することができます。<br>
・記録はカード形式で表示されます。選択した日付を基準に降順で、1段3枚までカードが並べられます。<br>
・選択した日付の中で、それぞれの日付の合計サボり時間が棒グラフ化され、最新7日分が表示されます。<br>
・記録は後で編集することができます。編集が完了すると、記録が最新7日分の範囲内の場合、棒グラフにも変更が反映されます。<br>
・記録は削除することができます。削除が完了すると、削除した記録が最新7日分の範囲内の場合、棒グラフにも変更が反映されます。<br>

# 本番環境

<!-- ここにデプロイしたアプリのURLを貼る -->

・Eメール ここに登録したユーザーのEメールを貼る<br>
・パスワード ここに登録したユーザーのパスワードを貼る<br>

# 制作背景(意図)

# DEMO

# 工夫したポイント
・トップページの文字にアニメーションを適用した点(初めて見る人にインパクトを与えたいため)<br>
・記録の表示を1段3枚ずつのカード形式にした点(後から見返す時に見やすくするため)<br>
・新規投稿や投稿の編集、投稿の削除への誘導をボタンやアイコンを使った点(ユーザーに直感的な操作ができることを感じて欲しかったため)<br>
・棒グラフは1日単位でグループ化し、サボった時間を合計して表示した点(サボった時間を視覚的にわかりやすくするため)<br>

# 使用技術(開発環境)
・Ruby (2.6.5p114)<br>
・Ruby on Rails (6.0.3.4)<br>
・Chart.js (2.9.4)<br>
・jQuery (3.5.1)<br>
・Font Awesome (5.15.1)<br>
・VSCode（Visual Studio Code）<br>

# 課題や今後実装したい機能

# データベース設計

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