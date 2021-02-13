# テーブル設計

## users テーブル

| Column  | Type  | Options  |
| ------- | ----- | -------- |
|         |       |          |
|         |       |          |
|         |       |          |

### Association

 - has_many :kuraserus

## services テーブル

| Column  | Type  | Options  |
| ------- | ----- | -------- |
|         |       |          |
|         |       |          |
|         |       |          |

### Association

## kuraserus テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| age                | string  | null: false |
| classification_id  | integer | null: false |
| disability_type_id | integer | null: false |
| osaka_city_id      | integer | null: false |
| prefecture_id      | integer | null: false |
| service_type_id    | integer | null: false |
| sex_id             | integer | null: false |

### Association

 - belongs_to :user
 - belongs_to_active_hash :classification
 - belongs_to_active_hash :diability_type
 - belongs_to_active_hash :osaka_city
 - belongs_to_active_hash :prefecture
 - belongs_to_active_hash :service
 - belongs_to_active_hash :sex
 - belongs_to_active_hash :service_type

## sagaserus テーブル

| Column                  | Type    | Option      |
| ----------------------- | --------| ----------- |
| name                    | string  | null: false |
| price                   | integer | null: false |
| house_rent              | integer |             |
| food_expenses           | integer |             |
| daily_necessities_costs | integer |             |
| utility_costs           | integer |             |
| capacity                | integer | null: false |
| availability            | integer | null: false |
| phone_number            | string  |             |
| fax_number              | string  |             |
| email                   | string  |             |
| description             | text    |             |
| address                 | string  |             |
| station                 | string  | null: false |
| construction_year       | integer | null: false |
| construction_month      | integer | null: false |
| prefecture_id           | integer | null: false |
| osaka_city_id           | integer | null: false |
| gender_id               | integer | null: false |
| residential_style_id    | integer | null: false |
| barrier_free_id         | integer | null: false |
| use_holiday_id          | integer | null: false |
| gh_service_id           | integer | null: false |
| staff_time_id           | integer | null: false |
| from_station_id         | integer | null: false |
| flag                    | boolean | null: false |

### Association

 - belongs_to :user
 - belongs_to_active_hash :prefecture
 - belongs_to_active_hash :osaka_city
 - belongs_to_active_hash :gender
 - belongs_to_active_hash :residenial_style
 - belongs_to_active_hash :barrier_free
 - belongs_to_active_hash :use_holiday
 - belongs_to_active_hash :gh_service
 - belongs_to_active_hash :staff_time
 - belongs_to_active_hash :from_station