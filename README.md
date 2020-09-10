# README

# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| pass_confirm      | string | null: false |
| kanji_family_name | string | null: false |
| kanji_first_name  | string | null: false |
| kana_family_name  | string | null: false |
| kana_first_name   | string | null: false |
| birth_year        | date   | null: false |
| birth_month       | date   | null: false |
| birth_day         | date   | null: false |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_name    | string     | null: false                    |
| explanation  | string     | null: false                    |
| category     | string     | null: false                    |
| item_status  | string     | null: false                    |
| shipping_fee | integer    | null: false                    |
| ship_from    | string     | null: false                    |
| num_days     | integer    | null: false                    |
| price        | integer    | null: false                    |
| sales_fee    | integer    | null: false                    |
| sales_profit | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchases


## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_num      | integer    | null: false                    |
| period_month  | date       | null: false                    |
| period_year   | date       | null: false                    |
| security_code | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| zip_code   | integer    | null: false                    |
| prefecture | string     | null: false                    |
| city       | string     | null: false                    |
| address1   | string     | null: false                    |
| address2   | string     |                                |
| phone_num  | integer    | null: false                    |
| purchase   | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase