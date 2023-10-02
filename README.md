## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | unique: true|
| encrypted_password | string | null: false |
| name_first         | string | null: false |
| name_last          | string | null: false |
| name_first_kana    | string | null: false |
| name_last_kana     | string | null: false |
| date_of_birth      | string | null: false |


### Association

- has_many :items
- has_many :buys
- has_one :ships

## items テーブル

| Column      | Type   | Options     |
| ------      | ------ | ----------- |
| name        | string | null: false |
| image       | text   | null: false |
| category    | string | null: false |
| condition   | string | null: false |
| description | text   | null: false |
| user_id     | references | null: false, foreign_key: true |
| ship_cost   | string | null: false |
| ship_area   | string | null: false |
| ship_day    | string | null: false |
| price       | string | null: false |

### Association

- has_many :buys
- belongs_to :users
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

| Column           | Type       | Options      |
| -------          | ---------- | -------------|
| post_code        | string     | null: false  |
| state            | string     | null: false  |
| city             | string     | null: false  |
| street_address   | string     | null: false  |
| telephone_number | string     | null: false  |

### Association

- has_one :buys
