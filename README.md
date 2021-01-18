# README

# 最終課題説明文
https://docs.google.com/document/d/1Vv0bwgpToxjGJw7cxpw0GXNC6vTnlywvidh_fp1d2DU/edit#heading=h.uc9r1bu1xm1f

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| kanji_family_name  | string | null: false |
| kanji_first_name   | string | null: false |
| kana_family_name   | string | null: false |
| kana_first_name    | string | null: false |
| birth_date         | date   | null: false |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| explanation   | text       | null: false                    |
| category_id   | integer    | null: false                    |
| status_id     | integer    | null: false                    |
| ship_fee_id   | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| num_day_id    | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| zip_code   | string     | null: false                    |
| prefecture | integer    | null: false                    |
| city       | string     | null: false                    |
| address1   | string     | null: false                    |
| address2   | string     |                                |
| phone_num  | string     | null: false                    |
| purchase   | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
