# :orange_book:アプリ名

　Saborine (サボリーヌ)
<br><br>

# 概要
![メイン機能の画像](https://user-images.githubusercontent.com/73570767/102845371-c5b55580-4450-11eb-9aee-03b44da8dea1.jpg)<br>

- 今日の自身の行動を反省し、明日の行動を定量的かつ本質的に考えるために、サボったことを記録するアプリです。<br><br>

# 本番環境

<!-- ここにデプロイしたアプリのURLを貼る -->

- Eメール ここに登録したユーザーのEメールを貼る<br>
- パスワード ここに登録したユーザーのパスワードを貼る<br><br>

# 制作背景(意図)
　成果(勉強時間など)の記録だけではなく、サボっていた時間を記録して可視化し、サボりを意識できれば、生活の質が上がるのではないかと考えた上で、ネットで探してもそういったマイナスの事を記録するアプリがなかった為に本アプリを作成しました。
　サボりを記録すると生活の質が上がると考えられる理由は、明日の行動を定量的かつ本質的に考えることができるからです。
　以下の2つの例で説明します。
<br><br>
```
例1, ある日の合計サボり時間が60分だったとして、その60分間に「何をしていたのか」「何をした方が良かったのか」を記録しておけば、以下のことが考えられます。
・「明日は60分もサボらないようにしよう」(定量的)
・「サボった60分間は仮眠にあてたら後の学習は捗ったかな。学習時間は変わらないけど、明日は仮眠に60分充ててみよう。」(定量的)
```

```
例2, ある週の合計サボり時間が24時間近くあったとしたら、以下のことが考えられます。
・「学習をしなければいけないのに、今週も遊びの外出やネットサーフィンなどをしてしまった。本当にエンジニアを目指したいのかもう一度考えよう…」(本質的)
```
<br>
　以上の例から、サボりを視覚化できると明日の行動を具体的に決めたり、目標の再考など未来の自分について考える機会が作りやすくなるはずです。<br>
　また、サボりの定義は人それぞれですが、食事や入浴なども含めた学習時間以外の全てをサボり時間としても明日以降の行動についての参考になるはずです。<br>
　無意識にサボるとその日に対しての自分に後悔することがありますが、サボりの視覚化から考察ができれば、明日や未来の生活の質が上がるだけではなく、考える機会を作ることができた今日に対しての充実感も湧くのではないでしょうか。<br>
<br>
　本アプリが、人が考え行動を起こす前に、その人にとって適切な情報(ツール)を先回りして提供するものと評価してもらえたら幸いです。<br><br>

# ターゲットと目指した問題解決
　ターゲットは受験勉強や転職活動などの何か困難なことに挑戦している、比較的若い人々をメインに想定しています。

　目標を建てて学習は始めたが、学習している以外の時間が無意識であったり、あまり真剣に取り組めていない時があるという問題に対して、自分の行動をサボり時間の可視化によって見つめ直すツールとして解決します。
<br>

# DEMO
1. 新規登録ページへ遷移
![Videotogif](https://user-images.githubusercontent.com/73570767/102961884-d638ff00-4528-11eb-941e-cff0a5e94e8b.gif)<br><br>

2. 必要項目を入力してSign Upボタンをクリック
![Videotogif (1)](https://user-images.githubusercontent.com/73570767/102962554-704d7700-452a-11eb-842c-360f3f0e85ee.gif)<br><br>

3. 右下のボタンをクリックし、新規で記録を追加するためのモーダルを表示
![Videotogif (2)](https://user-images.githubusercontent.com/73570767/102962946-421c6700-452b-11eb-8251-d404634814f6.gif)<br><br>

4. 値を入力してSAVEボタンをクリック→記録のカードが追加され、棒グラフにも反映される
![Videotogif (3)](https://user-images.githubusercontent.com/73570767/102963717-2ca83c80-452d-11eb-96f9-5fa48bd40754.gif)<br><br>

``※バリデーションに引っかかった場合は、モーダルが再表示されます。投稿一覧ページに戻りたい場合はCANCELボタンをクリックしてモーダルをフェードアウトさせ、ヘッダーのニックネームをクリックすると戻れます。``<br><br>
 いくつか記録を追加すると以下画像の様になります
![メイン機能の画像](https://user-images.githubusercontent.com/73570767/102845371-c5b55580-4450-11eb-9aee-03b44da8dea1.jpg)<br><br>

5. 各カードの編集アイコンを押すと編集ページに遷移する
![Videotogif (4)](https://user-images.githubusercontent.com/73570767/102964521-3af75800-452f-11eb-90cb-efb815163432.gif)<br><br>

6. 値を変更してUPDATEボタンをクリックする→投稿情報が変更され、変更は棒グラフにも反映される
![Videotogif (5)](https://user-images.githubusercontent.com/73570767/102965167-a857b880-4530-11eb-9088-bfc44baa3fcd.gif)<br><br>

``※もし変更せずに投稿一覧ページに戻る場合は、ヘッダーのニックネームをクリックすると戻れます。``<br><br>

7. 各カードのゴミ箱アイコンをクリック→投稿が削除され、投稿一覧ページと棒グラフにも変更は反映される。
![Videotogif (6)](https://user-images.githubusercontent.com/73570767/102965980-45ffb780-4532-11eb-9f00-c0e1df61e633.gif)<br><br>


# 工夫したポイント
- トップページの文字にアニメーションを適用した点(初めて見る人にインパクトを与えたいため)<br>
- 記録の表示を1段3枚ずつのカード形式にした点(後から見返す時に見やすくするため)<br>
- 新規投稿や投稿の編集、投稿の削除への誘導をボタンやアイコンを使った点(ユーザーに直感的な操作ができることを感じて欲しかったため)<br>
- 棒グラフは1日単位でグループ化し、サボった時間を合計して表示した点(サボった時間を視覚的にわかりやすくするため)<br>

# 使用技術(開発環境)
- Ruby (2.6.5p114)<br>
- Ruby on Rails (6.0.3.4)<br>
- Chart.js (2.9.4)<br>
- jQuery (3.5.1)<br>
- Font Awesome (5.15.1)<br>
- VSCode（Visual Studio Code）<br>

# 課題や今後実装したい機能
- レスポンシブ対応
- 記録検索機能 ・・・表示させる投稿を日付で絞る。
- SPA(Single Page Application)にしたい ・・・Vue.jsを使用
- アプリの性質上、スマホで使えるようにした方がユーザーは楽なので、ios版を作成したい

# データベース設計

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