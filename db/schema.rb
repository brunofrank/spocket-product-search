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

ActiveRecord::Schema.define(version: 2020_01_24_185827) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "addressable_type", limit: 50, null: false
    t.integer "addressable_id"
    t.string "zip", limit: 10, null: false
    t.string "address", limit: 100, null: false
    t.string "number", limit: 20
    t.string "more", limit: 100
    t.string "district", limit: 100, null: false
    t.bigint "city_id", null: false
    t.jsonb "data", default: "{}", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["addressable_id", "addressable_type"], name: "index_addresses_on_addressable_id_and_addressable_type"
    t.index ["city_id"], name: "index_addresses_on_city_id"
  end

  create_table "cest_ncm_links", force: :cascade do |t|
    t.bigint "cest_id", null: false
    t.bigint "ncm_id", null: false
    t.index ["cest_id", "ncm_id"], name: "index_cest_ncm_links_on_cest_id_and_ncm_id", unique: true
    t.index ["cest_id"], name: "index_cest_ncm_links_on_cest_id"
    t.index ["ncm_id"], name: "index_cest_ncm_links_on_ncm_id"
  end

  create_table "cests", force: :cascade do |t|
    t.string "code", limit: 20, null: false
    t.text "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_cests_on_code", unique: true
    t.index ["description"], name: "index_cests_on_description"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.bigint "state_id", null: false
    t.integer "ibge_code", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ibge_code"], name: "index_cities_on_ibge_code", unique: true
    t.index ["name"], name: "index_cities_on_name"
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "trade_name", limit: 100, null: false
    t.string "legal_name", limit: 100, null: false
    t.string "federal_tax_id", limit: 25
    t.string "state_tax_id", limit: 25
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "iso_code", limit: 5, null: false
    t.integer "ibge_code", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ibge_code"], name: "index_countries_on_ibge_code", unique: true
    t.index ["iso_code"], name: "index_countries_on_iso_code", unique: true
  end

  create_table "ncms", force: :cascade do |t|
    t.string "code", limit: 20, null: false
    t.string "description", null: false
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_ncms_on_code", unique: true
    t.index ["description"], name: "index_ncms_on_description"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "title", limit: 60, null: false
    t.text "description", null: false
    t.string "country", limit: 60, null: false
    t.jsonb "tags", default: []
    t.decimal "price", precision: 16, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "uf", limit: 2, null: false
    t.integer "ibge_code", null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_states_on_country_id"
    t.index ["ibge_code"], name: "index_states_on_ibge_code", unique: true
    t.index ["name"], name: "index_states_on_name"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "subdomain", limit: 20, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "traders", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "legal_name", limit: 100
    t.integer "person_type", default: 0, null: false
    t.string "federal_tax_id", limit: 25
    t.string "state_tax_id", limit: 25
    t.string "municipal_tax_id", limit: 25
    t.string "gender", limit: 1
    t.string "phone", limit: 25
    t.string "mobile", limit: 25
    t.string "email"
    t.date "birth_date"
    t.jsonb "data", default: {}, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "short", limit: 10, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "cest_ncm_links", "cests"
  add_foreign_key "cest_ncm_links", "ncms"
  add_foreign_key "cities", "states"
  add_foreign_key "states", "countries"
end
