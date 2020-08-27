# アプリケーション概要
たまに犬の散歩を休憩したい方、体調が悪く散歩に行けない方、用事があっていつもの時間に散歩にいけない方等と犬の散歩を時々健康のためなどにしたい方、犬と触れ合いたい方を繋ぐアプリケーションです。

#　デプロイ済みのURL

# テスト用アカウント
- basic認証
- ログイン用のアカウント　依頼する人
- ログイン用のアカウント　散歩提供する人

# 利用方法
このサイトでは散歩を他者へ依頼することを依頼といい、散歩をしたいとアピールすることを散歩提供としています。
top、詳細画面はどなたでも閲覧可能です。実際に散歩を依頼したい方、散歩を提供する方は登録が必要です。散歩を依頼するときには、犬の情報と場所を記載します。散歩を提供する方はいつが可能なのかを記載してもらいます。閲覧して散歩を依頼したければ提供者の詳細画面にて"依頼する"ボタンを押します。逆に散歩をしたい場合は"申し込む"ボタンを押します。散歩提供画面は必ずしも必要ではなく、ユーザー登録していれば、散歩依頼画面から"申し込む"ボタンを押すことができます。

# 目指した問題解決
どんなに大好きな飼い犬であっても時々散歩を代わって欲しい時があります。そんな時に気軽に依頼できるようボランティアサイトとして作りました。逆に健康志向が高くなっている昨今、一人で散歩するには味気ない時があります。また動物を飼いたくても飼えない事情がある方もいます。そんな方達の問題を解決できると思いこのアプリを制作しました。

# 要件定義

# 実装した機能についての説明
- トップ画面はコンセプトや利用方法の説明があり、ここから依頼画面または散歩提供画面に遷移できます。
- 依頼画面、散歩提供画面では投稿が新しい順に上から表示され、それぞれの投稿を押すと詳細画面に移行してどのような内容か確認できます。
- 詳細画面から依頼または申込みが可能です。
- 詳細画面までユーザー登録なしで閲覧可能ですが、依頼または申込にはユーザー登録が必要です。

# GIF

# 実装予定の機能
- ユーザーはマイページを一つ作ることができ、犬好きであることや自分のことをアピールすることができるようにします。
- マイページにコメント機能をつけ評価を得られるようにします。
- 詳細表示画面からユーザーのマイページへ遷移でき、どのようなユーザーかを確認できるようにします。



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
- has many :negotiations



## job テーブル

| Column                  | Type       |Options                         |
| --------------------    | ---------- | -------------------------      |
| title                   | text       | null:false                     |
| text                    | text       | null:false                     |
| dog_picture             | text       | null:false                     |
| dog_name                | string     | null:false                     |
| dog_bleed               | string     | null:false                     |
| dog_age                 | integer    | null:false                     |
| user                    | references | null: false,foreign_key:true   |
| working_hour_id         | integer    | null:false                     |
| working_date            | date       | null:false                     |
| prefecture_id           | integer    | null:false                     |
| city                    | string     | null:false                     |
| working_time_id         | integer    | null:false                     |

### Association

- belongs_to :user
- has_one    :situation
- has_one    :negotiation


## situation テーブル

| Column           | Type       | Options                        |
| -------------    | ---------- | ------------------------------ |
| working_hour_id  | integer    | null: false                    |
| working_date     | date       | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| working_time_id  | integer    | null: false                    |
| job              | references | null: false, foreign_key: true |
| craving          | references | null: false, foreign_key: true |

### Association

- belongs_to :job
- belongs_to :craving


## craving テーブル
| Column           | Type       | Options                        |
| ---------------  | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| title            | string     | null: false                    |
| text             | text       | null: false                    |
| experience_id    | integer    | null: false                    |
| working_hour_id  | integer    | null: false                    |
| working_date     | date       | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| working_time_id  | integer    | null: false                    |

### Association

- belongs_to :user
- has one :situation
- has one :negotiation

## negotiation テーブル
| Column           | Type       | Options                        |
| -------------    | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| job              | references | null: false, foreign_key: true |
| craving          | references | null: false, foreign_key: true |

### Association

- belongs_to :job
- belongs_to :craving
- belongs_to :user

## mypage テーブル

| Column           | Type       | Options                        |
| -------------    | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| nickname         | string     | null: false                    |
| dog_love_id      | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| text             | text       | null: false                    |
| picture          | text       |                                |

### Association

- belongs_to :user




#### 以下はactive_hash使用
 working_hour,  
 prefecture,              
 working_time,
 experience, 
    


## ローカルでの動作方法　あとで書き直し
- ruby 6.0.0使用
- 本番環境(Heroku)のURL
  https://furima-28316.herokuapp.com/

- Basic認証のIDとパスワード
- ID:admin
- パスワード：1234

- 出品者用のメールアドレスとパスワード
- メール：seller@seller
- パス：seller11

- 購入者用のメールアドレスとパスワード
- メール：buyer@buyer
- パス：buyer11






