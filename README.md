#データベース設計

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
| time   | integer    | null: false                    |
| skip   | string     | null: false                    |
| to_do  | string     |                                |
| user   | references | null: false, foreign_key: true |

### Associations

- belongs_to :user