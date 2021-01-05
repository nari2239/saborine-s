# :orange_book: アプリ名

　**Saborine (サボリーヌ)**
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
1. **ユーザー機能(新規登録・ログイン)**<br><br>
ヘッダーの「新規登録」をクリックします。(既に登録している場合は「ログイン」をクリックしてログインページへ進んでください。ここでは割愛します。) <br><br>
![Videotogif](https://user-images.githubusercontent.com/73570767/102961884-d638ff00-4528-11eb-941e-cff0a5e94e8b.gif)<br><br>
必要項目を入力して「Sign Up」をクリックすると、ユーザー詳細ページへ遷移します。<br><br>
![Videotogif (1)](https://user-images.githubusercontent.com/73570767/102962554-704d7700-452a-11eb-842c-360f3f0e85ee.gif)<br><br>

2. **記録の追加**<br><br>
画面右下にあるプラスボタンをクリックすると、記録を追加するためのモーダルが表示されます。<br><br>
![Videotogif (2)](https://user-images.githubusercontent.com/73570767/102962946-421c6700-452b-11eb-8251-d404634814f6.gif)<br><br>
値を入力して「SAVE」をクリックをクリックすると、記録のカードが追加され、棒グラフにも記録が反映されます。<br><br>
![Videotogif (3)](https://user-images.githubusercontent.com/73570767/102963717-2ca83c80-452d-11eb-96f9-5fa48bd40754.gif)<br><br>
:zap:**バリデーションに引っかかった場合は、モーダルが再表示されます。記録一覧ページ(ユーザー詳細ページ)に戻りたい場合は、「CANCEL」をクリックしてモーダルをフェードアウトさせ、ヘッダーのニックネームをクリックすると戻ることができます。**<br><br>
 いくつか記録を追加すると以下画像の様になります。<br><br>
![新トップページ紹介](https://user-images.githubusercontent.com/73570767/103475272-1fbdff80-4def-11eb-995f-a4efd4b1bd11.jpg)<br><br>
:zap: **棒グラフは最新7日分まで表示されます。**<br><br>

3. **記録の変更**<br><br>
変更したい記録のカードにある編集アイコンをクリックすると、編集ページに遷移します。<br><br>
![Videotogif (4)](https://user-images.githubusercontent.com/73570767/102964521-3af75800-452f-11eb-90cb-efb815163432.gif)<br><br>
値を変更して「UPDATE」をクリックすると、記録が変更され、変更は棒グラフにも反映されます。<br><br>
![Videotogif (5)](https://user-images.githubusercontent.com/73570767/102965167-a857b880-4530-11eb-9088-bfc44baa3fcd.gif)<br><br>
:zap:**もし変更せずに記録一覧ページ(ユーザー詳細ページ)に戻りたい場合は、ヘッダーのニックネームをクリックすると戻ることができます。**<br><br>


4. **記録の削除**<br><br>
削除したい記録のカードにあるゴミ箱アイコンをクリックすると、記録が削除されます。記録の削除は棒グラフにも反映されます。<br><br>
![Videotogif (8)](https://user-images.githubusercontent.com/73570767/103476880-c0ff8280-4dfc-11eb-8a43-77511bfe02b3.gif)<br><br>

5. **記録の検索**<br><br>
記録一覧ページ(ユーザー詳細ページ)の「表示を期間で絞る」の横にある、日付入力欄に日付を入力することで、入力した期間内の記録のみを表示させることができます。日付を入力した後に「SEARCH」をクリックすると、入力した期間内の記録を表示したページに遷移します。<br><br>
![Videotogif (7)](https://user-images.githubusercontent.com/73570767/103476696-674a8880-4dfb-11eb-9e32-8910b9e84e59.gif)<br><br>
:zap: **入力した期間内の記録を表示したページは、記録一覧ページ(ユーザー詳細ページ)に似ていますが、モーダルを表示するためのプラスボタンを配置しておりません。記録一覧ページ(ユーザー詳細ページ)に戻りたい場合は、ヘッダーのニックネームをクリックすると戻ることができます。**<br><br>
:zap: **記録が1つもない場合、記録一覧ページ(ユーザー詳細ページ)に日付入力欄は表示されません。**<br><br>

# :orange_book: 作成背景
作成背景は以下2点に基づいています。
```
・ サボっていた時間を記録して可視化できる様になれば、今日の行動を見つめ直して、明日以降の行動の質が上がりやすくなるという私自身の体験があり、その体験をアプリケーションの形で表したかったこと

・ 私が調べた限りではサボり時間を記録するアプリケーションは存在しなかったこと
  (反対に、学習時間などの成果を記録するアプリケーションは多数存在している)
```
<br>
学習時間記録アプリは多数存在しており、使用しているユーザーも多いです。<br>しかし、学習への取り組みがなかなか改善できないという人も多いのではないかと私は思っています。<br>ここでは仮に、学習時間記録アプリを使っている人がおり、そのアプリを使用して「学習時間を増やさなければならない。」という反省が出てきたとします。<br>
結論から言うと、その人は学習時間を増やすことは難しいです。<br>
理由は、学習時間以外のことは何をしていたかについて正確には思い出せないからです。<br>
反対に、サボりを記録するならば、学習以外のどの時間をどれだけ減らすことができるかが考えやすくなります。<br>
また、サボり時間への意識を強めた方が、目標に向けての熱意がわかりやすく、現在設定している目標を目指すべきなのかどうかの判断もしやすくなります。<br>
以上が、概要部分で述べた「明日の行動を定量的かつ本質的に考える」という意味です。<br><br>

# :orange_book: 目指した問題解決
![ユーザーが抱える課題](https://user-images.githubusercontent.com/73570767/103485610-f2973e80-4e3a-11eb-9995-bf3f7bd77923.png)<br><br>

# :orange_book: 工夫したポイント
- トップページの文字にアニメーションを適用した点(初めて見る人にインパクトを与えたいため)<br>
- 記録の表示を1段3枚ずつのカード形式にした点(後から見返す時に見やすくするため)<br>
- 新規投稿や投稿の編集、投稿の削除への誘導をボタンやアイコンを使った点(ユーザーに直感的な操作ができることを感じて欲しかったため)<br>
- 棒グラフは1日単位でグループ化し、サボった時間を合計して表示した点(サボった時間を視覚的にわかりやすくするため)<br><br>

# :orange_book: 今後実装したい機能
- アプリ操作案内のモーダルを追加する ・・・SwiperJSを使用し、現在作成中
- グラフの表示を週次・月次・年次で切り替えられる様にする
- レスポンシブ対応
- SPA(Single Page Application)にしたい ・・・Vue.jsを使用
- アプリの性質上、スマホで使えるようにした方がユーザーは楽なので、ios版を作成したい<br><br>

# :orange_book: 使用技術(開発環境)
- Ruby (2.6.5p114)<br>
- Ruby on Rails (6.0.3.4)<br>
- Chart.js (2.9.4)<br>
- jQuery (3.5.1)<br>
- Font Awesome (5.15.1)<br>
- VSCode（Visual Studio Code）<br><br>

# :orange_book: ローカルでの使用方法
 1. $ cd アプリケーションを作成したいディレクトリ
 2. $ git clone https://github.com/nari2239/saborine-s.git
 3. $ cd saborine-s
 4. $ bundle install
 5. $ yarn install
 6. $ rails db:create<br>
 :zap:**2回目のクローンの場合は$ rails db:create実行前に $ rails db:dropを実行してください。**
 7. $ rails db:migrate
 8. $ rails db:seed<br>
 (ユーザーと20個の記録が初期データとして入ります。不要ならこのコマンドはスキップしても構いません。)
 9. $ rails s
 10. GoogleChromeで http://localhost:3000/ へアクセスしてください。<br>
 ```
 $ rails db:seedを実行した方は、ログインをクリックした後に、
 メールアドレス: user@test.com
 パスワード: testuser1
 を入力してログインしてください。
 ``` 
:zap:**アクセスした時に、Webpacker::Manifest::MissingEntryError
が出た場合は $ rails install yarn を実行してください**
<br><br>

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
| skip   | string     |                                |
| to_do  | string     |                                |
| user   | references | null: false, foreign_key: true |

### Associations

- belongs_to :user