## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| name_first         | string | null: false |
| name_last          | string | null: false |
| name_first_kana    | string | null: false |
| name_last_kana     | string | null: false |
| birth_date         | date   | null: false |


### Association

- has_many :items
- has_many :buys


## items テーブル

| Column         | Type    | Options     |
| ------         | ------  | ----------- |
| name           | string  | null: false |
| category_id    | integer | null: false |
| condition_id   | integer | null: false |
| description    | text    | null: false |
| user           | references | null: false, foreign_key: true |
| ship_cost_id   | integer | null: false |
| ship_area_id   | integer | null: false |
| ship_day_id    | integer | null: false |
| price          | integer | null: false |
 
### Association

- belongs_to :buy
- belongs_to :user


## buys テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :ship

## ships テーブル

| Column           | Type       | Options      |
| -------          | ---------- | -------------|
| building_name    | string     |              |
| post_code        | string     | null: false  |
| ship_area_id     | integer    | null: false  |
| city             | string     | null: false  |
| street_address   | string     | null: false  |
| telephone_number | string     | null: false  |
| buy              | references | null: false, foreign_key: true |

### Association

- has_one :buy
