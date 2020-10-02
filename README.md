# テーブル設計

## usersテーブル

| Column          | Type      | Options     |
| --------------- | --------- | ----------- |
| nickname        | string    | null: false |
| email           | string    | null: false |
| password        | string    | null: false |
| first_name      | string    | null: false |
| last_name       | string    | null: false |
| first_name_kana | string    | null: false |
| last_name_kana  | string    | null: false |
| b_day_year      | integer   | null: false |
| b_day_month     | integer   | null: false |
| b_day           | integer   | null: false |
 
<!-- b_dayはbirthdayです。 -->
<!-- email,password,確認用passwordに関しては"devise"ジェムを使用しています -->

### Association
- has_many : items
- has_one : order

## itemsテーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| name            | string     | null: false                     |
| description     | text       | null: false                     |
| category        | string     | null: false                     |
| status          | string     | null: false                     |
| delivery_burden | string     | null: false                     |
| shipment_source | string     | null: false                     |
| day_to_ship     | string     | null: false                     |
| price           | integer    | null: false,                    |
| user            | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_one : order

<!-- ※imageカラムはActiveStorageで実装する為、テーブル設計内の記述に含めていません。 -->

## ordersテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| card_num       | integer    | null: false                    |
| deadline_month | integer    | null: false                    |
| deadline_year  | integer    | null: false                    |
| s-code         | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one : delivery_address

## delivery_addressテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| p_code        | string     | null: false                    |
| prefectures   | string     | null: false                    |
| cities        | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_num     | integer    | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
- belongs_to : order