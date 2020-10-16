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
| birth           | date      | null: false |
 
<!-- birth　には誕生年月日の情報が入ります。 -->
<!-- email,password,確認用passwordに関しては"devise"ジェムを使用しています -->

### Association
- has_many : items
- has_many : orders

## itemsテーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| name               | string     | null: false                     |
| description        | text       | null: false                     |
| category_id        | integer    | null: false                     |
| status_id          | integer    | null: false                     |
| delivery_burden_id | integer    | null: false                     |
| shipment_source_id | integer    | null: false                     |
| day_to_ship_id     | integer    | null: false                     |
| price              | integer    | null: false,                    |
| user               | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_one : order
<!-- こちら後々のエラーの原因となってしまう可能性のあるため指摘させていただきます。
active hashの導入時のカラム名は「_id」を語尾につけるかと思いますので
category_idなどのようにカラム名を変更しましょう！！ -->
<!-- ※imageカラムはActiveStorageで実装する為、テーブル設計内の記述に含めていません。 -->
<!--category,status,delivery_burden,shipment_source,day_to_ship
<!-- 上記の５つのカラムはActiveHashで実現する為integer型になっています。 -->

## ordersテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

<!-- セキュリティの観点から、クレジットカードの情報はデータベースに直接保存しないようにしましょう。

また、今回のフリマアプリではカードを登録する際は購入の度に入力となり、データベースで管理しない設計を行います。
そのため、これらのカラムを用意しなくても大丈夫です！ --> -->

### Association
- belongs_to :user
- belongs_to :item
- has_one    :delivery_address

## delivery_addressテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| p_code           | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| cities           | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_num        | string     | null: false                    |
| order            | references | null: false, foreign_key: true |





<!-- こちら後々のエラーの原因となってしまう可能性のあるため指摘させていただきます。
active hashの導入時のカラム名は「_id」を語尾につけるかと思いますので
prefecture_idなどのようにカラム名を変更しましょう！！ -->
<!-- 都道府県のカラムはactive_hashで実装の予定のため、integer型にしましょう！ -->
<!-- 電話番号はstring型で実装しましょう。
integer型として保存すると整数型として保存される為、先頭の0がDB上で省略された状態で保存されてしまうためです。 -->

### Association
- belongs_to :order