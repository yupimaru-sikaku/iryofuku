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

ActiveRecord::Schema.define(version: 2021_03_29_235832) do

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "company_name", null: false
    t.integer "postal_code", null: false
    t.string "address", null: false
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
    t.bigint "company_id"
    t.bigint "sagaseru_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_favorites_on_company_id"
    t.index ["sagaseru_id"], name: "index_favorites_on_sagaseru_id"
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
    t.string "residential_style"
    t.string "staff_weekdaytime"
    t.string "staff_holidaytime"
    t.string "barrier_free"
    t.bigint "company_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_ghs_on_company_id"
  end

  create_table "kuraserus", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sagaserus", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "age", null: false
    t.string "classification_id", null: false
    t.string "disability_type_id", null: false
    t.string "osaka_city_id", null: false
    t.string "prefecture_id", null: false
    t.string "service_type_id", null: false
    t.string "sex_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "services", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "main_company_name", null: false
    t.string "sub_company_name"
    t.string "service_type", null: false
    t.integer "postal_code", null: false
    t.string "address_city", null: false
    t.string "address_street", null: false
    t.string "address_building", null: false
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

  add_foreign_key "favorites", "companies"
  add_foreign_key "favorites", "sagaserus"
  add_foreign_key "ghs", "companies"
end
