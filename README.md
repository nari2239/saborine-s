# アプリ名

Saborine (サボリーヌ)

# 概要
![トップページ画像](https://user-images.githubusercontent.com/73570767/102858465-ad076880-446d-11eb-82b1-cac02dc3cef5.gif)
![メイン機能の画像](https://user-images.githubusercontent.com/73570767/102845371-c5b55580-4450-11eb-9aee-03b44da8dea1.jpg)

・今日の自身の行動を定量的に反省し、明日の行動につなげるために、サボったことを記録するアプリです。<br>
・「ニックネーム、Eメールアドレス、パスワード(パスワード確認)」でユーザー情報の登録ができます。<br>
・「日付、サボった時間、何をしていたのか、何をするべきだったのか」の4点をモーダルから記録することができます。<br>
・記録はカード形式で表示されます。選択した日付を基準に降順で、1段3枚までカードが並べられます。<br>
・選択した日付の中で、それぞれの日付の合計サボり時間が棒グラフ化され、最新7日分が表示されます。<br>
・記録は後で編集することができます。編集が完了すると、記録が最新7日分の範囲内の場合、棒グラフにも変更が反映されます。<br>
・記録は削除することができます。削除が完了すると、削除した記録が最新7日分の範囲内の場合、棒グラフにも変更が反映されます。<br>

# 本番環境

<!-- ここにデプロイしたアプリのURLを貼る -->

・Eメール ここに登録したユーザーのEメールを貼る<br>
・パスワード ここに登録したユーザーのパスワードを貼る

# 制作背景(意図)

# DEMO

# 工夫したポイント

# 使用技術(開発環境)

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