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
| birth_date        | date   | null: false |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| explanation  | text       | null: false                    |
| category     | integer    | null: false                    |
| item_status  | integer    | null: false                    |
| shipping_fee | integer    | null: false                    |
| ship_from    | integer    | null: false                    |
| num_days     | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

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
| zip_code   | integer    | null: false                    |
| prefecture | string     | null: false                    |
| city       | string     | null: false                    |
| address1   | string     | null: false                    |
| address2   | string     |                                |
| phone_num  | integer    | null: false                    |
| purchase   | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase