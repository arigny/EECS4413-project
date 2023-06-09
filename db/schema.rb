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

ActiveRecord::Schema[7.0].define(version: 2023_03_28_225832) do
  create_table "addresses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "street", limit: 100, null: false
    t.string "province", limit: 20, null: false
    t.string "country", limit: 20, null: false
    t.string "zip", limit: 20, null: false
    t.string "phone", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "bid", limit: 20, null: false
    t.string "name", limit: 60, null: false
    t.string "description", limit: 60, null: false
    t.string "category", limit: 60, null: false
    t.string "brand", limit: 60, null: false
    t.integer "quantity", null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.string "colour", limit: 60, null: false
    t.string "size", limit: 60, null: false
    t.decimal "weight", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "po_items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "bid", limit: 20, null: false
    t.string "name", limit: 20, null: false
    t.integer "price", null: false
    t.integer "quantity", null: false
    t.bigint "purchase_order_id"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_po_items_on_item_id"
    t.index ["purchase_order_id"], name: "index_po_items_on_purchase_order_id"
  end

  create_table "purchase_orders", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "lname", limit: 20, null: false
    t.string "fname", limit: 20, null: false
    t.string "status", limit: 20, null: false
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_purchase_orders_on_address_id"
  end

  create_table "reviews", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "rating", null: false
    t.text "comment", null: false
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_reviews_on_item_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email", null: false
    t.string "password", null: false
    t.boolean "admin", default: false, null: false
    t.bigint "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_users_on_address_id"
  end

  create_table "visit_events", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "ipaddress", limit: 20, null: false
    t.string "day", limit: 8, null: false
    t.string "bid", limit: 20, null: false
    t.string "eventtype", limit: 20, null: false
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_visit_events_on_item_id"
  end

  add_foreign_key "users", "addresses"
end
