# アプリケーション概要
たまに犬の散歩を休憩したい方、体調が悪く散歩に行けない方、用事があっていつもの時間に散歩にいけない方等と犬の散歩を時々健康のためなどにしたい方、犬と触れ合いたい方を繋ぐアプリケーションです。

#　デプロイ済みのURL
https://pets42-28316.herokuapp.com/

# テスト用アカウント
- Basic認証のIDとパスワード
- ID:admin
- パスワード：1234

- 散歩提供者用のメールアドレスとパスワード
- メール：pets@pets
- パス：pets42

- 依頼者用のメールアドレスとパスワード
- メール：pets2@pets2
- パスワード：pets22

# 使用言語・技術
ruby '2.6.5'使用
画像保存はAWS使用


# 利用方法
このサイトでは散歩を他者へ依頼することを依頼といい、散歩をしたいとアピールすることを散歩提供としています。
top、詳細画面はどなたでも閲覧可能です。実際に散歩を依頼したい方、散歩を提供する方は登録が必要です。散歩を依頼するときには、犬の情報と場所を記載します。散歩を提供する方はいつが可能なのかを記載してもらいます。閲覧して散歩を依頼したければ提供者の詳細画面にて"依頼する"ボタンを押します。逆に散歩をしたい場合は"申し込む"ボタンを押します。散歩提供画面は必ずしも必要ではなく、ユーザー登録していれば、散歩依頼画面から"申し込む"ボタンを押すことができます。

# 目指した問題解決
どんなに大好きな飼い犬であっても時々散歩を代わって欲しい時があります。そんな時に気軽に依頼できるようボランティアサイトとして作りました。逆に健康志向が高くなっている昨今、一人で散歩するには味気ない時があります。また動物を飼いたくても飼えない事情がある方もいます。そんな方達の問題を解決できると思いこのアプリを制作しました。

# 要件定義
- https://docs.google.com/spreadsheets/d/1RFZMxVyK1bkM3oz6w6cX5IbA_J-OunxsDHxX7nZaDkE/edit#gid=282075926

# 実装した機能についての説明
- トップ画面はコンセプトや利用方法の説明があり、ここから依頼画面または散歩提供画面に遷移できます。
- 依頼画面、散歩提供画面では投稿が新しい順に左上から表示され、それぞれの投稿を押すと詳細画面に移行してどのよう な内容か確認できます。
- 詳細画面から依頼または申込みが可能です。
- 詳細画面までユーザー登録なしで閲覧可能ですが、依頼または申込にはユーザー登録が必要です。
- 詳細ページでは投稿者のマイページとリンクしているので、投稿者の名前をクリックすると投稿者のマイページへ遷移します。


# 実装予定の機能
- マイページからtipを渡せるようにします。
- マイページにコメント機能をつけ評価を得られるようにします。
- 日付,地域での検索機能を実装します。

# テーブル設計

## user テーブル

| Column             | Type       | Options                        |
| -----------        | ---------- | ------------------------------ |
| first_name         | string     | null: false                    |
| family_name        | string     | null: false                    |
| first_kana         | string     | null: false                    |
| family_kana        | string     | null: false                    |
| email              | string     | null: false                    |
| nickname           | string     | null: false                    |
| password           | string     | null: false                    |
| birth              | date       | null: false                    |

### Association

- has_one  :mypage
- has_many :jobs(散歩依頼)
- has_many :craving(散歩提供)
- has_many :job_histories(交渉)
- has_many :craving_histories（交渉）
- has_one  :address



## job テーブル

| Column                  | Type       |Options                         |
| --------------------    | ---------- | -------------------------      |
| title                   | text       | null:false                     |
| text                    | text       | null:false                     |
| dog_name                | string     | null:false                     |
| dog_bleed               | string     | null:false                     |
| dog_age                 | integer    | null:false                     |
| user                    | references | null: false,foreign_key:true   |
| working_hour_id         | integer    | null:false                     |
| working_date            | date       | null:false                     |
| working_time_id         | integer    | null:false                     |

### Association

- belongs_to :user
- has_one    :job_history

## JobHistory テーブル
| Column           | Type       | Options                        |
| -------------    | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| job              | references | null: false, foreign_key: true |


### Association

- belongs_to :job
- has_one :user,through: :job

## craving テーブル
| Column           | Type       | Options                        |
| ---------------  | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| title            | string     | null: false                    |
| text             | text       | null: false                    |
| experience_id    | integer    | null: false                    |
| working_hour_id  | integer    | null: false                    |
| working_date     | date       | null: false                    |
| working_time_id  | integer    | null: false                    |

### Association

- belongs_to :user
- has one :caving_history



## CravingHistory テーブル
| Column           | Type       | Options                        |
| -------------    | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| craving          | references | null: false, foreign_key: true |

### Association

- belongs_to :craving
- has_one :user,through: :craving

## mypage テーブル

| Column           | Type       | Options                        |
| -------------    | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| dog_love_id      | string     | null: false                    |
| text             | text       | null: false                    |
| job_id           | references | foreign_key: true              |
| craving_id       | references | foreign_key: true              |


### Association

belongs_to :user, optional: true


## address テーブル

| Column           | Type       | Options                        |
| -------------    | ---------- | ------------------------------ |
| user             | references | optional:true                  |
| zip              | string     | null: false                    |
| phone            | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |


### Association

belongs_to :user, optional: true

#### 以下はactive_hash使用
 working_hour,  
 prefecture,              
 working_time,
 experience, 
 dog_love

 #### 以下はactive_strage使用
- dog_picture
- craving_picture
- mypage_picture
 








