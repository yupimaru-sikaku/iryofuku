class CreateGhs < ActiveRecord::Migration[6.0]
  def change
    create_table :ghs do |t|

      # 法人の名前（companiesと一緒）
      t.string :main_company_name
      # 事業所の名前
      t.string :sub_company_name
      # 事業所の郵便番号
      t.integer :postal_code
      # 事業所の住所
      t.string :address
      # 事業所の電話番号
      t.string :phone_number
      # 事業所のFAX
      t.string :fax_number
      # 事業所のメール
      t.string :email
      # 預り金総額
      t.integer :price_main
      # 預り金内訳1（項目）
      t.string :price_sub1
      # 預り金内訳1（値段）
      t.integer :price_sub_cost1
      # 預り金内訳2（項目）
      t.string :price_sub2
      # 預り金内訳2（値段）
      t.integer :price_sub_cost2
      # 預り金内訳3（項目）
      t.string :price_sub3
      # 預り金内訳3（値段）
      t.integer :price_sub_cost3
      # 預り金内訳4（項目）
      t.string :price_sub4
      # 預り金内訳4（値段）
      t.integer :price_sub_cost4
      # 預り金内訳5（項目）
      t.string :price_sub5
      # 預り金内訳5（値段）
      t.integer :price_sub_cost5
      # 築年
      t.integer :construction_year
      # 築月
      t.integer :construction_month
      # 築年数
      t.integer :building_age
      # 指定年
      t.integer :designated_year
      # 指定月
      t.integer :designated_month
      # 担当者名（companiesと一緒）
      t.string :human_name
      # 担当者電話番号（companiesと一緒）
      t.string :human_phone_number
      # 担当者メールアドレス（companiesと一緒）
      t.string :human_email
      # HPのURL
      t.string :hp_url
      # 事業所の定員数
      t.integer :capacity
      # 事業所の現在の空き人数
      t.integer :availability
      # 最寄り駅
      t.string :station
      # 最寄駅からの徒歩でかかる時間
      t.string :from_station
      # 入居可能な性別
      t.string :gender
      # 入居可能な障害区分
      t.string :disability
      # 入居できない障害種別
      t.string :valid_disability
      # 住居タイプ
      t.string :residential_style
      # 平日の日中
      t.string :staff_weekdaytime
      # 土日祝のスタッフ配置
      t.string :staff_holidaytime
      # バリアフリー
      t.string :barrier_free
      
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
