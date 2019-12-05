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

ActiveRecord::Schema.define(version: 2019_12_03_225350) do

  create_table "breweries", force: :cascade do |t|
    t.string "name"
    t.string "location"
  end

  create_table "user_breweries", force: :cascade do |t|
    t.integer "brewery_id"
    t.integer "user_id"
    t.index ["brewery_id"], name: "index_user_breweries_on_brewery_id"
    t.index ["user_id"], name: "index_user_breweries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "user_breweries", "breweries"
  add_foreign_key "user_breweries", "users"
end
