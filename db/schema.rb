# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_10_235832) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "company_name", null: false
    t.integer "postal_code", null: false
    t.string "address_city", null: false
    t.string "address_street", null: false
    t.string "address_building"
    t.string "name", null: false
    t.string "phone_number", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true
  end

  create_table "favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "iryo_id", null: false
    t.bigint "company_id", null: false
    t.string "is_contracted", default: "未", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_favorites_on_company_id"
    t.index ["iryo_id"], name: "index_favorites_on_iryo_id"
  end

  create_table "fukushis", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ghs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "main_company_name"
    t.string "sub_company_name"
    t.integer "postal_code"
    t.string "address"
    t.string "phone_number"
    t.string "fax_number"
    t.string "email"
    t.integer "price_main"
    t.string "price_sub1"
    t.integer "price_sub_cost1"
    t.string "price_sub2"
    t.integer "price_sub_cost2"
    t.string "price_sub3"
    t.integer "price_sub_cost3"
    t.string "price_sub4"
    t.integer "price_sub_cost4"
    t.string "price_sub5"
    t.integer "price_sub_cost5"
    t.integer "construction_year"
    t.integer "construction_month"
    t.integer "building_age"
    t.integer "designated_year"
    t.integer "designated_month"
    t.string "human_name"
    t.string "human_phone_number"
    t.string "human_email"
    t.string "hp_url"
    t.integer "capacity"
    t.integer "availability"
    t.string "station"
    t.string "from_station"
    t.string "gender"
    t.string "disability"
    t.string "valid_disability"
    t.string "valid_disability_other"
    t.string "residential_style"
    t.string "residential_style_other"
    t.string "staff_weekdaytime"
    t.string "staff_holidaytime"
    t.string "staff_weekdaytime_other"
    t.string "barrier_free"
    t.string "barrier_free_other"
    t.bigint "company_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_ghs_on_company_id"
  end

  create_table "iryos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "age", null: false
    t.string "classification_id", null: false
    t.string "disability_type_id", null: false
    t.string "prefecture_id", null: false
    t.text "city_ids"
    t.string "ward_id"
    t.string "service_type_id", null: false
    t.string "sex_id", null: false
    t.bigint "user_id"
    t.string "is_contracted", default: "未", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_iryos_on_user_id"
  end

  create_table "services", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "main_company_name", null: false
    t.string "sub_company_name"
    t.string "service_type", null: false
    t.string "service_type_other"
    t.integer "postal_code", null: false
    t.string "address_city", null: false
    t.string "address_street", null: false
    t.string "address_building"
    t.string "human_name", null: false
    t.string "phone_number", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "favorites", "companies"
  add_foreign_key "favorites", "iryos"
  add_foreign_key "ghs", "companies"
  add_foreign_key "iryos", "users"
end
