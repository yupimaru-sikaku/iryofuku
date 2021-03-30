# テーブル設計

## users テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| main_company_name | string  | null: false | 病院名・もしくは法人名
| sub_company_name  | string  |             | 事業所名
| service_type_id   | integer | null: false | サービス種別
| service_sub_type  | string  |             | サービス種別（その他）
| postal_code       | integer | null: false | 病院もしくは法人の郵便番号
| address           | string  | null: false | 病院もしくは法人の住所
| human_name        | string  | null: false | 病院もしくは法人の担当者名
| phone_number      | string  | null: false | 病院もしくは法人の担当者電話番号
| email             | string  | null: false | 病院もしくは法人の担当者メールアドレス

### Association

 - has_many :kuraserus
 - belongs_to_active_hash :service_type

## companies テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| company_name | string  | null: false | 法人の名前
| postal_code  | integer | null: false | 法人の郵便番号
| address      | string  | null: false | 法人の住所
| name         | string  | null: false | 担当者名
| phone_number | string  | null: false | 担当者電話番号
| email        | string  | null: false | 担当者メールアドレス

### Association

## ghs テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| main_company_name    | string     | null: false                    | 法人の名前（companiesと一緒）
| sub_company_name     | string     | null: false                    | 事業所の名前
| postal_code          | integer    | null: false                    | 事業所の郵便番号
| address              | string     | null: false                    | 事業所の住所
| phone_number         | string     | null: false                    | 事業所の電話番号
| fax_number           | string     |                                | 事業所のFAX
| email                | string     | null: false                    | 事業所のメール
| price_main           | integer    | null: false                    | 預り金総額
| price_sub1           | string     |                                | 預り金内訳1(項目)
| price_sub_cost1      | integer    |                                | 預り金内訳1（値段）
| price_sub2           | string     |                                | 預り金内訳2(項目)
| price_sub_cost2      | integer    |                                | 預り金内訳2（値段）
| price_sub3           | string     |                                | 預り金内訳3(項目)
| price_sub_cost3      | integer    |                                | 預り金内訳3（値段）
| price_sub4           | string     |                                | 預り金内訳4(項目)
| price_sub_cost4      | integer    |                                | 預り金内訳4（値段）
| price_sub5           | string     |                                | 預り金内訳5(項目)
| price_sub_cost5      | integer    |                                | 預り金内訳5（値段）
| construction_year    | integer    | null: false                    | 指定年
| construction_month   | integer    | null: false                    | 指定月
| human_name           | string     | null: false                    | 担当者名（companiesと一緒）
| human_phone_number   | string     | null: false                    | 担当者電話番号（companiesと一緒）
| human_email          | string     | null: false                    | 担当者メールアドレス（companiesと一緒）
| hp_url               | string     |                                | HPのURL
| capacity             | integer    | null: false                    | 事業所の定員数
| availability         | integer    | null: false                    | 事業所の現在の空き人数
| station              | string     | null: false                    | 最寄り駅
| from_station      | string    | null: false                    | 最寄駅からの徒歩でかかる時間(選択で〜5分、〜10分、〜15分、〜20分、〜25分、〜30分、〜40分、40分以上)                   
| gender            | string    | null: false                    | 入居可能な性別(男、女、どちらでも可)
| disability        | string    |                                | 入居可能な障害区分(どれでも可、6、5、4、3、2、1 ←複数選択可)
| valid_disability  | string    |                                | 入居できない障害種別[なし、知的、精神、身体、難病、その他（記入）]
| residential_style | string    |                                | 住居タイプ[一軒家、マンション・アパート(1K)、マンション・アパート(2K以上)、その他(入力できる)]
| staff_weekdaytime | string    |                                | 平日の日中[利用者様が仕事に行ってる時間]のスタッフ配置 (有り、無し、その他(記入)]
| staff_holidaytime | string    |                                | 土日祝のスタッフ配置(有り[土、日、祝、全部をチェックで)、無し、その他(記入)]
| barrier_free      | string    |                                | バリアフリー(バリアフリー、バリアフリーじゃない、その他[記入])
| company              | references | null: false, foreign_key: true |


### Association

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