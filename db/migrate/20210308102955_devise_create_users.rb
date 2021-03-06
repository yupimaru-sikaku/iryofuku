# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      ## Database authenticatable

      # 病院名・もしくは法人名
      t.string :main_company_name,  null: false
      # 事業所名
      t.string :sub_company_name
      # サービス種別
      t.string :service_type,      null: false
      # サービス種別（その他）
      t.string :service_type_other
      # 病院もしくは法人の郵便番号
      t.integer :postal_code,        null: false
      # 病院もしくは法人の住所（市区町村）
      t.string :address_city,            null: false
      # 病院もしくは法人の住所（番地）
      t.string :address_street,            null: false
      # 病院もしくは法人の住所（建物名、部屋番号）
      t.string :address_building
      # 病院もしくは法人の担当者名
      t.string :human_name,         null: false
      # 病院もしくは法人の担当者電話番号
      t.string :phone_number,       null: false
      # 病院もしくは法人の担当者メールアドレス
      t.string :email,              null: false, default: ""
      # パスワード
      t.string :encrypted_password, null: false, default: ""


      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
