## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| name_first         | string | null: false |
| name_last          | string | null: false |
| name_first_kana    | string | null: false |
| name_last_kana     | string | null: false |


### Association

- has_many :items
- has_many :items, through: :buys
- has_one :ships

## items テーブル

| Column             | Type   | Options     |
| ------             | ------ | ----------- |
| item_information   | text   | null: false |
| item_condtion      | string | null: false |
| user_id            | string | null: false |
| ship_cost          | string | null: false |
| ship_area          | string | null: false |
| ship_day           | string | null: false |
| price              | string | null: false |

### Association

- belongs_to :users
- belongs_to :users, through: :buys
- belongs_to :ships

## buys テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| items_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :ships

## ships テーブル

| Column           | Type       | Options                        |
| -------          | ---------- | ------------------------------ |
| post code        | string     | null: false                    |
| state            | references | null: false, foreign_key: true |
| city             | references | null: false, foreign_key: true |
| street address   | string     | null: false                    |
| telephone number | string     | null: false                    |

### Association

- has_one :users
- has_many :items
- has_one :buys
