# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_07_24_220713) do
  create_table "groups", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "group_type"
    t.string "description"
    t.string "cheque_name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "locations", charset: "utf8mb4", force: :cascade do |t|
    t.string "address"
    t.string "city"
    t.string "zipcode"
    t.string "state"
    t.string "phone"
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_locations_on_restaurant_id"
  end

  create_table "meals", charset: "utf8mb4", force: :cascade do |t|
    t.integer "attendance"
    t.date "meal_date"
    t.bigint "user_id", null: false
    t.bigint "restaurant_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_meals_on_location_id"
    t.index ["restaurant_id"], name: "index_meals_on_restaurant_id"
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "restaurants", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.string "password_digest", null: false
    t.integer "location_no", null: false
    t.time "from_time", null: false
    t.time "to_time", null: false
    t.float "avg_menu_price", null: false
    t.integer "percent_donation", null: false
    t.string "website", null: false
    t.string "logo", null: false
    t.string "monday", null: false
    t.string "tuesday", null: false
    t.string "wednesday", null: false
    t.string "thursday", null: false
    t.string "friday", null: false
    t.string "saturday", null: false
    t.string "sunday", null: false
    t.string "tax", null: false
    t.string "leader_arrival", null: false
    t.string "alcohol_sales", null: false
    t.string "coupons", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_restaurants_on_email", unique: true
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "firstname"
    t.string "lastname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "groups", "users"
  add_foreign_key "locations", "restaurants"
  add_foreign_key "meals", "locations"
  add_foreign_key "meals", "restaurants"
  add_foreign_key "meals", "users"
end
