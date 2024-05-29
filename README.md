# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| reading_last_name  | string | null: false |
| reading_first_name | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| description        | text       | null: false |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| delivery_id        | integer    | null: false |
| area_id            | integer    | null: false |
| time_id            | integer    | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true|

  <!-- ActiveHash使用 -->
  <!-- category_id,condition_id,delivery_id,area_id,time_id -->

### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item               | references | null: false, foreign_key: true|
| user               | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| post_code          | string     | null: false |
| area_id            | integer    | null: false |
| municipality       | string     | null: false |
| street             | string     | null: false |
| building           | string     |
| tel                | string     | null: false |
| purchase           | references | null: false, foreign_key: true|

  <!-- ActiveHash使用 -->
  <!-- area_id  -->

### Association
- belongs_to :purchase