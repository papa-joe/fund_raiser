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

ActiveRecord::Schema[7.0].define(version: 2022_07_22_121959) do
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
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_restaurants_on_email", unique: true
  end

end
